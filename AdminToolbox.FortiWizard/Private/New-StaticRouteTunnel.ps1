#Used By New-P2PTunnel
#Used By New-P2PTunnelNAT

Function New-StaticRouteTunnel {
    <#
    .Description
    Creates Static routes for a tunnel.
    #>

    [CmdletBinding()]
    Param (
    )

    $TunnelName = Read-Host "Provide the tunnel name that was provided when creating the phase 1 interface. This is case sensitive (TunnelName)"
    $DestinationAddressName = Read-Host "Specify the Destination Address Object or Group Name (Destination Address/Group)"

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
end
"
}