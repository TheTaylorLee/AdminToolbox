<#
    .Description
    This function will return domain info. Requires the Active Directory Module.

    .NOTES
    Requires the Active Directory Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-ADInfo {

    [CmdletBinding()]
    param (
    )

    Import-Module ActiveDirectory

    Get-ADDomain |
    Select-Object Name, Forest, ChildDomains, DistinguishedName, DNSRoot, DomainMode, ReplicaDirectoryServers, InfrastructureMaster, RIDMaster, PDCEmulator |
    Format-List

    Get-ADForest |
    Select-Object DomainNamingMaster, SchemaMaster |
    Format-List

}