<#
    .SYNOPSIS
    Provides detailed network information. Accepts CIDR notation and IP / subnet mask.
    Inspired by the utility "ipcalc" on Linux.

    Svendsen Tech.
    Copyright (c) 2015, Joakim Svendsen
    All rights reserved.

    MIT license. http://www.opensource.org/licenses/MIT

    .PARAMETER NetworkAddress
    CIDR notation network address, or using subnet mask. Examples: '192.168.0.1/24', '10.20.30.40/255.255.0.0'.

    .PARAMETER Contains
    Causes PSipcalc to return a boolean value for whether the specified IP is in the specified network. Includes network address and broadcast address.

    .PARAMETER Enumerate
    Enumerates all IPs in subnet (potentially resource-expensive). Ignored if you use -Contains.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-PSipcalc {

    [CmdletBinding()]
    [Alias('psipcalc', 'ipcalc')]
    param(
        [Parameter(Mandatory = $True)][string[]] $NetworkAddress,
        [string] $Contains,
        [switch] $Enumerate
    )

    Set-StrictMode -Version Latest
    $ErrorActionPreference = 'Stop'
    $IPv4Regex = '(?:(?:0?0?\d|0?[1-9]\d|1\d\d|2[0-5][0-5]|2[0-4]\d)\.){3}(?:0?0?\d|0?[1-9]\d|1\d\d|2[0-5][0-5]|2[0-4]\d)'

    $NetworkAddress | ForEach-Object {
        Get-ProperCIDR -CIDRString $_
    } | ForEach-Object {
        Get-NetworkInformationFromProperCIDR -CIDRObject $_
    }
}