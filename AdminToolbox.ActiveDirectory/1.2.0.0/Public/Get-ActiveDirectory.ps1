function Get-ActiveDirectory {

    Get-IntroAD

    Write-Host "Active Directory Functions"                                                                -Foregroundcolor green
    Write-Host "Get-ADInfo                 ..Gets info on local domain"                                    -Foregroundcolor cyan
    Write-Host "Get-DCLockoutEvents2       ..Gets endpoints causing user lockouts"                         -ForegroundColor cyan
    Write-Host "Get-EndpointReport         ..Gets a Report of AD Endpoints"                                -Foregroundcolor cyan
    Write-Host "Get-GroupMembers           ..Gets AD groups and their Members"                             -ForegroundColor cyan
    Write-Host "Get-GroupMemberships       ..Gets AD Users and their group Membership"                     -ForegroundColor cyan
    Write-Host "Get-LockedAccounts         ..Gets locked AD accounts"                                      -Foregroundcolor cyan
    Write-Host "Get-PasswordExpired        ..Gets AD accounts with Expired Passwords"                      -Foregroundcolor cyan
    Write-Host "Get-ReplicationStatus      ..Gets AD Site Replication Status"                              -Foregroundcolor cyan
    Write-Host "Get-UserReport             ..Gets a Report of AD Users"                                    -Foregroundcolor cyan
    Write-Host "Set-Password               ..Sets an AD Password"                                          -Foregroundcolor cyan
    Write-Host "Start-Replication          ..Starts AD Sites Replication"                                  -Foregroundcolor cyan
    Write-Host "Unlock-Account             ..Unlocks an AD account"                                        -Foregroundcolor cyan
    Write-Host "Unlock-AllAccounts         ..Unlocks all AD accounts"                                      -Foregroundcolor cyan
    Write-Host " "
}