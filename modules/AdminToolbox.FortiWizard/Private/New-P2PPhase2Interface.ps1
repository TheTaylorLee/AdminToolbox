#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

<#
    .Description
    Create Phase 2 Interfaces for the Functions Listed in the Link help.
#>

Function New-P2PPhase2Interface {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide a Phase 2 Name in the format of <TunnelName P2 #>")]
        $PhaseName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.")]
        $TunnelName,
        [Parameter(Mandatory = $true)]$Proposal,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Phase 2 Time to Live.")]
        $TTL,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Peer address for the Tunnel Peer.")]
        $dhgroups,
        [Parameter(Mandatory = $false, HelpMessage = "Specify the Source Address Object or Group Name.")]
        $SourceAddressName,
        [Parameter(Mandatory = $false, HelpMessage = "Specify the Destination Address Object or Group Name.")]
        $DestinationAddressName,
        [Parameter(Mandatory = $true, HelpMessage = "Specify if PFS should be enabled")]
        [ValidateSet('yes', 'no')]
        $PFS,
        [Parameter(Mandatory = $true, HelpMessage = "True or False option specifying if a wildcard selector should be used for the Phase 2 proposals.")]
        [ValidateSet('yes', 'no')]
        [string]$WildcardSelector
    )

    #If using a wildcard selector
    if ($WildcardSelector -eq 'yes') {
        if ($pfs -eq 'yes') {
            Write-Output "
config vpn ipsec phase2-interface
    edit ""$PhaseName""
        set phase1name ""$TunnelName""
        set proposal $Proposal
        set dhgrp $dhgroups
        set replay disable
        set keylifeseconds $TTL
        set src-addr-type subnet
        set dst-addr-type subnet
        set src-subnet 0.0.0.0 0.0.0.0
        set dst-subnet 0.0.0.0 0.0.0.0
    next
end"
        }
        else {
            Write-Output "
config vpn ipsec phase2-interface
    edit ""$PhaseName""
        set phase1name ""$TunnelName""
        set proposal $Proposal
        set pfs disable
        set replay disable
        set keylifeseconds $TTL
        set src-addr-type subnet
        set dst-addr-type subnet
        set src-subnet 0.0.0.0 0.0.0.0
        set dst-subnet 0.0.0.0 0.0.0.0
    next
end"
        }
    }

    # If not using a wildcard selector
    else {
        if ($pfs -eq 'yes') {
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
        else {
            Write-Output "
config vpn ipsec phase2-interface
    edit ""$PhaseName""
        set phase1name ""$TunnelName""
        set proposal $Proposal
        set pfs disable
        set replay disable
        set keylifeseconds $TTL
        set src-addr-type name
        set dst-addr-type name
        set src-name ""$SourceAddressName""
        set dst-name ""$DestinationAddressName""
    next
end"
        }
    }
}