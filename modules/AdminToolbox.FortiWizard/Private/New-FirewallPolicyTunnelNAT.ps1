#Required by functions
#New-P2PTunnelNAT

<#
    .Description
    Create Firewall Policies for the tunnel.
#>

Function New-FirewallPolicyTunnelNAT {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide the tunnel name that was provided when creating the phase 1 interface.")]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Source or Lan Interface name.")]
        $SourceInterfaceName,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Source Address Object/s in space delimited format or the Source Address Group.")]
        $SourceAddress,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Destination Address Object/s in space delimited format or the Destination Address Group.")]
        $DestinationAddress,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Service Object/s in space delimited format or the Service Group. If all specify ALL in capital letters.")]
        $Service,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the name of the IPPool that was provide when creating the IPPool.")]$IPPoolName,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the name of the VIP that was provide when creating the VIP Range.")]$VIPName
    )

    $policynamelocal = "vpn_" + $TunnelName + "_local"
    $policynameremote = "vpn_" + $TunnelName + "_remote"

    Write-Output "
config firewall policy
    edit 0
        set name ""$policynamelocal""
        set srcintf $SourceInterfaceName
        set dstintf ""$TunnelName""
        set srcaddr ""$SourceAddress""
        set dstaddr ""$DestinationAddress""
        set action accept
        set schedule always
        set service $Service
        set utm-status enable
        set ssl-ssh-profile certificate-inspection
        set ips-sensor default
        set logtraffic all
        set nat enable
        set ippool enable
        set poolname ""$IPPoolName""
    next
end

config firewall policy
    edit 0
        set name ""$policynameremote""
        set srcintf ""$TunnelName""
        set dstintf $SourceInterfaceName
        set srcaddr ""$DestinationAddress""
        set dstaddr ""$VIPName""
        set action accept
        set schedule always
        set service $Service
        set utm-status enable
        set ssl-ssh-profile certificate-inspection
        set ips-sensor default
        set logtraffic all
    next
end"
}