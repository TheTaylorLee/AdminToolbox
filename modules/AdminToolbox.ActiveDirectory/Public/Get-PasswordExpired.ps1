<#
    .DESCRIPTION
    Returns a list of Active Directory Accounts with expired passwords

    .NOTES
    Requires the Active Directory Module.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-PasswordExpired {

    [CmdletBinding()]
    param (
    )

    Import-Module ActiveDirectory

    Search-ADAccount -PasswordExpired | Select-Object name | Sort-Object name | Format-List

}