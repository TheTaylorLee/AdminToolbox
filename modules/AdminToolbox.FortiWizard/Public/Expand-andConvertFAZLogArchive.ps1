<#
    .SYNOPSIS
    Expands and converts FortiAnalyzer log archive files to CSV format.

    .DESCRIPTION
    This function processes FortiAnalyzer log archive files (*.gz) in the current directory.
    It unzips each file and converts the content to CSV format using the Convert-LogToCSV function.

    .PARAMETER namelike
    Specifies the file name pattern to search for. Default value is 'FSFADOM*.gz'.

    .PARAMETER scanlines
    The number of lines to scan for headers. Default is 10.
    This is used to determine the unique headers in the log file where different log entry types may be present.

    .EXAMPLE
    Expand-andConvertFazLogArchive -verbose

    Processes all FSFADOM*.gz files in the current directory with verbose output.

    .EXAMPLE
    Expand-andConvertFazLogArchive -namelike 'CustomLog*.gz'

    Processes all CustomLog*.gz files in the current directory.
#>

function Expand-andConvertFAZLogArchive {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)][string]$namelike = 'FSFADOM*.gz',
        [Parameter(Mandatory = $false)][int]$scanlines = 10
    )

    # Get the current working directory as a string
    $Directory = Get-Location | Select-Object -ExpandProperty Path

    # Find the newest FSFADOM*.gz file in the current working directory
    $files = Get-ChildItem -Path $Directory -Filter $namelike
    if ($null -eq $files) {
        Write-Error "No files found in the current directory with a name like $namelike."
        return
    }

    foreach ($file in $files) {
        # Define paths for unzipping and output CSV file
        $unzippedFilePath = [System.IO.Path]::Combine($Directory, ($file.BaseName + '.tmp'))
        $csvFilePath = [System.IO.Path]::Combine($Directory, ($file.BaseName))

        # Unzip the .gz file
        Write-Verbose "Unzipping $($file.FullName)..."
        $gzStream = [System.IO.Compression.GzipStream]::new(
            [System.IO.File]::OpenRead($file.FullName),
            [System.IO.Compression.CompressionMode]::Decompress
        )

        $unzippedFileStream = [System.IO.File]::Create($unzippedFilePath)
        $buffer = New-Object byte[] 1024
        while (($bytesRead = $gzStream.Read($buffer, 0, $buffer.Length)) -gt 0) {
            $unzippedFileStream.Write($buffer, 0, $bytesRead)
        }

        $gzStream.Dispose()
        $unzippedFileStream.Dispose()

        Write-Verbose "Unzipped file to $unzippedFilePath"

        # Call Convert-LogToCSV function on the unzipped file
        if ($null -eq $scanlines) {
            $scanlines = 10
        }
        Convert-FAZLogToCSV -InputFile $unzippedFilePath -OutputFile $csvFilePath -scanlines $scanlines

        # Remove temp file
        Remove-Item $unzippedFilePath
    }
}
