function Get-UserReport {

    <#
    .DESCRIPTION
    Create a report of Active Directory users

    .NOTES
    Requires Active Directory Module

    .Example
    Specify is where the report is to be saved.

    Get-UserReport -path C:\UserReport.csv

    .Link
    Get-GroupMemberships
	Get-EndpointReport
	Get-GroupMembers
    #>

    [CmdletBinding()]

    Param (
    )

    Import-Module ActiveDirectory

    Get-ADUser -Filter * -Properties * |
    Select-Object CN, DistinguishedName, SamAccountName, Modified, PasswordLastSet, PasswordNeverExpires, LockedOut, LastBadPasswordAttempt, BadLogonCount, Created, @{ L = ’PrimarySMTPAddress’; E = { $_.proxyaddresses | Where-Object { $_ -cLike “*SMTP*” } } }, @{L = ’ProxyAddresses’; E = { $_.proxyaddresses } }, @{name = ”MemberOf”; expression = { $_.memberof -join “;” } }, mailNickname, Enabled, HomeDirectory, HomeDrive
}