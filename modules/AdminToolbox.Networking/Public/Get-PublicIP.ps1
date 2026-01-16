<#
    .DESCRIPTION
    Returns public IP info for your location or any specified public IP

    .PARAMETER Source
    This function supports multiple lookup sources. Currently supported ipinfo.io and ipquery.io

    .Parameter IP
    Specify an IP or array of ip addresses to get WhoIs info for

    .Parameter Sleep
    Adds specified seconds to sleep between api requests to ipinfo.io. There is a rate limit of 1 request per second. So if a rate limit is not specified 1 second will be used.

    .Parameter Token
    The token parameter can be used to expand the number of requests allowed to ipinfo.io. Register an account with ipinfo.io if needed.

    .EXAMPLE
    Get-PublicIP

    Returns local Public IP Info

    .Example
    Get-PublicIP -IP 8.8.8.8 -source ipquery

    Returns Public IP Info for 8.8.8.8

    .Example
    p -ip "8.8.8.8", "1.1.1.1", "9.9.9.9" -source ipinfo -sleep 5 -token fdsf98hghs

    Returns Public IP Info for the string array.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-PublicIP {

    [CmdletBinding(DefaultParameterSetName = 'ipquery')]
    [Alias('p')]
    param (
        [Parameter(Mandatory = $false, Position = 0, ParameterSetName = 'ipquery')]
        [Parameter(Mandatory = $false, Position = 0, ParameterSetName = 'ipinfo')]
        [string[]]$IP,

        [Parameter(Mandatory = $false, ParameterSetName = 'ipquery')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ipinfo')]
        [ValidateSet('ipinfo', 'ipquery')]
        [string]$source = 'ipinfo',

        [Parameter(Mandatory = $false, ParameterSetName = 'ipinfo')]
        [int]$Sleep,

        [Parameter(Mandatory = $false, ParameterSetName = 'ipinfo')]
        [string]$Token
    )

    if ($null -eq $source) {
        $source = 'ipinfo'
    }

    switch ($source) {
        'ipinfo' {
            if ($null -eq $ip) {
                $ipinfo = Invoke-RestMethod http://ipinfo.io/$address -Headers @{'Accept' = 'application/json' }

                [PSCustomObject]@{
                    IP           = $ipinfo.ip
                    Hostname     = $ipinfo.hostname
                    City         = $ipinfo.city
                    Region       = $ipinfo.region
                    Country      = $ipinfo.country
                    Location     = $ipinfo.loc
                    Organization = $ipinfo.org
                    Phone        = $ipinfo.phone
                }
            }

            foreach ($address in $ip) {
                if ($Token) {
                    $concate = $address + "?token=$Token"
                }
                else {
                    $concate = $address
                }

                $ipinfo = Invoke-RestMethod http://ipinfo.io/$concate -Headers @{'Accept' = 'application/json' }
                #$ipinfo = Invoke-RestMethod http://ipinfo.io/4.2.2.2 -UserAgent 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.19041.1'

                [PSCustomObject]@{
                    IP           = $ipinfo.ip
                    Hostname     = $ipinfo.hostname
                    City         = $ipinfo.city
                    Region       = $ipinfo.region
                    Country      = $ipinfo.country
                    Location     = $ipinfo.loc
                    Organization = $ipinfo.org
                    Phone        = $ipinfo.phone
                }

                if ($sleep) {
                    Start-Sleep -Seconds $sleep
                }
                else {
                    Start-Sleep -Seconds 1
                }
            }
        }
        'ipquery' {
            if ($ip) {
                $concat = $ip -join ","
                $ipinfo = Invoke-RestMethod https://api.ipquery.io/$concat/?format=json
            }
            else {
                $ipinfo = Invoke-RestMethod https://api.ipquery.io/?format=json
            }

            foreach ($ipinfo in $ipinfo) {
                [PSCustomObject]@{
                    IP           = $ipinfo.ip
                    City         = $ipinfo.location.city
                    Region       = $ipinfo.location.state
                    Country      = $ipinfo.location.country_code
                    Location     = [string]$ipinfo.location.latitude + " " + [string]$ipinfo.location.longitude
                    Organization = [string]$ipinfo.isp.asn + "," + [string]$ipinfo.isp.org
                    Mobile       = $ipinfo.risk.is_mobile
                    VPN          = $ipinfo.risk.is_vpn
                    Tor          = $ipinfo.risk.is_tor
                    Proxy        = $ipinfo.risk.is_proxy
                    Datacenter   = $ipinfo.risk.is_datacenter
                    RiskScore    = $ipinfo.risk.risk_score
                }
            }
        }
    }
}