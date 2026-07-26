<#
    .DESCRIPTION
    Unlocks all Active Directory Accounts

    .NOTES
    Requires the Active Directory Module.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Unlock-AllAccounts {

    [CmdletBinding()]
    Param (
    )

    Search-ADAccount -LockedOut | Unlock-ADAccount
}