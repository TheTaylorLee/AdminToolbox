#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT

<#
    .Description
    To create Phase 1 Interfaces for the Functions Listed in the Link help.
#>

Function New-P2PPhase1Interface {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.")]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the name of the public interface for this tunnel.")]
        $Interface,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the desired ike version")]
        [ValidateSet('1', '2')]
        $ikev,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Phase 1 Time to Live.")]
        $TTL,
        [Parameter(Mandatory = $true)]$Proposal,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the DH Group or Groups in space delimeted format.")]
        $dhgroups,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Peer address for the Tunnel Peer")]
        $PeerAddress,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the PSK for the tunnel")]
        $PSK,
        [Parameter(Mandatory = $false, HelpMessage = "Provide a description for the tunnel")]
        $Comments
    )

    if ($null -eq $comments) {
        Write-Output "
config vpn ipsec phase1-interface
    edit ""$TunnelName""
        set ike-version $ikev
        set interface ""$Interface""
        set keylife $TTL
        set peertype any
        set proposal $Proposal
        set dhgrp $dhgroups
        set remote-gw $PeerAddress
        set psksecret $PSK
    next
end"
    }

    else {
        Write-Output "
config vpn ipsec phase1-interface
    edit ""$TunnelName""
        set ike-version $ikev
        set interface ""$Interface""
        set keylife $TTL
        set peertype any
        set proposal $Proposal
        set dhgrp $dhgroups
        set remote-gw $PeerAddress
        set psksecret $PSK
        set comments ""$Comments""
    next
end"
    }
}
