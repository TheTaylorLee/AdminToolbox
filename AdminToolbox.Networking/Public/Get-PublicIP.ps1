function Get-PublicIP {

    <#
    .DESCRIPTION
    Returns WhoIS public IP info for your location or any specified public IP

    .Parameter IP
    Specify an IP to get WhoIs info for

    .EXAMPLE
    Returns local Public IP Info

    Get-PublicIP

    .Example
    Returns your Public IP Info

    Get-PublicIP -IP 8.8.8.8

    .Link
    Clear-DNSClientCache
    Get-DNSClientCache
    Get-NetIPConfiguration
    Get-NetworkStatistics
    Resolve-DNSName
    Test-Netconnection
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Position = 0)]$IP
    )


    $ipinfo = Invoke-RestMethod http://ipinfo.io/$IP -Headers @{'Accept' = 'application/json' }
    #$ipinfo = Invoke-RestMethod http://ipinfo.io/4.2.2.2 -UserAgent 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.19041.1'

    $PublicIP = @{
        IP       = $ipinfo.ip
        Hostname = $ipinfo.hostname
        City     = $ipinfo.city
        Region   = $ipinfo.region
        country  = $ipinfo.country
        loc      = $ipinfo.loc
        org      = $ipinfo.org
        Phone    = $ipinfo.phone
    }
    $PublicIP.getenumerator() | Sort-Object -property name
}