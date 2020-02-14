function Get-Office365 {

    Get-Intro365

    Write-Host "Office 365 Functions"                                                                      -Foregroundcolor green
    Write-Host "Connect-Office365          ..Connects to Office 365 Module"                                -Foregroundcolor cyan
    Write-Host "Convert-MailboxToShared    ..Convert Disabled mailbox to a Shared Mailbox"                 -Foregroundcolor cyan
    Write-Host "Get-AuthPolicy             ..Gets Exchange Online Auth Policy"                             -Foregroundcolor cyan
    Write-Host "Get-MFAStatus              ..Gets Multifactor Settings for Msol Users"                     -Foregroundcolor cyan
    Write-Host "Get-RoleMembers            ..Gets Office 365 roles and their members"                      -Foregroundcolor cyan
    Write-Host "Invoke-Sync365             ..Invokes an Azure sync using a Non-Verbose alias remotely"     -Foregroundcolor cyan
    Write-Host "New-AuthPolicy             ..New Exchange Online Auth Policies Created"                    -Foregroundcolor cyan
    Write-Host "Set-AuthPolicy             ..Sets Exchange Online Auth Policy"                             -Foregroundcolor cyan
    Write-Host "Start-AzureSync            ..Starts an Azure AD and Local AD Sync"                         -Foregroundcolor cyan
    Write-Host " "
}