#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

Function New-P2PPhase2Interface {
    <#
    .Description
    Create Phase 2 Interfaces for the Functions Listed in the Link help.
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide a Phase 2 Name in the format of <TunnelName P2 #>")]
        $PhaseName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.")]
        $TunnelName,
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
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Phase 2 Time to Live.")]
        $TTL,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Peer address for the Tunnel Peer.")]
        $dhgroups,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Source Address Object or Group Name.")]
        $SourceAddressName,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Destination Address Object or Group Name.")]
        $DestinationAddressName
    )

    Write-Output "
config vpn ipsec phase2-interface
    edit ""$PhaseName""
        set phase1name ""$TunnelName""
        set proposal $Proposal
        set dhgrp $dhgroups
        set replay disable
        set keylifeseconds $TTL
        set src-addr-type name
        set dst-addr-type name
        set src-name ""$SourceAddressName""
        set dst-name ""$DestinationAddressName""
    next
end"
}