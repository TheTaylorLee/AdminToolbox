#Required by functions
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

<#
    .Description
    To create Phase 1 Interfaces for the Functions Listed in the Link help.
#>

Function New-P2PPhase1InterfaceDialUp {


    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "Static")]
        [switch]
        $RemoteNat,
        [Parameter(Mandatory = $true, ParameterSetName = "Dynamic")]
        [switch]
        $BehindNat,
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.", ParameterSetName = "Static")]
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.", ParameterSetName = "Dynamic")]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the name of the public interface for this tunnel.", ParameterSetName = "Static")]
        [Parameter(Mandatory = $true, HelpMessage = "Provide the name of the public interface for this tunnel.", ParameterSetName = "Dynamic")]
        $Interface,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the desired ike version", ParameterSetName = "Static")]
        [Parameter(Mandatory = $true, HelpMessage = "Provide the desired ike version", ParameterSetName = "Dynamic")]
        [ValidateSet('1', '2')]
        $ikev,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Public IP for the Tunnel Peer", ParameterSetName = "Dynamic")]
        $PeerAddress,
        [Parameter(Mandatory = $true, ParameterSetName = "Static")]
        [Parameter(Mandatory = $true, ParameterSetName = "Dynamic")]
        $Proposal,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the DH Group or Groups in space delimeted format.", ParameterSetName = "Static")]
        [Parameter(Mandatory = $true, HelpMessage = "Provide the DH Group or Groups in space delimeted format.", ParameterSetName = "Dynamic")]
        $dhgroups,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the PSK for the Tunnel", ParameterSetName = "Static")]
        [Parameter(Mandatory = $true, HelpMessage = "Specify the PSK for the Tunnel", ParameterSetName = "Dynamic")]
        $PSK,
        [Parameter(Mandatory = $true, HelpMessage = "Specify a unique 3 digit numeric peer ID to use for the tunnel.", ParameterSetName = "Static")]
        [Parameter(Mandatory = $true, HelpMessage = "Specify a unique 3 digit numeric peer ID to use for the tunnel.", ParameterSetName = "Dynamic")]
        $PeerID,
        [Parameter(Mandatory = $false, HelpMessage = "Provide a description for the tunnel")]
        $Comments
    )

    if ($RemoteNat) {
        if ($null -eq $comments) {
            Write-Output "
config vpn ipsec phase1-interface
    edit ""$TunnelName""
        set type dynamic
        set interface ""$Interface""
        set mode aggressive
        set peertype one
        set net-device enable
        set add-route enable
        set proposal $Proposal
        set dpd on-idle
        set dhgrp $dhgroups
        set peerid $PeerID
        set dpd-retryinterval 60
        set psksecret $PSK
        set ike-version $ikev
    next
end
"
        }
        else {
            Write-Output "
config vpn ipsec phase1-interface
    edit ""$TunnelName""
        set type dynamic
        set interface ""$Interface""
        set mode aggressive
        set peertype one
        set net-device enable
        set add-route enable
        set proposal $Proposal
        set dpd on-idle
        set dhgrp $dhgroups
        set peerid $PeerID
        set dpd-retryinterval 60
        set psksecret $PSK
        set ike-version $ikev
        set comments ""$Comments""
    next
end
"
        }
    }
    if ($BehindNat) {
        if ($null -eq $comments) {
            Write-Output "
config vpn ipsec phase1-interface
    edit ""$TunnelName""
        set ike-version $ikev
        set interface ""$Interface""
        set mode aggressive
        set peertype any
        set net-device enable
        set add-route enable
        set proposal $Proposal
        set localid $Peerid
        set dhgrp $dhgroups
        set remote-gw $Peeraddress
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
        set mode aggressive
        set peertype any
        set net-device enable
        set add-route enable
        set proposal $Proposal
        set localid $Peerid
        set dhgrp $dhgroups
        set remote-gw $Peeraddress
        set psksecret $PSK
        set comments ""$Comments""
    next
end"
        }
    }
}