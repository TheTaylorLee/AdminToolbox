#Required by functions
#New-P2PTunnelNAT

<#
    .Description
    Create a New Virtual IP for a range

    .Parameter VIPName
    Specify a Unique name for the Virtual IP Object

    .Parameter ExternalCIDR
    Specify the External CIDR address used for the VIP Range. ex: 192.168.0.0/24

    .Parameter Interface
    Specify the Name of the External Interface for the VIP

    .Parameter InternalCIDR
    Specify the Internal CIDR address used for the VIP Range. ex: 192.168.0.0/24

    .Example
    $Params = @{
        VIPName               = "PatientPortal"
        ExternalCIDR          = "192.168.8.0/24"
        Interface             = "IPSecTunnel"
        InternalCIDR          = "192.168.1.0/24"
    }
    New-VIPRange @params

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        VIPName               = "PatientPortal"
        ExternalCIDR          = "192.168.8.0/24"
        Interface             = "IPSecTunnel"
        InternalCIDR          = "192.168.1.0/24"
    }
    $command = New-VIPRange @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        VIPName               = "PatientPortal"
        ExternalCIDR          = "192.168.8.0/24"
        Interface             = "IPSecTunnel"
        InternalCIDR          = "192.168.1.0/24"
    }
    $command = New-VIPRange @params
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

Function New-VIPRange {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$VIPName,
        [Parameter(Mandatory = $true)]$Interface,
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $ExternalCIDR,
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $InternalCIDR
    )

    #Calculate for External CIDR
    $Externalcalc = Invoke-PSipcalc $Externalcidr
    $ExternalStartIP = ($Externalcalc).HostMin
    $ExternalEndIP = ($Externalcalc).HostMax
    $ExternalRange = "$ExternalStartIP" + "-" + "$ExternalEndIP"

    #Calculate for Internal CIDR
    $Internalcalc = Invoke-PSipcalc $Internalcidr
    $InternalStartIP = ($Internalcalc).HostMin
    $InternalEndIP = ($Internalcalc).HostMax
    $InternalRange = "$InternalStartIP" + "-" + "$InternalEndIP"

    Write-Output "
config firewall vip
    edit ""$VIPName""
        set extip ""$ExternalRange""
        set extintf ""$Interface""
        set mappedip ""$InternalRange""
    next
end"
}