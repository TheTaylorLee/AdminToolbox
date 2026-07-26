#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT

<#
    .Description
    Creates Static routes for a tunnel.
#>

Function New-StaticRouteTunnel {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide the tunnel name that was provided when creating the phase 1 interface.")]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Destination Address Object or Group Name.")]
        $DestinationAddressName
    )

    Write-Output "
config router static
    edit 0
        set device ""$TunnelName""
        set dstaddr ""$DestinationAddressName""
    next
    edit 0
        set distance 254
        set blackhole enable
        set dstaddr ""$DestinationAddressName""
    next
end"
}