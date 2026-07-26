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

    Import-Module ActiveDirectory -WarningAction SilentlyContinue

    $addomain = Get-ADDomain |
        Select-Object Name, Forest, ChildDomains, DistinguishedName, DNSRoot, DomainMode, ReplicaDirectoryServers, InfrastructureMaster, RIDMaster, PDCEmulator

    $adforest = Get-ADForest |
        Select-Object DomainNamingMaster, SchemaMaster

    $globalcatalog = (Get-ADDomainController -Filter { IsGlobalCatalog -eq $true } | Select-Object hostname).hostname -join ', '
    [pscustomobject]@{
        Name                    = $addomain.Name
        Forest                  = $addomain.Forest
        ChildDomains            = (Get-ADDomain).ChildDomains -join ", "
        DistinguishedName       = $addomain.DistinguishedName
        DomainMode              = $addomain.DomainMode
        DNSRoot                 = $addomain.DNSRoot
        GlobalCatalogServers    = $globalcatalog
        DomainNamingMaster      = $adforest.DomainNamingMaster
        InfrastructureMaster    = $addomain.InfrastructureMaster
        ReplicaDirectoryServers = (Get-ADDomain).ReplicaDirectoryServers -join ", "
        RIDMaster               = $addomain.RIDMaster
        PDCEmulator             = $addomain.PDCEmulator
        SchemaMaster            = $adforest.SchemaMaster
    }
}