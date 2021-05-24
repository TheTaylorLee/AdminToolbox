function Get-ActiveDirectory {

    Get-IntroAD

    Write-Host "Active Directory Functions"                                                                    -ForegroundColor green
    Write-Host "Get-ADInfo                 ..Gets info on local domain"                                        -ForegroundColor cyan
    Write-Host "Get-DCLockoutEvents       ..Gets endpoints causing user lockouts"                             -ForegroundColor cyan
    Write-Host "Get-EndpointReport         ..Gets a Report of AD Endpoints"                                    -ForegroundColor cyan
    Write-Host "Get-GroupMembers           ..Gets AD groups and their Members"                                 -ForegroundColor cyan
    Write-Host "Get-GroupMemberships       ..Gets AD Users and their group Membership"                         -ForegroundColor cyan
    Write-Host "Get-LockedAccounts         ..Gets locked AD accounts"                                          -ForegroundColor cyan
    Write-Host "Get-PasswordExpired        ..Gets AD accounts with Expired Passwords"                          -ForegroundColor cyan
    Write-Host "Get-ReplicationStatus      ..Gets AD Site Replication Status"                                  -ForegroundColor cyan
    Write-Host "Get-UserReport             ..Gets a Report of AD Users"                                        -ForegroundColor cyan
    Write-Host "Import-ActiveDirectory     ..Imports AD module using powershell method if native import fails" -ForegroundColor cyan
    Write-Host "Set-Password               ..Sets an AD Password"                                              -ForegroundColor cyan
    Write-Host "Start-Replication          ..Starts AD Sites Replication"                                      -ForegroundColor cyan
    Write-Host "Unlock-Account             ..Unlocks an AD account"                                            -ForegroundColor cyan
    Write-Host "Unlock-AllAccounts         ..Unlocks all AD accounts"                                          -ForegroundColor cyan
    Write-Host " "
}