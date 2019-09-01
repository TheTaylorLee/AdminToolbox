function Invoke-NetworkScan {
    <#
    .Description
    Get Hostnames, IPAddresses, Open Ports, Mac Addresses, and Mac Vendors.

    Mac resolution only works on locally attached networks.

    .Parameter CIDR
    A CIDR Range to search. ex: 192.168.0.0/24

    .Parameter DeepScan
    Ports 21, 22, 23, 80, 443, 3389, 9100 are normally scanned. Use DeepScan to get open ports for 21, 22, 23, 25, 53, 67, 80, 139, 389, 443, 445, 902, 3389, 9100.

    .Parameter SkipMac
    This functions can be slowed down considerably by making API calls for MAC OUI info. If quicker results are desired and Mac Vendor information is unimportant, use this parameter.

    .Parameter Threads
    Specify the number of threads that run on the port scan. Default is 64

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
    Invoke-PSipcalc https://www.powershellgallery.com/packages/PSnmap
    Invoke-PSNmap https://www.powershellgallery.com/packages/PSnmap
    #>
    [CmdletBinding()]
    [Alias('scan')]
    param(
        [Parameter (Mandatory = $true, Position = 1)]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. CIDR format must be properly written like 192.168.0.1/24"
                }
            })]
        [string]$CIDR,
        [Parameter (Mandatory = $false)]
        [switch]$DeepScan,
        [Parameter (Mandatory = $false)]
        [switch]$SkipMac,
        [Parameter (Mandatory = $false)]
        [string]$Threads = '64'
    )

    begin {
        #Flush the local arp cache for most accurate results
        $ArpRefresh = Remove-ArpCache

        #Perform port scan first and put results in a script scope variable. This will also cause the arp cache to rebuild
        if ($null -ne $ArpRefresh) {
            if ($DeepScan) {
                $Script:SlowScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 25, 53, 67, 80, 139, 389, 443, 445, 902, 3389, 9100 -ScanOnPingFail -DNS -NoSummary -PortConnectTimeoutMS 500 -ThrottleLimit $Threads
            }
            else {
                $Script:QuickScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 80, 443, 3389, 9100 -ScanOnPingFail -DNS -NoSummary -PortConnectTimeoutMS 500 -ThrottleLimit $Threads
            }
        } #end if

        else {
            Return
        } #end else

    } #end of begin

    process {
        #Start a Foreach loop against CIDR Addresses
        $IPList = (Invoke-PSipcalc -NetworkAddress $CIDR -Enumerate).IPEnumerated

        ForEach ($IP in $IPList) {
            #Show Progress
            #$Progress = $IP -replace ("^[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.]", '')
            #Write-Progress -Activity "Generating results for $IP" -PercentComplete (($Progress / $IPList.count) * 100) -ErrorAction 'SilentlyContinue'

            #Get MAC Address if it exists
            try {
                $Script:Neighbor = Get-NetNeighbor $IP -ErrorAction 'stop' | Where-Object { ($_.LinkLayerAddress -ne '00-00-00-00-00-00') -and ($_.LinkLayerAddress -ne 'ff-ff-ff-ff-ff-ff') }
            }
            catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException] {
                $Script:Neighbor = $null
            }

            #Make API calls for OUI information on MAC Addresses
            try {
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
                        } | Where-Object { ($null -ne $scan.'IP/DNS') -or ($null -ne $MAC) -or ($Scan.Ping -eq $true) -or ($Scan.'Port 22' -eq $true) -or ($Scan.'Port 23' -eq $true) -or ($Scan.'Port 25' -eq $true) -or ($Scan.'Port 53' -eq $true) -or ($Scan.'Port 67' -eq $true) -or ($Scan.'Port 80' -eq $true) -or ($Scan.'Port 139' -eq $true) -or ($Scan.'Port 389' -eq $true) -or ($Scan.'Port 443' -eq $true) -or ($Scan.'Port 445' -eq $true) -or ($Scan.'Port 902' -eq $true) -or ($Scan.'Port 3389' -eq $true) -or ($Scan.'Port 9100' -eq $true) }
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
                        } | Where-Object { ($null -ne $scan.'IP/DNS') -or ($null -ne $MAC) -or ($Scan.Ping -eq $true) -or ($Scan.'Port 22' -eq $true) -or ($Scan.'Port 23' -eq $true) -or ($Scan.'Port 25' -eq $true) -or ($Scan.'Port 53' -eq $true) -or ($Scan.'Port 67' -eq $true) -or ($Scan.'Port 80' -eq $true) -or ($Scan.'Port 139' -eq $true) -or ($Scan.'Port 389' -eq $true) -or ($Scan.'Port 443' -eq $true) -or ($Scan.'Port 445' -eq $true) -or ($Scan.'Port 902' -eq $true) -or ($Scan.'Port 3389' -eq $true) -or ($Scan.'Port 9100' -eq $true) }
                    }
                    #Start a short sleep to avoid exceeding the API call limit
                    Start-Sleep -Milliseconds 1000
                } #end of API Call if statement

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
                        } | Where-Object { ($null -ne $scan.'IP/DNS') -or ($null -ne $MAC) -or ($Scan.Ping -eq $true) -or ($Scan.'Port 22' -eq $true) -or ($Scan.'Port 23' -eq $true) -or ($Scan.'Port 25' -eq $true) -or ($Scan.'Port 53' -eq $true) -or ($Scan.'Port 67' -eq $true) -or ($Scan.'Port 80' -eq $true) -or ($Scan.'Port 139' -eq $true) -or ($Scan.'Port 389' -eq $true) -or ($Scan.'Port 443' -eq $true) -or ($Scan.'Port 445' -eq $true) -or ($Scan.'Port 902' -eq $true) -or ($Scan.'Port 3389' -eq $true) -or ($Scan.'Port 9100' -eq $true) }
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
                        } | Where-Object { ($null -ne $scan.'IP/DNS') -or ($null -ne $MAC) -or ($Scan.Ping -eq $true) -or ($Scan.'Port 22' -eq $true) -or ($Scan.'Port 23' -eq $true) -or ($Scan.'Port 25' -eq $true) -or ($Scan.'Port 53' -eq $true) -or ($Scan.'Port 67' -eq $true) -or ($Scan.'Port 80' -eq $true) -or ($Scan.'Port 139' -eq $true) -or ($Scan.'Port 389' -eq $true) -or ($Scan.'Port 443' -eq $true) -or ($Scan.'Port 445' -eq $true) -or ($Scan.'Port 902' -eq $true) -or ($Scan.'Port 3389' -eq $true) -or ($Scan.'Port 9100' -eq $true) }
                    }
                } #end of else for no deepscan
            } #end of try

            #Output from https://api.macvendors.com should it send any errors or warnings
            catch {
                Write-Warning -Message "$MAC, $_"
            }

        }
    }

    end {
    }
}