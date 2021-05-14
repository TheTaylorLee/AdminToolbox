function Invoke-Monitor {

    <#
    .DESCRIPTION
    Monitor a down service until it is reachable. Provides time elapsed for the monitor and an audible indication when the services is back online.

    .Parameter Seconds
    Specify Seconds between tests

    .Parameter Service
    Specify the service to monitor

    .Parameter Port
    Specify the port to monitor

    .Example
    Invoke-Monitor -Service Microsoft.com -port 443

    .Link
    Get-Emote
    Test-Netconnection

    .Notes
    Requires the Admintoolbox.Fun module
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$Service,
        [Parameter(Mandatory = $true)]$Port,
        [Parameter(Mandatory = $true)]$Seconds
    )

    #Defined variables for writing to host later
    $Flip = Get-Emote -Name DoubleFlip
    $sunglasses = Get-Emote -Name sunglasses

    #Start Stopwatch
    $stopwatch = [system.diagnostics.stopwatch]::StartNew()

    do {
        #Write fail status and time elapsed
        Write-Host "Elapsed Time " -ForegroundColor Green -NoNewline
        Write-Host $stopwatch.Elapsed.Hours -ForegroundColor Yellow -NoNewline
        Write-Host ':' -ForegroundColor Yellow -NoNewline
        Write-Host $stopwatch.Elapsed.Minutes -ForegroundColor Yellow -NoNewline
        Write-Host ':' -ForegroundColor Yellow -NoNewline
        Write-Host $Stopwatch.Elapsed.Seconds -ForegroundColor Yellow -NoNewline
        Write-Host " (Hours:Minutes:Seconds)"
        Write-Host "It is Still Failing AHHHHHHHHHH! $Flip" -BackgroundColor black -ForegroundColor Red
        Write-Host " "

        #Test connection and Sleep
        $condition = Test-NetConnection -ComputerName $Service -Port $Port -InformationLevel Quiet -WarningAction 'SilentlyContinue'
        Start-Sleep -Seconds $seconds
    } until ($condition -like "True")

    #Reset the stopwatch
    $stopwatch.Stop()
    $stopwatch.Reset()

    #Write about success and play music
    Write-Host "Success" -ForegroundColor Green;
    Write-Host "$Sunglasses" -ForegroundColor Cyan
    Get-ImperialMarch
}