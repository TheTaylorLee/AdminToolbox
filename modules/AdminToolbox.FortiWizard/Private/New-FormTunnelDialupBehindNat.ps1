#Required By Function
#New-FormTunnel

Function New-FormTunnelDialupBehindNAT {

    Param (
        [Parameter(Mandatory = $true)]
        $VPNFormPath
    )

    $Sheet = "DialUpNat"
    $services = try { ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { $null }
    $comments = try { (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 18 -EndRow 18 -StartColumn 2 -EndColumn 2 -NoHeader).p1 } catch { $null }
    $dhgroupsparam = try { ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 13 -EndRow 13 -StartColumn 2 -EndColumn 2 -NoHeader).p1).tostring() }
    $proposal = try { ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 10 -EndRow 10 -StartColumn 2 -EndColumn 2 -NoHeader).p1).tostring() }
    $LANInterface = try { ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ") } catch { ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 3 -EndRow 3 -StartColumn 2 -EndColumn 2 -NoHeader).p1).tostring() }

    $params = @{
        dhgroups           = $dhgroupsparam
        ikev               = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 16 -EndRow 16 -StartColumn 2 -EndColumn 2 -NoHeader).p1
        LANInterface       = $LANInterface
        LocalAddressCIDRs  = ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 4 -EndRow 4 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
        PeerAddress        = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 5 -EndRow 5 -StartColumn 2 -EndColumn 2 -NoHeader).p1
        PeerID             = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 15 -EndRow 15 -StartColumn 2 -EndColumn 2 -NoHeader).p1
        PFS                = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 17 -EndRow 17 -StartColumn 2 -EndColumn 2 -NoHeader).p1
        Proposal           = $proposal
        PSK                = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 11 -EndRow 11 -StartColumn 2 -EndColumn 2 -NoHeader).p1
        RemoteAddressCIDRs = ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 8 -EndRow 8 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
        TTL                = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 12 -EndRow 12 -StartColumn 2 -EndColumn 2 -NoHeader).p1
        TunnelName         = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 6 -EndRow 6 -StartColumn 2 -EndColumn 2 -NoHeader).p1
        WANInterface       = (Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 2 -EndRow 2 -StartColumn 2 -EndColumn 2 -NoHeader).p1
    }

    if ($null -ne $services) {
        $params['services'] = ((Import-Excel -Path $VPNFormPath -WorksheetName $sheet -StartRow 14 -EndRow 14 -StartColumn 2 -EndColumn 2 -NoHeader).p1).split(", ")
    }
    if ($null -ne $comments) {
        $params['comments'] = $comments
    }

    New-DialUPTunnelBehindNAT @params
}