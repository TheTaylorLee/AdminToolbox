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

    Get-ADUser -Filter * -properties * |
    Select-Object CN, DistinguishedName, SamAccountName, Modified, PasswordLastSet, PasswordNeverExpires, LockedOut, LastBadPasswordAttempt, BadLogonCount, Created, EmailAddress, { $_.proxyAddresses }, mailNickname, Enabled, HomeDirectory, HomeDrive
}