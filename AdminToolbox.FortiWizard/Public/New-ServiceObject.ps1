#Used By New-P2PTunnel

Function New-ServiceObject {
    <#
    .Description
    Create a new Service Object

    .Parameter ServiceName
    Specify a Unique name for the Service Object

    .Parameter TCPPortRange
    Specify the TCP port or port range

    .Parameter UDPPortRange
    Specify the UDP port or port range


    .Example
    $Params = @{
    ServiceName   = "OWA"
    TCPPortRange  = "443"
    }

    New-ServiceObject @params

    .Example
    If you require a range of ports specify the parameter range like shown here.

    $Params = @{
    ServiceName   = "RTP"
    UDPPortRange  = "10000-11000"
    }

    New-ServiceObject @params

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TCP')]
        [Parameter(Mandatory = $true, ParameterSetName = 'UDP')]$ServiceName,
        [Parameter(Mandatory = $true, ParameterSetName = 'TCP')]$TCPPortRange,
        [Parameter(Mandatory = $true, ParameterSetName = 'UDP')]$UDPPortRange
    )

    if ($TCPPortRange) {
        Write-Output "
config firewall service custom
    edit ""$ServiceName""
        set tcp-portrange $TCPPortRange
    next
end"
    }

    if ($UDPPortRange) {
        Write-Output "
config firewall service custom
    edit ""$ServiceName""
        set udp-portrange $UDPPortRange
    next
end"
    }
}