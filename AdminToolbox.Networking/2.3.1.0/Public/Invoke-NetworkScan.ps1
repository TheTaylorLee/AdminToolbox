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
        #Flush and rebuild the local arp cache for most accurate results
        $ArpRefresh = Invoke-Arpscan -cidr $CIDR -ErrorAction 'silentlycontinue' 

        #Perform port scan first and put results in a script scopt variable
        if ($null -ne $ArpRefresh) {
            if ($DeepScan) {
                $Script:SlowScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 25, 53, 67, 80, 139, 389, 443, 445, 902, 3389, 9100 -ScanOnPingFail -DNS -NoSummary -PortConnectTimeoutMS 500
            }
            else {
                $Script:QuickScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 80, 443, 3389, 9100 -ScanOnPingFail -DNS -NoSummary -PortConnectTimeoutMS 500 
            }
        }
    }

    process {
        #Start a Foreach loop against CIDR Addresses
        (Invoke-PSipcalc -NetworkAddress $CIDR -Enumerate).IPEnumerated | ForEach-Object {
            #Get MAC Address if it exists
            try {
                $Script:Neighbor = Get-NetNeighbor $_ -ErrorAction 'stop' | Where-Object { ($_.LinkLayerAddress -ne '00-00-00-00-00-00') -and ($_.LinkLayerAddress -ne 'ff-ff-ff-ff-ff-ff') }
            }
            catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException] {
                $Script:Neighbor = $null
            }
            
            #Perform port scans and make API calls for OUI information on MAC Addresses
            try { 
                $IP = $_
                $MAC = $Script:Neighbor.LinkLayerAddress
                
                #Filter in only results that MAC API calls can or should be called on. Helps speed up the function.
                if ($null -ne $MAC -and $SkipMac -eq $false) {
                    #If Deepscan parameter is chosen 
                    if ($DeepScan) {
                        #Filter the port scan to return results for the currently enumerated IP from the CIDR Range foreach-object loop
                        $Scan = $Script:SlowScan | Where-Object { $_.Computername -eq $IP }
                        #Invoke API call
                        Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$MAC -ErrorAction SilentlyContinue |
                        ForEach-Object {
                            #Take the enumerated CIDR IP results from the API call and Port scan. Output using a PSCustomObject
                            [pscustomobject]@{
                                IP                 = $IP
                                Hostname           = $Scan.'IP/DNS'
                                MacAddress         = $MAC
                                Vendor             = $_
                                Ping               = $Scan.Ping
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
                    #If Deepscan  parameter isn't chosen
                    else {
                        #Filter the port scan to return results for the currently enumerated IP from the CIDR Range foreach-object loop
                        $Scan = $Script:QuickScan | Where-Object { $_.Computername -eq $IP }
                        Invoke-RestMethod -Method Get -Uri https://api.macvendors.com/$MAC -ErrorAction SilentlyContinue |
                        ForEach-Object {
                            #Take the enumerated CIDR IP results from the API call and Port scan. Output using a PSCustomObject
                            [pscustomobject]@{
                                IP            = $IP
                                Hostname      = $Scan.'IP/DNS'
                                MacAddress    = $MAC
                                Vendor        = $_
                                Ping          = $Scan.Ping
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

                #If MAC API calls aren't made this block is used to produce output
                else {
                    #If Deepscan  parameter is chosen
                    if ($DeepScan) {
                        #Filter the port scan to return results for the currently enumerated IP from the CIDR Range foreach-object loop
                        $Scan = $Script:SlowScan | Where-Object { $_.Computername -eq $IP }
                        #Take the enumerated CIDR IP results from the Port scan and Output using a PSCustomObject
                        [pscustomobject]@{
                            IP                 = $IP
                            Hostname           = $Scan.'IP/DNS'
                            MacAddress         = $MAC
                            Vendor             = $null
                            Ping               = $Scan.Ping
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
                    #If Deepscan  parameter isn't chosen
                    else {
                        #Filter the port scan to return results for the currently enumerated IP from the CIDR Range foreach-object loop
                        $Scan = $Script:QuickScan | Where-Object { $_.Computername -eq $IP }
                        #Take the enumerated CIDR IP results from the Port scan and Output using a PSCustomObject
                        [pscustomobject]@{
                            IP            = $IP
                            Hostname      = $Scan.'IP/DNS'
                            MacAddress    = $MAC
                            Vendor        = $null
                            Ping          = $Scan.Ping
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
            
            #Output from https://api.macvendors.com should it send any errors or warnings
            catch {
                Write-Warning -Message "$MAC, $_"
            }
            
        }
    }

    end {

    }
}