<#
    .DESCRIPTION
    Unlocks an Active Directory Account

    .PARAMETER username
    Username of account being unlocked

    .NOTES
    Requires the Active Directory Module.

    .Example
    Get-LockedAccounts
    Unlock-ADAccount -identity JohnD

    Use Get-lockedAccounts to quickly obtain the identity to use for unlock-ADAccount

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Unlock-Account {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$Username
    )

    Import-Module ActiveDirectory

    Unlock-ADAccount -Identity $username

}