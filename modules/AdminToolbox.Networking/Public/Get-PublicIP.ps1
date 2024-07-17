<#
    .DESCRIPTION
    Returns WhoIS public IP info for your location or any specified public IP

    .Parameter IP
    Specify an IP to get WhoIs info for

    .Parameter Sleep
    Adds specified seconds to sleep between api requests to ifconfig.io. There is a rate limit of 1 request per second. So if a rate limit is not specified 1 second will be used.

    .Parameter Token
    The token parameter can be used to expand the number of requests allowed. Register an account with ipinfo.io if needed.

    .EXAMPLE
    Get-PublicIP

    Returns local Public IP Info

    .Example
    Get-PublicIP -IP 8.8.8.8

    Returns Public IP Info for 8.8.8.8

    .Example
    p -ip "8.8.8.8", "1.1.1.1", "9.9.9.9" -sleep 5

    Returns Public IP Info for the string array.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-PublicIP {

    [CmdletBinding()]
    [Alias('p')]
    Param (
        [string[]][Parameter(Mandatory = $false, Position = 0)]$IP,
        [int][Parameter(Mandatory = $false, Position = 1)]$Sleep,
        [string][Parameter(Mandatory = $false, Position = 2)]$Token
    )

    if ($null -eq $ip) {
        Invoke-RestMethod http://ipinfo.io/$address -Headers @{'Accept' = 'application/json' }
    }

    ForEach ($address in $ip) {
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