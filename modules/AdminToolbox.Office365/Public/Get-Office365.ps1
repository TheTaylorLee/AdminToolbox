function Get-Office365 {

    Get-Intro365

    Write-Host "Office 365 Functions"                                                                        -ForegroundColor green
    Write-Host "Connect-Office365          ..Connects to Office 365 Module"                                  -ForegroundColor cyan
    Write-Host "Invoke-EXOSharedSession    ..Invokes an environment to EXO and On-Prem modules same console" -ForegroundColor cyan
    Write-Host " "

    Write-Host "ADSync Module Functions"                                                                     -ForegroundColor green
    Write-Host "Invoke-Sync365             ..Invokes an Azure sync using a Non-Verbose alias remotely"       -ForegroundColor cyan
    Write-Host "Start-AzureSync            ..Starts an Azure AD and Local AD Sync"                           -ForegroundColor cyan
    Write-Host " "

    Write-Host "Az Module Functions"                                                                         -ForegroundColor green
    Write-Host "Get-TenantDiagrams         ..Gets and generates dependency Diagrams"                         -ForegroundColor cyan
    Write-Host "Get-VMDetails              ..Gets AzureVM details from multiple functions"                   -ForegroundColor cyan
    Write-Host "Invoke-PowerState          ..Invokes power state changes on VMs and can get their status"    -ForegroundColor cyan
    Write-Host "Set-Subscription           ..Sets the subscription/AZContext for subsequent functions"       -ForegroundColor cyan
    Write-Host " "

    Write-Host "AzureAD Module Functions"                                                                    -ForegroundColor green
    Write-Host "Get-AzureRoleMembers       ..Gets Office 365 roles and their members"                        -ForegroundColor cyan
    Write-Host "Get-GuestUsers             ..Gets a security report of guest users from Azure AD"            -ForegroundColor cyan
    Write-Host "Set-PasswordNeverExpire    ..Sets an account password to not expire"                         -ForegroundColor cyan
    Write-Host " "

    Write-Host "ExchangeOnline Module Functions"                                                             -ForegroundColor green
    Write-Host "Convert-MailboxToShared    ..Convert Disabled mailbox to a Shared Mailbox"                   -ForegroundColor cyan
    Write-Host "Enable-MailboxAccess       ..Enables full access to a mailbox without a license"             -ForegroundColor cyan
    Write-Host "Get-AuthPolicy             ..Gets Exchange Online Auth Policy"                               -ForegroundColor cyan
    Write-Host "Get-Messagetrace           ..Gets an log of email messages"
    Write-Host "Get-Quarantine             ..Gets quarantine messages beyond the 1000 limit Microsoft Sets"  -ForegroundColor cyan
    Write-Host "New-AuthPolicy             ..New Exchange Online Auth Policies Created"                      -ForegroundColor cyan
    Write-Host "Set-365GroupVisibility     ..Sets a office365 group visible in the Outlook Client"           -ForegroundColor cyan
    Write-Host "Set-AuthPolicy             ..Sets Exchange Online Auth Policy"                               -ForegroundColor cyan
    Write-Host "Unblock-Quarantine         ..Unblock/release quarantine messages multiple at a time"         -ForegroundColor cyan
    Write-Host " "

    Write-Host "MSOnline Module Functions"                                                                   -ForegroundColor green
    Write-Host "Get-MFAStatus              ..Gets Multifactor Settings for Msol Users"                       -ForegroundColor cyan
    Write-Host "Get-MsolRoleMembers        ..Gets Office 365 roles and their members"                        -ForegroundColor cyan
    Write-Host "Invoke-PerUserMFAEnforced  ..Invoke Per User MFA Enforcement"                                -ForegroundColor Cyan
    Write-Host " "

    Write-Host "Teams Module Functions"                                                                      -ForegroundColor green
    Write-Host "Clear-TeamsCache           ..Clears Cache files for Microsoft Teams"                         -ForegroundColor cyan
    Write-Host " "
}