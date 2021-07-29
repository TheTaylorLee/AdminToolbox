# New-P2PTunnel

This Example will demonstrate how to use a VPN form saved as an excel file to import the tunnel parameters and buildout the tunnel configuration script. This is particularly useful because it allows for building tunnels with the only time consuming work being filling out the VPN form itself. The rest of the work can be fully automated. Check out the SSH examples for ideas on how to load the configuration script into a variable and use Posh-SSH to push the vpn Tunnel config.

You can use the Sample VPN form and customize it or buildout your own. Ultimately for this to work you just need a way of importing the VPN parameters from the form. In this example I use Import Excel, but you can use any method that is preferred.

**Generate The Tunnel Config**
```Powershell
$VPNFormPath = "$env:userprofile\downloads\VPN Buildout Form.xlsx"

$params = @{
    dhgroups           = ((import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
    LANInterface       = (import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1
    LocalAddressCIDRs  = ((import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
    PeerAddress        = (import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 9 -EndRow 9 -StartColumn 2 -EndColumn 2 -NoHeader).p1
    Proposal           = (import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
    PSK                = (import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
    RemoteAddressCIDRs = ((import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
    Services           = ((import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
    TTL                = (import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1
    TunnelName         = (import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
    WANInterface       = (import-excel -Path $VPNFormPath -WorksheetName vpn -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
}
New-P2PTunnel @params
```