function Unlock-AllAccounts {

    <#
    .DESCRIPTION
    Unlocks all Active Directory Accounts

    .NOTES
    Requires the Active Directory Module.

    .Link
    Get-DCLockoutEvents
    Get-LockedAccounts
    Get-PasswordExpired
    Set-Password
    Unlock-Account
    #>

    [CmdletBinding()]
    Param (
    )

    Search-ADAccount -LockedOut | Unlock-ADAccount
}