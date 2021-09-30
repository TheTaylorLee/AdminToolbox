<#
    .Description
    Return a list of Locked Active Directory Accounts

    .Notes
    Requires the Active Directory Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-LockedAccounts {

    Import-Module ActiveDirectory

    Search-ADAccount -LockedOut |
    Select-Object Name, SamAccountName, UserPrincipalName |
    Sort-Object Name |
    Format-Table -AutoSize
}