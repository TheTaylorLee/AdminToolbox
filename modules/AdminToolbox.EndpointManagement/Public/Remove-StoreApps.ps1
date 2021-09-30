<#
    .DESCRIPTION
    Removes sponsored Windows store apps and some microsoft apps

    -Microsot Apps Removed
        "Microsoft.BingNews"
        "Microsoft.BingWeather"
        "Microsoft.MicrosoftSolitaireCollection"
        "Microsoft.Office.OneNote"
        "Microsoft.Office.Sway"
        "Microsoft.RemoteDesktop"
        "Microsoft.WindowsCamera"
        "*Skype*"

    .EXAMPLE
    Remove-StoreApps

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-StoreApps {

    [CmdletBinding(SupportsShouldProcess)]

    Param (
    )

    #Check for Admin Privleges
    Get-Elevation

    $CrapApps = @(

        #Unnecessary Windows 10 AppX Apps
        "Microsoft.BingNews"
        "Microsoft.BingWeather"
        "Microsoft.MicrosoftSolitaireCollection"
        "Microsoft.Office.OneNote"
        "Microsoft.Office.Sway"
        "Microsoft.RemoteDesktop"
        "Microsoft.WindowsCamera"
        "*Skype*"

        #Sponsored Windows 10 AppX Apps
        "*EclipseManager*"
        "*ActiproSoftwareLLC*"
        "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
        "*Duolingo-LearnLanguagesforFree*"
        "*PandoraMediaInc*"
        "*CandyCrush*"
        "*Wunderlist*"
        "*Flipboard*"
        "*Twitter*"
        "*Facebook*"
        "*Spotify*"
        "*Minecraft*"
        "*Royal Revolt*"

    )

    foreach ($Crap in $CrapApps) {
        Get-AppxPackage -Name $Crap | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like $Crap | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
        Write-Output "Removing $Crap if exists."
    }

    Write-Host "Adding Registry key to prevent crap apps from returning" -ForegroundColor Green
    $registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    $registryOEM = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    If (!(Test-Path $registryPath)) {
        New-Item $registryPath
    }
    Set-ItemProperty $registryPath DisableWindowsConsumerFeatures -Value 1

    If (!(Test-Path $registryOEM)) {
        New-Item $registryOEM
    }
    Set-ItemProperty $registryOEM  ContentDeliveryAllowed -Value 0
    Set-ItemProperty $registryOEM  OemPreInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  PreInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  PreInstalledAppsEverEnabled -Value 0
    Set-ItemProperty $registryOEM  SilentInstalledAppsEnabled -Value 0
    Set-ItemProperty $registryOEM  SystemPaneSuggestionsEnabled -Value 0
}