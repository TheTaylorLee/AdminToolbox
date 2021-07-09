#Used By New-DialUPTunnelDynamic
#Used By New-DialUPTunnelStatic

Function New-P2PPhase1InterfaceDialUp {
    <#
    .Description
    To create Phase 1 Interfaces for the Functions Listed in the Link help.
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "Static")][switch]$Static,
        [Parameter(Mandatory = $true, ParameterSetName = "Dynamic")][switch]$Dynamic
    )

    $TunnelName = Read-Host "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters  (TunnelName)"
    $Interface = Read-Host "Provide the name of the public interface for this tunnel. (Public Interface)"
    $Proposal = Read-Host "
des-md5          des-md5
des-sha1         des-sha1
des-sha256       des-sha256
des-sha384       des-sha384
des-sha512       des-sha512
3des-md5         3des-md5
3des-sha1        3des-sha1
3des-sha256      3des-sha256
3des-sha384      3des-sha384
3des-sha512      3des-sha512
aes128-md5       aes128-md5
aes128-sha1      aes128-sha1
aes128-sha256    aes128-sha256
aes128-sha384    aes128-sha384
aes128-sha512    aes128-sha512
aes192-md5       aes192-md5
aes192-sha1      aes192-sha1
aes192-sha256    aes192-sha256
aes192-sha384    aes192-sha384
aes192-sha512    aes192-sha512
aes256-md5       aes256-md5
aes256-sha1      aes256-sha1
aes256-sha256    aes256-sha256
aes256-sha384    aes256-sha384
aes256-sha512    aes256-sha512

Type in the encryption selection to use for the Phase 1 Proposal in a space delimited format. (Encryption Proposal)
"
    $dhgroups = Read-Host "Provide the DH Group or Group in space delimeted format. (DH Group/s)"
    $PSK = Read-Host "Specify the PSK for the Tunnel (PSK)"
    $PeerID = "Specify a unique 3 digit numeric peer ID to use for the tunnel. (Peer ID)"

    if ($Static) {
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
    next
end
"
    }
    if ($Dynamic) {
        $PeerAddress = Read-Host "Specify the Peer address for the Tunnel Peer (Peer Address)"
        Write-Output "
config vpn ipsec phase1-interface
    edit ""$TunnelName""
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
end
"
    }
}