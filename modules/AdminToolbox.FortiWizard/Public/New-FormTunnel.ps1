<#
    .Description
    This function will use a VPN form to build a tunnel from one of 4 VPN tunnel types. It will use that vpn form to populate parameters for one of the specified tunnel functions New-P2PTunnel, New-P2PTunnelNAT, New-DialupRemoteNAT, or New-DialupBehindNAT. Use the link provided in this description to download the VPN Form. The VPN form may be modified in it's entirety with the exception of where the provided parameter values are to be entered. Those cells must remain in the same location or this function will not work for you.

    https://github.com/TheTaylorLee/AdminToolbox/raw/master/docs/AdminToolbox.FortiWizard/Examples/VPN%20Buildout%20Form.xlsx

    .Parameter TunnelType
    This specifies the type of VPN being created from the VPN form.

    Parameter options are 'P2P', 'P2PNAT', 'DialupRemoteNAT', 'DialupBehindNAT'

    .Parameter VPNFormPath
    This is the file path to the VPN Form.

    .Example
    New-TunnelForm -tunneltype p2pnat -vpnformpath .\vpnform.xlsx

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

Function New-FormTunnel {

    Param (
        [Parameter(Mandatory = $true)]
        $VPNFormPath,
        [Parameter(Mandatory = $true)]
        [ValidateSet('P2P', 'P2PNAT', 'DialupRemoteNAT', 'DialupBehindNAT')]
        $TunnelType
    )

    if ($TunnelType -eq 'P2P') {
        New-FormTunnelP2P -VPNFormPath $VPNFormPath
    }

    if ($TunnelType -eq 'P2PNAT') {
        New-FormTunnelP2PNAT -VPNFormPath $VPNFormPath
    }

    if ($TunnelType -eq 'DialupRemoteNAT') {
        New-FormTunnelDialupRemoteNAT -VPNFormPath $VPNFormPath
    }

    if ($TunnelType -eq 'DialupBehindNAT') {
        New-FormTunnelDialupBehindNAT -VPNFormPath $VPNFormPath
    }
}