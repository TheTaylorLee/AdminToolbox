#Get commands for the Module
function Get-EndpointManagement {

    #Get-IntroEM

    Write-Host " "
    Write-Host "Chocolatey Functions"                                                                      -ForegroundColor green
    Write-Host "Get-ChocoInstalls          ..Gets Chocolatey Installs"                                     -ForegroundColor cyan
    Write-Host "Get-ChocoOutdated          ..Gets Outdated Chocolatey Installs"                            -ForegroundColor cyan
    Write-Host "Install-Chocolatey         ..Installs Chocolatey"                                          -ForegroundColor cyan
    Write-Host "Install-ChocoPackages      ..Installs Choco Software Packages"                             -ForegroundColor cyan
    Write-Host "Invoke-ChocoUpgrade        ..Invokes upgrades for chocolatey packages"                     -ForegroundColor cyan
    Write-Host " "

    Write-Host "Other Functions"                                                                           -ForegroundColor green
    Write-Host "Add-LocalAdmin             ..Adds a local admin to the endpoint"                           -ForegroundColor cyan
    Write-Host "Disable-Cortana            ..Disables Cortana Functionality"                               -ForegroundColor cyan
    Write-Host "Disable-Firewall           ..Disables windows builtin firewall"                            -ForegroundColor cyan
    Write-Host "Disable-PasswordPeek       ..Disables windows password peek"                               -ForegroundColor cyan
    Write-Host "Disable-ShakeToMinimize    ..Disables Annoying Shake to Minimize"                          -ForegroundColor cyan
    Write-Host "Disable-Standby            ..Disables Hibernate and Sleep"                                 -ForegroundColor cyan
    Write-Host "Dismount-ProfileRegistry   ..Dismounts local users registry hive"                          -ForegroundColor cyan
    Write-Host "Enable-Firewall            ..Enables windows builtin firewall"                             -ForegroundColor cyan
    Write-Host "Enable-RSATFeatures        ..Enables Windows 10 RSAT Features"                             -ForegroundColor cyan
    Write-Host "Get-Applications           ..Gets a list of installed Applications"                        -ForegroundColor cyan
    Write-Host "Get-Management             ..Gets Computer Management for another endpoint"                -ForegroundColor cyan
    Write-Host "Get-MonitorSizes           ..Gets connected monitors"                                      -ForegroundColor cyan
    Write-Host "Get-PCInfo                 ..Gets info on targeted PC"                                     -ForegroundColor cyan
    Write-Host "Get-PowerShell7            ..Gets and installs Powershell 7"                               -ForegroundColor cyan
    Write-Host "Join-Domain                ..Joins Endpoint to a Domain"                                   -ForegroundColor cyan
    Write-Host "Mount-ProfileRegistry      ..Mounts local users registry hive"                             -ForegroundColor cyan
    Write-Host "Remove-Shortcuts           ..Removes Desktop Shortcuts"                                    -ForegroundColor cyan
    Write-Host "Remove-StoreApps           ..Removes crap store apps"                                      -ForegroundColor cyan
    Write-Host "Remove-Tiles               ..Removes start menu tiles"                                     -ForegroundColor cyan
    Write-Host "Repair-DomainJoin          ..Repairs lost Domain Membership"                               -ForegroundColor cyan
    Write-Host "Reset-EndpointPassword     ..Reset the endpoints domain password to repair trust"          -ForegroundColor cyan
    Write-Host "Restart-Endpoint           ..Restart the endpoint after X provided hours"                  -ForegroundColor cyan
    Write-Host "Set-UAC                    ..Sets the UAC state"                                           -ForegroundColor cyan
    Write-Host "Uninstall-Application      ..Uninstalls a selected Application"                            -ForegroundColor cyan
    Write-Host " "

    Write-Host "Printer Functions"                                                                         -ForegroundColor green
    Write-Host "Get-Printbackup            ..Gets spreadsheet of printer configs"                          -ForegroundColor cyan
    Write-Host "Get-Printers               ..Gets List of Printers"                                        -ForegroundColor cyan
    Write-Host "Get-PrintManagement        ..Gets Print Management Console"                                -ForegroundColor cyan
    Write-Host "Remove-PrintQueue          ..Removes Stale Print Jobs"                                     -ForegroundColor cyan
    Write-Host " "

    Write-Host "Reporting Functions"                                                                        -ForegroundColor green
    Write-Host "Get-RebootEvents           ..Gets Server reboot history"                                    -ForegroundColor cyan
    Write-Host "Get-RemoteDesktopLogins    ..Gets Remote Desktop Access History"                            -ForegroundColor cyan

}