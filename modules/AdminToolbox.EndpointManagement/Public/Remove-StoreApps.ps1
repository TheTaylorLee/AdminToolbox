<#
    .DESCRIPTION
    Removes specified Windows store apps.

    .PARAMETER disablesponsoredapps
    Disables sponsored Windows Store apps from returning.

    .PARAMETER storeapps
    An array of Windows Store apps to remove. Use wildcards (*) to match partial names.

    .EXAMPLE
    $StoreApps = @(

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

    Remove-StoreApps -storeapps $storeapps -disablesponsoredapps -verbose

    Removes all apps in the array.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-StoreApps {

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $false)][switch]$disablesponsoredapps,
        [Parameter(Mandatory = $true)][string[]]$storeapps
    )

    #Check for Admin Privleges
    Get-Elevation

    $StoreApps = @(

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

    foreach ($app in $StoreApps) {
        Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like $app | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
        Write-Output "Removing $app if exists."
    }

    if ($disablesponsoredapps) {

        Write-Host "Adding Registry keys to prevent Sponsored Store apps from returning" -ForegroundColor Green
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
}