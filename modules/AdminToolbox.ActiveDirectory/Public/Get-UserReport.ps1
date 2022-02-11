<#
    .DESCRIPTION
    Create a report of Active Directory users

    .NOTES
    Requires Active Directory Module

    .Example
    Get-UserReport | Export-Excel .\out.xlsx

    Specify is where the report is to be saved.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-UserReport {

    [CmdletBinding()]

    Param (
    )

    Import-Module ActiveDirectory

    Get-ADUser -Filter * -Properties * |
    Select-Object DisplayName, name, CN, DistinguishedName, givenname, middlename, sn, SamAccountName, userprincipalname,
    Company, department, DESCRIPTION, HomeDirectory, HomeDrive, homephone, ipPhone, manager, mobile, scriptpath, telephoneNumber, title,
    Enabled, ObjectGUID, objectSid,
    @{ Name = "MemberOf"; Expression = { $_.memberof -join “;” } },
    @{ Name = "accountexpires"; Expression = { [DateTime]::FromFileTime($_.accountexpires).ToString('MM/dd/yyyy HH:mm:ss') } },
    created,
    @{ Name = "badPasswordTime"; Expression = { [DateTime]::FromFileTime($_.badPasswordTime).ToString('MM/dd/yyyy HH:mm:ss') } },
    BadLogonCount, logonhours, logonworkstation,
    LastBadPasswordAttempt,
    @{ Name = "lastLogon"; Expression = { [DateTime]::FromFileTime($_.lastLogon).ToString('MM/dd/yyyy HH:mm:ss') } },
    @{ Name = "lastLogonTimestamp"; Expression = { [DateTime]::FromFileTime($_.lastLogonTimestamp).ToString('MM/dd/yyyy HH:mm:ss') } },
    LockedOut, lockouttime, logoncount, Modified,
    @{ Name = "PwdLastSet"; Expression = { [DateTime]::FromFileTime($_.PwdLastSet).ToString('MM/dd/yyyy HH:mm:ss') } },
    PasswordNeverExpires,
    legacyExchangeDN, mailNickname,
    @{ Name = "PrimarySMTPAddress"; Expression = { $_.proxyaddresses | Where-Object { $_ -cLike “*SMTP*” } } },
    @{ Name = "ProxyAddresses"; Expression = { $_.proxyaddresses } },
    targetAddress
}
