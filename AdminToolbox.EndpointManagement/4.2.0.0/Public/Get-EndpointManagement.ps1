#Get commands for the Module
function Get-EndpointManagement {

    #Get-IntroEM

    Write-Host " "
    Write-Host "Chocolatey Functions"                                                                      -Foregroundcolor green
    Write-Host "Get-ChocoInstalls          ..Gets Chocolatey Installs"                                     -Foregroundcolor cyan
    Write-Host "Get-ChocoOutdated          ..Gets Outdated Chocolatey Installs"                            -Foregroundcolor cyan
    Write-Host "Install-Chocolatey         ..Installs Chocolatey"                                          -Foregroundcolor cyan
    Write-Host "Install-ChocoPackages      ..Installs Choco Software Packages"                             -Foregroundcolor cyan
    Write-Host "Invoke-ChocoUpgrade        ..Invokes upgrades for chocolatey packages"                     -Foregroundcolor cyan
    Write-Host " "

    Write-Host "Other Functions"                                                                           -Foregroundcolor green
    Write-Host "Add-LocalAdmin             ..Adds a local admin to the endpoint"                           -Foregroundcolor cyan
    Write-Host "Disable-Cortana            ..Disables Cortana Functionality"                               -Foregroundcolor cyan
    Write-Host "Disable-Firewall           ..Disables windows builtin firewall"                            -Foregroundcolor cyan
    Write-Host "Disable-PasswordPeek       ..Disables windows password peek"                               -Foregroundcolor cyan
    Write-Host "Disable-ShakeToMinimize    ..Disables Annoying Shake to Minimize"                          -Foregroundcolor cyan
    Write-Host "Disable-Standby            ..Disables Hibernate and Sleep"                                 -Foregroundcolor cyan
    Write-Host "Dismount-ProfileRegistry   ..Dismounts local users registry hive"                          -Foregroundcolor cyan
    Write-Host "Enable-Firewall            ..Enables windows builtin firewall"                             -Foregroundcolor cyan
    Write-Host "Enable-RSATFeatures        ..Enables Windows 10 RSAT Features"                             -Foregroundcolor cyan
    Write-Host "Get-Applications           ..Gets a list of installed Applications"                        -Foregroundcolor cyan
    Write-Host "Get-Management             ..Gets Computer Management for another endpoint"                -Foregroundcolor cyan
    Write-Host "Get-MonitorSizes           ..Gets connected monitors"                                      -Foregroundcolor cyan
    Write-Host "Get-PCInfo                 ..Gets info on targeted PC"                                     -Foregroundcolor cyan
    Write-Host "Get-PowerShell7            ..Gets and installs Powershell 7"                               -Foregroundcolor cyan
    Write-Host "Join-Domain                ..Joins Endpoint to a Domain"                                   -Foregroundcolor cyan
    Write-Host "Mount-ProfileRegistry      ..Mounts local users registry hive"                             -Foregroundcolor cyan
    Write-Host "Remove-Shortcuts           ..Removes Desktop Shortcuts"                                    -Foregroundcolor cyan
    Write-Host "Remove-StoreApps           ..Removes crap store apps"                                      -Foregroundcolor cyan
    Write-Host "Remove-Tiles               ..Removes start menu tiles"                                     -Foregroundcolor cyan
    Write-Host "Repair-DomainJoin          ..Repairs lost Domain Membership"                               -Foregroundcolor cyan
    Write-Host "Reset-EndpointPassword     ..Reset the endpoints domain password to repair trust"          -Foregroundcolor cyan
    Write-Host "Restart-Endpoint           ..Restart the endpoint after X provided hours"                  -Foregroundcolor cyan
    Write-Host "Set-UAC                    ..Sets the UAC state"                                           -Foregroundcolor cyan
    Write-Host "Uninstall-Application      ..Uninstalls a selected Application"                            -Foregroundcolor cyan
    Write-Host " "

    Write-Host "Printer Functions"                                                                         -Foregroundcolor green
    Write-Host "Get-Printbackup            ..Gets spreadsheet of printer configs"                          -Foregroundcolor cyan
    Write-Host "Get-Printers               ..Gets List of Printers"                                        -Foregroundcolor cyan
    Write-Host "Get-PrintManagement        ..Gets Print Management Console"                                -Foregroundcolor cyan
    Write-Host "Remove-PrintQueue          ..Removes Stale Print Jobs"                                     -Foregroundcolor cyan
}