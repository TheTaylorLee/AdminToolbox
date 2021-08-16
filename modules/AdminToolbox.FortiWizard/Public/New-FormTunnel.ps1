Function New-FormTunnel {
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

    Param (
        [Parameter(Mandatory = $true)]
        $VPNFormPath,
        [Parameter(Mandatory = $true)]
        [ValidateSet('P2P', 'P2PNAT', 'DialupRemoteNAT', 'DialupBehindNAT')]
        $TunnelType
    )

    if ($TunnelType -eq 'P2P') {
        $services = try { ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { $null }

        if ($null -eq $services) {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerAddress        = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 9 -EndRow 9 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        else {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerAddress        = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 9 -EndRow 9 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                Services           = ((Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName vpn -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        New-P2PTunnel @params
    }

    if ($TunnelType -eq 'P2PNAT') {
        $services = try { ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 16 -EndRow 16 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { $null }

        if ($null -eq $services) {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                NATAddressCIDRs    = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 5 -EndRow 5 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerAddress        = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 9 -EndRow 9 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 7 -EndRow 7 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        else {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                NATAddressCIDRs    = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 5 -EndRow 5 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerAddress        = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 9 -EndRow 9 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                Services           = ((Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 16 -EndRow 16 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 7 -EndRow 7 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName natvpn -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        New-P2PTunnelNAT @params
    }

    if ($TunnelType -eq 'DialupRemoteNAT') {
        $services = try { ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { $null }
        if ($null -eq $services) {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerID             = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        else {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerID             = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                Services           = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        New-DialUPTunnelRemoteNAT @params
    }

    if ($TunnelType -eq 'DialupBehindNAT') {
        $services = try { ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { $null }
        if ($null -eq $services) {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerAddress        = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 5 -EndRow 5 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PeerID             = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        else {
            $params = @{
                dhgroups           = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                LANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                PeerAddress        = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 5 -EndRow 5 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PeerID             = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                Proposal           = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                Services           = ((Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
                TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
                WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName DialUpNat -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
            }
        }
        New-DialUPTunnelBehindNAT @params
    }
}