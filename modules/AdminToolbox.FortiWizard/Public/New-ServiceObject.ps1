#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

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
    $Params = @{
        ServiceName   = "RTP"
        UDPPortRange  = "10000-11000"
    }
    New-ServiceObject @params

    If you require a range of ports specify the parameter range like shown here.

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        ServiceName   = "RTP"
        UDPPortRange  = "10000-11000"
    }
    $command = New-ServiceObject @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        ServiceName   = "RTP"
        UDPPortRange  = "10000-11000"
    }
    $command = New-ServiceObject @params
    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

Function New-ServiceObject {

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