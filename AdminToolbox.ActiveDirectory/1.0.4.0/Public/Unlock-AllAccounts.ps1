function Unlock-AllAccounts {

    <#
    .DESCRIPTION
    Unlocks all Active Directory Accounts

    .NOTES
    Requires the Active Directory Module.

    .Link
    Get-DCLockoutEvents2
    Get-LockedAccounts
    Get-PasswordExpired
    Set-Password
    Unlock-Account
    #>

    [CmdletBinding()]
    Param (
    )

    Search-ADAccount -lockedout | Unlock-ADAccount
}