<#
    .DESCRIPTION
    Downloads the Ookla Speedtest CLI zip, extracts it to the Downloads directory, and provides instructions for running the CLI.

    .EXAMPLE
    Get-SpeedTestCLI

    .Notes
    Speedtest CLI is subject to speedtest.net EULA, terms, and privacy policy. Not under the MIT license of the Admintoolbox.Networking module.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function get-speedtestcli {

    param(
    )

    $downloadUrl = 'https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip'
    $downloadPath = "$env:userprofile\downloads\ookla-speedtest-1.2.0-win64.zip"
    $extractPath = "$env:userprofile\downloads"

    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath
    Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

    Write-Warning "Speedtest CLI is subject to speedtest.net eula, terms, and privacy policy. It is not under the MIT license of the Admintoolbox.Networking module. You are responsible for compliance with their terms of use.
https://www.speedtest.net/about/eula
https://www.speedtest.net/about/terms
https://www.speedtest.net/about/privacy"
    Write-Output "Run the following to execute a speedtest $env:userprofile\downloads\speedtest.exe"
}