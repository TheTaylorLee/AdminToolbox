Function New-VIPRange {
    <#
    .Description
    Create a New Virtual IP for a range

    .Parameter VIPName
    Specify a Unique name for the Virtual IP Object

    .Parameter ExternalIPRange
    Specify the External IP used for the VIP Range

    .Parameter Interface
    Specify the Name of the External Interface for the VIP

    .Parameter InternalIPRange
    Specify the Internal IP used for the VIP Range

    .Example
    $Params = @{
    VIPName               = "PatientPortal"
    ExternalIP            = "192.168.8.1-192.168.8.254"
    Interface             = "IPSecTunnel"
    InternalIP            = "192.168.1.1-192.168.1.254"
    }

    New-VIPRange @params

    .Notes
    Source NAT (IP Pool) and Destination NAT (Virtual IP)

    Destination NAT changes the destination address of packets passing through the Router. It also offers the option to perform the port translation in the TCP/UDP headers. Destination NAT mainly used to redirect incoming packets with an external address or port destination to an internal IP address or port inside the network.

    Source NAT is most commonly used for translating private IP address to a public routable address to communicate with the host. Source NAT changes the source address of the packets that pass through the Router. A NAT pool is a set of addresses that are designed as a replacement for client IP addresses.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$VIPName,
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[-][0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid entry. You must provide a range in this pattern 192.168.1.1-192.168.1.254"
                }
            })]$ExternalIPRange,
        [Parameter(Mandatory = $true)]$Interface,
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[-][0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid entry. You must provide a range in this pattern 192.168.1.1-192.168.1.254"
                }
            })]$InternalIPRange
    )

    Write-Output "
config firewall vip
    edit ""$VIPName""
        set extip $ExternalIPRange
        set extintf ""$Interface""
        set mappedip $InternalIPRange
    next
end"
}