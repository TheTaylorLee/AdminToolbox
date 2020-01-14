function Unlock-Account {

    <#
    .DESCRIPTION
    Unlocks an Active Directory Account

    .PARAMETER username
    Username of account being unlocked

    .NOTES
    Requires the Active Directory Module.

    .Example
    Use Get-lockedAccounts to quickly obtain the identity to use in the command.

    Get-LockedAccounts
    Unlock-ADAccount -identity JohnD

    .Link
    Get-DCLockoutEvents2
    Get-LockedAccounts
    Get-PasswordExpired
    Set-Password
    Unlock-AllAccounts
    #>

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$Username
    )

    Import-Module ActiveDirectory

    Unlock-ADAccount -identity $username

}