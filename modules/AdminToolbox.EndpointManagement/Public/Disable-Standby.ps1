<#
    .DESCRIPTION
    Disables standby, sleep, and hibernate

    .EXAMPLE
    Disable-Standby

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Disable-Standby {

    [CmdletBinding()]
    [Alias("Disable-Sleep")]
    param (
    )

    Write-Host "Creating Power Scheme Standby Off!" -ForegroundColor Green

    #Get Path to Powercfg
    $getmod = Get-Module Admintoolbox.EndpointManagement
    $trim = $getmod.path -replace ("Admintoolbox.EndpointManagementManifest.psm1", "")
    $Modpath = $trim + '\support\'

    #Import Powercfg
    powercfg.exe /import $Modpath\StandbyOff.pow b65fca42-8671-46eb-8e87-953a344161dd

    #Set PowerConfig
    powercfg.exe /SETACTIVE b65fca42-8671-46eb-8e87-953a344161dd

    #Remove Hiberfile.sys if possible
    Remove-Item c:\hiberfile.sys -Force -ErrorAction SilentlyContinue
}