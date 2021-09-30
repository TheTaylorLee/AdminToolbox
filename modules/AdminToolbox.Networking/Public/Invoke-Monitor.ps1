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

    .Notes
    Requires the Admintoolbox.Fun module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-Monitor {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$Service,
        [Parameter(Mandatory = $true)]$Port,
        [Parameter(Mandatory = $true)]$Seconds
    )

    function Get-ImperialMarch {
        [console]::beep(440, 500)
        [console]::beep(440, 500)
        [console]::beep(440, 500)
        [console]::beep(349, 350)
        [console]::beep(523, 150)

        [console]::beep(440, 500)
        [console]::beep(349, 350)
        [console]::beep(523, 150)
        [console]::beep(440, 1000)

        [console]::beep(659, 500)
        [console]::beep(659, 500)
        [console]::beep(659, 500)
        [console]::beep(698, 350)
        [console]::beep(523, 150)

        [console]::beep(415, 500)
        [console]::beep(349, 350)
        [console]::beep(523, 150)
        [console]::beep(440, 1000)

        [console]::beep(880, 500)
        [console]::beep(440, 350)
        [console]::beep(440, 150)
        [console]::beep(880, 500)
        [console]::beep(830, 250)
        [console]::beep(784, 250)

        [console]::beep(740, 125)
        [console]::beep(698, 125)
        [console]::beep(740, 250)

        [console]::beep(455, 250)
        [console]::beep(622, 500)
        [console]::beep(587, 250)
        [console]::beep(554, 250)

        [console]::beep(523, 125)
        [console]::beep(466, 125)
        [console]::beep(523, 250)

        [console]::beep(349, 125)
        [console]::beep(415, 500)
        [console]::beep(349, 375)
        [console]::beep(440, 125)

        [console]::beep(523, 500)
        [console]::beep(440, 375)
        [console]::beep(523, 125)
        [console]::beep(659, 1000)

        [console]::beep(880, 500)
        [console]::beep(440, 350)
        [console]::beep(440, 150)
        [console]::beep(880, 500)
        [console]::beep(830, 250)
        [console]::beep(784, 250)

        [console]::beep(740, 125)
        [console]::beep(698, 125)
        [console]::beep(740, 250)

        [console]::beep(455, 250)
        [console]::beep(622, 500)
        [console]::beep(587, 250)
        [console]::beep(554, 250)

        [console]::beep(523, 125)
        [console]::beep(466, 125)
        [console]::beep(523, 250)

        [console]::beep(349, 250)
        [console]::beep(415, 500)
        [console]::beep(349, 375)
        [console]::beep(523, 125)

        [console]::beep(440, 500)
        [console]::beep(349, 375)
        [console]::beep(261, 125)
        [console]::beep(440, 1000)
    }

    function Get-Emote {

        [CmdletBinding()]
        [Alias('Emote')]
        param(
            [Parameter(Position = 0, Mandatory = $true)]
            [ValidateSet('Shrug', 'Flip', 'DoubleFlip', 'Sunglasses', 'Fight', 'Success')]
            $Name
        )

        $OutputEncoding = [System.Text.Encoding]::unicode

        switch ($Name) {
            { $_ -like "Shrug*" } { return $([char[]](0xAF, 0x5C, 0x5F, 0x28, 0x30C4, 0x29, 0x5F, 0x2F, 0xAF)) -join "" }
            { $_ -like "Flip*" } { return $([char[]](0x28, 0x256F, 0xB0, 0x25A1, 0xB0, 0xFF09, 0x256F, 0xFE35, 0x253B, 0x2501, 0x2501, 0x253B)) -join "" }
            { $_ -like "DoubleFlip*" } { return $([char[]](0x253B, 0x2501, 0x2501, 0x253B, 0xFE35, 0x20, 0x5C, 0x28, 0xB0, 0x25A1, 0xB0, 0x29, 0x2F, 0x20, 0xFE35, 0x20, 0x253B, 0x2501, 0x2501, 0x253B)) -join "" }
            { $_ -like "Sunglasses*" } { return $([char[]](0x28, 0x20, 0x2022, 0x5F, 0x2022, 0x29, 0x20, 0x28, 0x20, 0x2022, 0x5F, 0x2022, 0x29, 0x3E, 0x2310, 0x25A0, 0x2D, 0x25A0, 0x20, 0x28, 0x2310, 0x25A0, 0x5F, 0x25A0, 0x29)) -join "" }
            { $_ -like "Fight*" } { return $([char[]](0x28, 0xE07, 0x2022, 0x5F, 0x2022, 0x29, 0xE07)) -join "" }
        }
    }

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