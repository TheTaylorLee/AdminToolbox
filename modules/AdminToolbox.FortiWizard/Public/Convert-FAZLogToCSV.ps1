<#
    .SYNOPSIS
    Converts Fortinet FortiAnalyzer log files to CSV format.

    .DESCRIPTION
    This function processes large FortiAnalyzer log files and converts them to CSV format.
    It uses parallel processing with runspaces to efficiently handle large files and
    automatically determines the columns based on the log content.

    .PARAMETER InputFile
    The path to the FortiAnalyzer log file to be converted.

    .PARAMETER OutputFile
    The path where the converted CSV file should be saved.

    .PARAMETER scanlines
    The number of lines to scan for headers. Default is 10.
    This is used to determine the unique headers in the log file where different log entry types may be present.

    .EXAMPLE
    Convert-FAZLogToCSV -InputFile "input.log" -OutputFile "output.csv"
    Converts the specified FortiAnalyzer log file to CSV format.
#>
function Convert-FAZLogToCSV {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][string]$InputFile,
        [Parameter(Mandatory = $true)][string]$OutputFile,
        [Parameter(Mandatory = $false)][system.int32]$scanlines
    )

    $RunspacePool = $null
    $writer = $null
    $Jobs = @()

    try {
        Write-Verbose "Starting log conversion process"
        Write-Verbose "Configuring runspace pool..."
        # Initial setup for runspaces
        [int]$MaxThreads = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
        $RunspacePool = [runspacefactory]::CreateRunspacePool(1, $MaxThreads)
        $RunspacePool.Open()

        # Create pre-sized ArrayList for jobs
        $Jobs = [System.Collections.ArrayList]::new($MaxThreads)

        Write-Verbose "Scanning $scanlies lines for headers..."
        # Get total line count more efficiently
        $totalLines = [System.IO.File]::ReadAllLines($InputFile).Count
        $ChunkSize = [math]::Ceiling($totalLines / $MaxThreads)

        # Faster header scanning
        $headers = @{}
        if ($null -eq $scanlines) {
            [system.int32]$scanlines = 10
        }
        $headerScanLines = [System.IO.File]::ReadLines($InputFile) | Select-Object -First $scanlines
        foreach ($line in $headerScanLines) {
            $fields = $line.Trim('"').Split('","', [System.StringSplitOptions]::RemoveEmptyEntries)
            foreach ($field in $fields) {
                $field = $field.Trim().Trim('"')
                if ([string]::IsNullOrWhiteSpace($field)) { continue }

                $equalIndex = $field.IndexOf('=')
                if ($equalIndex -gt 0) {
                    $key = $field.Substring(0, $equalIndex).Trim()
                    $headers[$key.Substring(0, 1).ToUpper() + $key.Substring(1)] = $true
                }
                else {
                    $key = $field.Trim('"').Trim()
                    $headers[$key.Substring(0, 1).ToUpper() + $key.Substring(1)] = $true
                }
            }
        }

        $headerArray = $headers.Keys | Sort-Object

        Write-Verbose "Found $($headerArray.Count) unique headers"

        # Optimized processing scriptblock
        $scriptBlock = {
            param($InputFile, $StartLine, $LinesCount, $HeaderArray)

            $reader = $null
            try {
                $results = [System.Collections.ArrayList]::new($LinesCount)
                $buffer = [System.Collections.ArrayList]::new(1000)  # Buffer for better performance

                $reader = [System.IO.StreamReader]::new($InputFile)
                for ($i = 0; $i -lt $StartLine; $i++) {
                    $reader.ReadLine() | Out-Null
                }

                $processedLines = 0
                while ($processedLines -lt $LinesCount -and -not $reader.EndOfStream) {
                    $line = $reader.ReadLine()
                    $entry = @{}

                    # Pre-initialize all headers with empty strings
                    foreach ($header in $HeaderArray) {
                        $entry[$header] = ''
                    }

                    $fields = $line.Trim('"').Split('","', [System.StringSplitOptions]::RemoveEmptyEntries)
                    foreach ($field in $fields) {
                        $equalIndex = $field.IndexOf('=')
                        if ($equalIndex -gt 0) {
                            $key = $field.Substring(0, $equalIndex).Trim()
                            $value = $field.Substring($equalIndex + 1).Trim('"').Trim()
                            $properKey = $key.Substring(0, 1).ToUpper() + $key.Substring(1)
                            $entry[$properKey] = $value
                        }
                    }

                    $values = foreach ($header in $HeaderArray) {
                        """$($entry[$header])"""
                    }
                    $null = $buffer.Add(($values -join ','))

                    if ($buffer.Count -ge 1000) {
                        $null = $results.AddRange($buffer)
                        $buffer.Clear()
                    }

                    $processedLines++
                }

                if ($buffer.Count -gt 0) {
                    $null = $results.AddRange($buffer)
                }

                return $results
            }
            finally {
                if ($reader) { $reader.Dispose() }
                $results.Clear()
                $buffer.Clear()
                [System.GC]::Collect()
            }
        }

        Write-Verbose "Creating processing jobs..."
        Write-Verbose "Processing $totalLines lines in chunks of $ChunkSize"

        # Create jobs for each chunk
        $startLine = 0  # Initialize outside loop
        $jobCount = 0
        while ($startLine -lt $totalLines) {
            $jobCount++
            Write-Verbose "Creating job $jobCount for lines $startLine to $($startLine + $ChunkSize)"

            $powershell = [powershell]::Create().AddScript($scriptBlock)
            $powershell.RunspacePool = $RunspacePool

            $null = $powershell.AddArgument($InputFile)
            $null = $powershell.AddArgument($startLine)
            $null = $powershell.AddArgument($ChunkSize)
            $null = $powershell.AddArgument($headerArray)

            $null = $Jobs.Add(@{
                    PowerShell = $powershell
                    Handle     = $powershell.BeginInvoke()
                })

            $startLine = $startLine + $ChunkSize  # Direct addition instead of +=
        }

        Write-Verbose "Writing headers to output file..."
        # Write headers and use buffered writing for output
        $writer = [System.IO.StreamWriter]::new($OutputFile)
        $writer.WriteLine($headerArray -join ',')

        Write-Verbose "Processing results from $($Jobs.Count) jobs..."
        Write-Verbose "Subsequent jobs will be almost immediate after the first job completes."
        $processedJobs = 0
        foreach ($job in $Jobs) {
            try {
                $processedJobs++
                Write-Verbose "Processing results from job $processedJobs of $($Jobs.Count)"
                $results = $job.PowerShell.EndInvoke($job.Handle)
                $writer.WriteLine([string]::Join([Environment]::NewLine, $results))
            }
            finally {
                $job.PowerShell.Dispose()
                $results = $null
            }
        }
    }

    finally {
        Write-Verbose "Cleaning up resources..."
        if ($writer) { $writer.Dispose() }
        if ($RunspacePool) {
            $RunspacePool.Close()
            $RunspacePool.Dispose()
        }

        # Clear collections
        $Jobs.Clear()
        $headers.Clear()
        $headerArray = $null

        # Force garbage collection
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        Write-Verbose "Conversion process completed for $outputFile"
    }
}