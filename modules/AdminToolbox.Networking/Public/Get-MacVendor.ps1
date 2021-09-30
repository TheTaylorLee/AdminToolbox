<#
    .Synopsis
    Resolve MacAddresses To Vendors

    .Description
    This Function Queries The MacVendors API With Supplied MacAdderess And Returns Manufacturer Information If A Match Is Found

    .Parameter MacAddress
    MacAddress To Be Resolved

    .Parameter SkipDNS
    If you are using public DNS, use SKipDNS. This will prevent long delays caused by retrieving Hostnames.

    .Parameter Subnet
    Specify a local subnet to query

    .Example
    Get-MacVendor -MacAddress 00:00:00:00:00:00

    .Example
    Get-MacVendor -MacAddress 00:00:00:00:00:00,11:11:11:11:11:11

    .Example
    Get-MacVendor -Subnet 192.168.0 | Sort-Object Vendor

    Get Mac addresses for all devices on the local subnet and query their OUI

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-MacVendor {

    [CmdletBinding(DefaultParameterSetName = 'MacAddress')]
    param(
        [Parameter (Mandatory = $true, ValueFromPipeline = $false, ParameterSetName = 'MacAddress')]
        [ValidatePattern("^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$")]
        [string[]]$MacAddress,
        [Parameter (Mandatory = $true, ParameterSetName = 'Local Subnet')]
        [string]$Subnet,
        [Parameter (Mandatory = $false, ParameterSetName = 'Local Subnet')]
        [switch]$SkipDNS
    )

    if ($null -ne $MacAddress) {
        foreach ($Mac in $MacAddress) {
            try {
                Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$Mac -ErrorAction SilentlyContinue | ForEach-Object {
                    [pscustomobject]@{
                        Vendor     = $_
                        MacAddress = $Mac
                    }
                }
                Start-Sleep -Milliseconds 1000
            }
            catch {
                Write-Warning -Message "$Mac, $_"
            }
        }
    }

    else {
        Get-NetNeighbor |
        Select-Object LinkLayerAddress, IPAddress |
        Where-Object { ($_.IPAddress -like "*$Subnet*") -and ($_.LinkLayerAddress -ne '00-00-00-00-00-00') -and ($_.LinkLayerAddress -ne 'ff-ff-ff-ff-ff-ff') } |
        ForEach-Object {
            try {
                $Mac = $_.LinkLayerAddress
                $IP = $_.IPAddress

                Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$Mac -ErrorAction SilentlyContinue |
                ForEach-Object {

                    if ($SkipDNS -eq $false) {
                        $DNS = Resolve-DnsName $IP -QuickTimeout -NoRecursion -ErrorAction 'SilentlyContinue'
                        [pscustomobject]@{
                            Hostname   = $DNS.NameHost
                            IP         = $IP
                            MacAddress = $Mac
                            Vendor     = $_
                        }
                    }

                    else {
                        [pscustomobject]@{
                            IP         = $IP
                            MacAddress = $Mac
                            Vendor     = $_
                        }

                    }
                    Start-Sleep -Milliseconds 1000
                }
            }
            catch {
                Write-Warning -Message "$Mac, $_"
            }
        }
    }
}