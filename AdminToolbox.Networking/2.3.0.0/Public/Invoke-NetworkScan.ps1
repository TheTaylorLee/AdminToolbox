function Invoke-NetworkScan {
    <#
    .Description
    Get Hostnames, IPAddresses, Open Ports, Mac Addresses, and Mac Vendors.

    Mac resolution only works on locally attached networks.

    .Parameter CIDR
    A CIDR Range to search. ex: 192.168.0.0/24

    .Parameter DeepScan
    Ports 21, 22, 23, 80, 443, 3389, 9100 are normally scanned. Used Intense Scan to get open ports for 21, 22, 23, 25, 53, 67, 80, 139, 389, 443, 445, 902, 3389, 9100.

    .Parameter SkipMac
    This functions can be slowed down considerably by making API calls for MAC OUI info. If quicker results are desired and Mac Vendor information is unimportant, use this parameter.

    .Example
    Get details for all devices on the local subnet and sort by their OUI

    Invoke-NetworkScan -CIDR 192.168.0.0/24 | Sort-Object Vendor

    .Example
    Perform a more thorough port scan and output to gridview

    Invoke-NetworkScan -CIDR 192.168.0.0/24 -DeepScan | Out-GridView

    .Example
    Perform a quicker scan when Mac Vendor information is unimportant

    Invoke-NetworkScan -CIDR 192.168.0.0/24 -SkipMac

    .Link
    Invoke-ArpScan https://github.com/EmpireProject/Empire/
    Invoke-PSipcalc https://www.powershellgallery.com/packages/PSnmap
    Invoke-PSNmap https://www.powershellgallery.com/packages/PSnmap
    #>
    [CmdletBinding()]
    [Alias('scan')]
    param(
        [Parameter (Mandatory = $true, Position = 1)]
        [string]$CIDR,
        [Parameter (Mandatory = $false)]
        [switch]$DeepScan,
        [Parameter (Mandatory = $false)]
        [switch]$SkipMac
    )

    begin {
        #Flush and rebuild the local arp cache
        $ArpRefresh = Invoke-Arpscan -cidr $CIDR -ErrorAction 'silentlycontinue' 

        #Perform port scan first and put results in a global variable
        if ($null -ne $ArpRefresh) {
            if ($DeepScan) {
                $Global:SlowScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 25, 53, 67, 80, 139, 389, 443, 445, 902, 3389, 9100 -ScanOnPingFail -DNS -NoSummary -PortConnectTimeoutMS 500
            }
            else {
                $Global:QuickScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 80, 443, 3389, 9100 -ScanOnPingFail -DNS -NoSummary -PortConnectTimeoutMS 500 
            }
        }
    }

    process {

        (Invoke-PSipcalc -NetworkAddress $CIDR -Enumerate).IPEnumerated | ForEach-Object {
            try {
                $Global:Neighbor = Get-NetNeighbor $_ -ErrorAction 'stop' | Where-Object { ($_.LinkLayerAddress -ne '00-00-00-00-00-00') -and ($_.LinkLayerAddress -ne 'ff-ff-ff-ff-ff-ff') }
            }

            catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException] {
                $Global:Neighbor = $null
            }
            
            try { 
                $IP = $_
                $Mac = $Global:Neighbor.LinkLayerAddress
                

                if ($null -ne $Mac -and $SkipMac -eq $false) {
                    if ($DeepScan) {
                        $Scan = $Global:SlowScan | Where-Object { $_.Computername -eq $IP }
                        Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$Mac -ErrorAction SilentlyContinue |
                        ForEach-Object {
                            [pscustomobject]@{
                                IP                 = $IP
                                MacAddress         = $Mac
                                Vendor             = $_
                                'ssh(22)'          = $Scan.'Port 22'
                                'telnet(23)'       = $Scan.'Port 23'
                                'smtp(25)'         = $Scan.'Port 25'
                                'dns(53)'          = $Scan.'Port 53'
                                'dhcp(67)'         = $Scan.'Port 67'
                                'http(80)'         = $Scan.'Port 80'
                                'smb-netbios(139)' = $Scan.'Port 139'
                                'ldap(389)'        = $Scan.'Port 389'
                                'https(443)'       = $Scan.'Port 443'
                                'smb-cifs(445)'    = $Scan.'Port 445'
                                'vmware(902)'      = $Scan.'Port 902'
                                'rdp(3389)'        = $Scan.'Port 3389'
                                'print(9100)'      = $Scan.'Port 9100'
                            }
                        }
                    }
                    else {
                        $Scan = $Global:QuickScan | Where-Object { $_.Computername -eq $IP }
                        Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$Mac -ErrorAction SilentlyContinue |
                        ForEach-Object {
                            [pscustomobject]@{
                                IP            = $IP
                                MacAddress    = $Mac
                                Vendor        = $_
                                'ssh(22)'     = $Scan.'Port 22'
                                'telnet(23)'  = $Scan.'Port 23'
                                'http(80)'    = $Scan.'Port 80'
                                'https(443)'  = $Scan.'Port 443'
                                'rdp(3389)'   = $Scan.'Port 3389'
                                'print(9100)' = $Scan.'Port 9100'
                            }
                        }
                    }
                    #Start a short sleep to avoid exceeding the API call limit
                    Start-Sleep -Milliseconds 1000
                }

                else {
                    if ($DeepScan) {
                        $Scan = $Global:SlowScan | Where-Object { $_.Computername -eq $IP }
                        [pscustomobject]@{
                            IP                 = $IP
                            MacAddress         = $Mac
                            Vendor             = $null
                            'ssh(22)'          = $Scan.'Port 22'
                            'telnet(23)'       = $Scan.'Port 23'
                            'smtp(25)'         = $Scan.'Port 25'
                            'dns(53)'          = $Scan.'Port 53'
                            'dhcp(67)'         = $Scan.'Port 67'
                            'http(80)'         = $Scan.'Port 80'
                            'smb-netbios(139)' = $Scan.'Port 139'
                            'ldap(389)'        = $Scan.'Port 389'
                            'https(443)'       = $Scan.'Port 443'
                            'smb-cifs(445)'    = $Scan.'Port 445'
                            'vmware(902)'      = $Scan.'Port 902'
                            'rdp(3389)'        = $Scan.'Port 3389'
                            'print(9100)'      = $Scan.'Port 9100'
                        }    
                    }
                    else {
                        $Scan = $Global:QuickScan | Where-Object { $_.Computername -eq $IP }
                        [pscustomobject]@{
                            IP            = $IP
                            MacAddress    = $Mac
                            Vendor        = $null
                            'ssh(22)'     = $Scan.'Port 22'
                            'telnet(23)'  = $Scan.'Port 23'
                            'http(80)'    = $Scan.'Port 80'
                            'https(443)'  = $Scan.'Port 443'
                            'rdp(3389)'   = $Scan.'Port 3389'
                            'print(9100)' = $Scan.'Port 9100'
                        }    
                    }
                }
            }
            
            catch {
                Write-Warning -Message "$Mac, $_"
            }
            
        }
    }

    end {

    }
}