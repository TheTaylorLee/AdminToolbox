<#
    .Description
    Create a New Virtual IP for a single Host

    .Parameter VIPName
    Specify a Unique name for the Virtual IP Object

    .Parameter ExternalIP
    Specify the External IP used for the VIP. eg. The IP address used to access the host externally.

    .Parameter Interface
    Specify the Name of the External Interface from which the External IP will hit.

    .Parameter InternalIP
    Specify the Internal IP used for the VIP. eg. The IP address used to access the host internally.

    .Example
    $Params = @{
        VIPName               = "PatientPortal"
        ExternalIP            = "57.65.98.23"
        Interface             = "wan1"
        InternalIP            = "192.168.8.15"
    }
    New-VIPHost @params

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        VIPName               = "PatientPortal"
        ExternalIP            = "57.65.98.23"
        Interface             = "wan1"
        InternalIP            = "192.168.8.15"
    }
    $command = New-VIPHost @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        VIPName               = "PatientPortal"
        ExternalIP            = "57.65.98.23"
        Interface             = "wan1"
        InternalIP            = "192.168.8.15"
    }
    $command = New-VIPHost @params
    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    .Notes
    Source NAT (IP Pool) and Destination NAT (Virtual IP) \

    Destination NAT changes the destination address of packets passing through the Router. It also offers the option to perform the port translation in the TCP/UDP headers. Destination NAT mainly used to redirect incoming packets with an external address or port destination to an internal IP address or port inside the network. \

    Source NAT is most commonly used for translating private IP address to a public routable address to communicate with the host. Source NAT changes the source address of the packets that pass through the Router. A NAT pool is a set of addresses that are designed as a replacement for client IP addresses.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

Function New-VIPHost {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$VIPName,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$ExternalIP,
        [Parameter(Mandatory = $true)]$Interface,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$InternalIP,
        [Parameter(Mandatory = $true)]$port
    )

    Write-Output "
config firewall vip
    edit ""$VIPName""
        set extip $ExternalIP
        set extintf ""$Interface""
        set mappedip $InternalIP
        set portforward enable
        set extport $port
        set mappedport $port
    next
end"
}