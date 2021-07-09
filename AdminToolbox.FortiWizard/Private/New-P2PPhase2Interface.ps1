#Used By New-P2PTunnel
#Used By New-P2PTunnelNAT
#Used By New-DialUPTunnelDynamic
#Used By New-DialUPTunnelStatic

Function New-P2PPhase2Interface {
    <#
    .Description
    Create Phase 2 Interfaces for the Functions Listed in the Link help.
    #>

    [CmdletBinding()]
    Param (
    )

    $PhaseName = Read-Host "Provide a Phase 2 Name with no spaces in the format of <TunnelNameP2#> (Phase 2 Name)"
    $TunnelName = Read-Host "Provide the tunnel name that was provided when creating the phase 1 interface. This is case sensitive (TunnelName)"
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

Type in the encryption selection to use for the Phase 2 Proposal in a space delimited format. (Encryption Proposal)
"
    $TTL = Read-Host "Provide the Phase 2 Time to Live (TTL)"
    $dhgroups = Read-Host "Provide the DH Group or Group in space delimeted format. (DH Group/s)"
    $PFS = Read-Host "Specify PFS enable/disable. (PFS)"
    $SourceAddressName = Read-Host "Specify the Source Address Object or Group Name (Source Address/Group)"
    $DestinationAddressName = Read-Host "Specify the Destination Address Object or Group Name (Destination Address/Group)"


    Write-Output "
config vpn ipsec phase2-interface
    edit ""$PhaseName""
        set phase1name ""$TunnelName""
        set proposal $Proposal
        set pfs $PFS
        set dhgrp $dhgroups
        set replay disable
        set keylifeseconds $TTL
        set src-addr-type name
        set dst-addr-type name
        set src-name ""$SourceAddressName""
        set dst-name ""$DestinationAddressName""
    next
end
"
}