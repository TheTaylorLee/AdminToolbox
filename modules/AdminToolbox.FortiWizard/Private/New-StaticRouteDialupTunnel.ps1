#Required by functions
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

<#
    .Description
    Creates Static routes for a tunnel.
#>

Function New-StaticRouteDialupTunnel {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Destination Address Object or Group Name.")]
        $DestinationAddressName
    )

    Write-Output "
config router static
    edit 0
        set distance 254
        set blackhole enable
        set dstaddr ""$DestinationAddressName""
    next
end"
}