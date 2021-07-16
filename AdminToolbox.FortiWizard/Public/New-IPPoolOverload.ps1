Function New-IPPoolOverLoad {
    <#
    .Description
    Create a New Overload IP Pool

    .Parameter IPPoolName
    Specify a Unique name for the IP Pool

    .Parameter StartIP
    Specify an IPAddress that will be at the begining of the Overload NAT

    .Parameter EndIP
    Specify an IPAddress that will be at the end of the Overload NAT

    .Example
    $Params = @{
        IPPoolName    = "SSLVPNNAT"
        StartIP       = "10.155.127.1"
        EndIP         = "10.155.127.254"
    }

    New-IPPoolOverload @params

    .Example
    This example generates and SSH session and invokes the output of this function against that sessions.

    New-SSHSession -computername 192.168.0.1

    $Params = @{
        IPPoolName    = "SSLVPNNAT"
        StartIP       = "10.155.127.1"
        EndIP         = "10.155.127.254"
    }
    $command = New-IPPoolOverload @params

    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    .Example
    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1

    $Params = @{
        IPPoolName    = "SSLVPNNAT"
        StartIP       = "10.155.127.1"
        EndIP         = "10.155.127.254"
    }
    $command = New-IPPoolOverload @params

    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    .Notes
    Source NAT (IP Pool) and Destination NAT (Virtual IP)

    Destination NAT changes the destination address of packets passing through the Router. It also offers the option to perform the port translation in the TCP/UDP headers. Destination NAT mainly used to redirect incoming packets with an external address or port destination to an internal IP address or port inside the network.

    Source NAT is most commonly used for translating private IP address to a public routable address to communicate with the host. Source NAT changes the source address of the packets that pass through the Router. A NAT pool is a set of addresses that are designed as a replacement for client IP addresses.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$IPPoolName,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$StartIP,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$EndIP
    )

    Write-Output "
config firewall ippool
    edit ""$IPPoolName""
        set startip $StartIP
        set endip $EndIP
    next
end
"
}