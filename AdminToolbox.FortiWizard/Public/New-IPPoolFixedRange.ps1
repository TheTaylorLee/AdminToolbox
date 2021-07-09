Function New-IPPoolFixedRange {
    <#
    .Description
    Create a New Fixed Range IP Pool

    .Parameter IPPoolName
    Specify a Unique name for the IP Pool

    .Parameter StartIPRangeExternal
    Specify an IPAddress that will be at the begining of the external IP Range

    .Parameter EndIPRangeExternal
    Specify an IPAddress that will be at the end of the external IP Range

    .Parameter StartIPRangeInternal
    Specify an IPAddress that will be at the begining of the internal IP Range

    .Parameter EndIPRangeInternal
    Specify an IPAddress that will be at the end of the internal IP Range

    .Example
    $Params = @{
    IPPoolName            = "CompanyIPSECPool"
    StartIPRangeExternal  = "10.155.127.1"
    EndIPRangeExternal    = "10.155.127.254"
    StartIPRangeInternal  = "192.168.0.1"
    EndIPRangeInternal    = "192.168.0.254"
    }

    New-IPPoolFixedRange @params

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
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$StartIPRangeExternal,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$EndIPRangeExternal,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$StartIPRangeInternal,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$EndIPRangeInternal
    )

    Write-Output "
config firewall ippool
    edit ""$IPPoolName""
        set type fixed-port-range
        set startip $StartIPRangeExternal
        set endip $EndIPRangeExternal
        set source-startip $StartIPRangeInternal
        set source-endip $EndIPRangeInternal
    next
end"
}