#Used By New-P2PTunnel
#Used By New-P2PTunnelNAT

Function New-P2PPhase1Interface {
    <#
    .Description
    To create Phase 1 Interfaces for the Functions Listed in the Link help.
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.")]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the name of the public interface for this tunnel.")]
        $Interface,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Phase 1 Time to Live.")]
        $TTL,
        [Parameter(Mandatory = $true, HelpMessage = "
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

Type in the encryption selection to use for the Phase 1 Proposal in a space delimited format.
")]
        $Proposal,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the DH Group or Groups in space delimeted format.")]
        $dhgroups,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Peer address for the Tunnel Peer")]
        $PeerAddress,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the PSK for the Tunnel")]
        $PSK
    )

    Write-Output "
config vpn ipsec phase1-interface
    edit ""$TunnelName""
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