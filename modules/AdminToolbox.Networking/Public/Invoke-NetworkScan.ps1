<#
    .Description
    Get Hostnames, IPAddresses, Open Ports, Mac Addresses, and Mac Vendors.

    Mac resolution only works on locally attached networks.

    .Parameter CIDR
    A CIDR Range to search. ex: 192.168.0.0/24

    .Parameter Ports
    Takes a string array of ports to be scanned.

    .Parameter ScanType
    Ports 21, 22, 23, 80, 443, 3389, 9100 are scanned in a light scan.
    Ports for 21, 22, 23, 25, 53, 67, 80, 139, 389, 443, 445, 902, 3389, 9100 are scanned in a deep scan
    Alternatively specify ports using the ports parameter.

    .Parameter SkipMac
    Skips looking up oui vendors for found MAC addresses.

    .Parameter Threads
    Specify the number of threads that run on the port scan. Default is 64

    .Example
    Invoke-NetworkScan -CIDR 192.168.0.0/24 -ScanType Light | Sort-Object Vendor

    Get details for all devices on the local subnet and sort by their OUI

    .Example
    Invoke-NetworkScan -CIDR 192.168.0.0/24 -ScanType Deep | Out-GridView

    Perform a more thorough port scan and output to gridview

    .Example
    Invoke-NetworkScan -CIDR 192.168.0.0/24 -Ports 21, 23, 443

    Performs a port scan on the specified ports.

    .NOTES
    OUI/MA-L ~ Organization ~ Company ID ~ Street ~ City, State, Zip ~ Country Code

    Vendor information is displayed in this format

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-NetworkScan {

    [CmdletBinding()]
    [Alias('scan')]
    param(
        [Parameter (Mandatory = $true, Position = 1, ParameterSetName = 'Standard')]
        [Parameter (Mandatory = $true, Position = 1, ParameterSetName = 'Port')]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. CIDR format must be properly written like 192.168.0.1/24"
                }
            })]
        [string]$CIDR,
        [Parameter (Mandatory = $true, ParameterSetName = 'Standard')]
        [ValidateSet('Deep', 'Light')]
        $Scantype,
        [Parameter (Mandatory = $true, ParameterSetName = 'Port')]
        [string[]]$Ports,
        [Parameter (Mandatory = $false, ParameterSetName = 'Standard')]
        [Parameter (Mandatory = $false, ParameterSetName = 'Port')]
        [switch]$SkipMac,
        [Parameter (Mandatory = $false, ParameterSetName = 'Standard')]
        [Parameter (Mandatory = $false, ParameterSetName = 'Port')]
        [string]$Threads = '64'
    )

    begin {
        #Flush the local arp cache for most accurate results
        $ArpRefresh = Remove-ArpCache
        #Perform port scan first and put results in a script scope variable. This will also cause the arp cache to rebuild
        if ($null -ne $ArpRefresh) {
            switch ($ScanType) {
                Deep {
                    $Script:DeepScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 25, 53, 67, 80, 139, 389, 443, 445, 902, 3389, 9100 -ScanOnPingFail -Dns -NoSummary -PortConnectTimeoutMs 500 -ThrottleLimit $Threads
                }
                Light {
                    $Script:LightScan = Invoke-PSnmap -ComputerName $CIDR -Port 21, 22, 23, 80, 443, 3389, 9100 -ScanOnPingFail -Dns -NoSummary -PortConnectTimeoutMs 500 -ThrottleLimit $Threads
                }
                default {
                    #This is used when the parametersetname ports is chosen.
                    $Script:PortScan = Invoke-PSnmap -ComputerName $CIDR -Port $Ports -ScanOnPingFail -Dns -NoSummary -PortConnectTimeoutMs 500 -ThrottleLimit $Threads
                }
            }
        }

        else {
            Return
        }

        #Get path to the OUI list
        $ModPath = Get-Module AdminToolbox.Networking
        $P1 = $ModPath.path
        $P2 = $p1 -replace ("AdminToolbox.NetworkingManifest.psm1", "")
        $Script:ScanOUI = "$P2" + "support\ScanOUI.txt"
    }

    process {
        #Start a Foreach loop against CIDR Addresses
        $IPList = (Invoke-PSipcalc -NetworkAddress $CIDR -Enumerate).IPEnumerated

        ForEach ($IP in $IPList) {
            #Get MAC Address if it exists
            try {
                $Script:Neighbor = Get-NetNeighbor $IP -ErrorAction 'stop' | Where-Object { ($_.LinkLayerAddress -ne '00-00-00-00-00-00') -and ($_.LinkLayerAddress -ne 'ff-ff-ff-ff-ff-ff') }
            }
            catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException] {
                $Script:Neighbor = $null
            }
            catch [System.Management.Automation.RemoteException] {
                $Script:Neighbor = $null
            }

            $MAC = $Script:Neighbor.LinkLayerAddress

            #If block runs against scan results where Mac Addresses are present
            if ($null -ne $MAC -and $SkipMac -eq $false) {
                #If Deepscan parameter is chosen
                if ($Scantype -eq "Deep") {
                    #Filter the port scan to return results for the currently enumerated subnet from where the network scan returned live network devices
                    $Scan = $Script:DeepScan | Where-Object { $_.Computername -eq $IP }
                    #Invoke Mac Lookup against a text file in the support folder of this module
                    $Mac2 = $Mac.substring(0, 8)
                    $OUI1 = Get-Content $Script:ScanOUI | Where-Object { $_ -like "$mac2*" }
                    #Sometimes the MAC won't be Null, but it's not an actual MAC address. This try catch was quicker to implement then troubleshooting the cause.
                    try {
                        $OUI2 = $OUI1.Substring(11)
                    }
                    catch {
                        $OUI2 = $null
                    }

                    ForEach-Object {
                        #Take the enumerated CIDR IP results from the API call and Port scan. Output using a PSCustomObject
                        [pscustomobject]@{
                            IP                 = $IP
                            Hostname           = $Scan.'IP/DNS'
                            MacAddress         = $MAC
                            Vendor             = $OUI2
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
                #If LightScan parameter is chosen
                if ($Scantype -eq "Light") {
                    #Filter the port scan to return results for the currently enumerated subnet from where the network scan returned live network devices
                    $Scan = $Script:LightScan | Where-Object { $_.Computername -eq $IP }
                    #Invoke Mac Lookup
                    $Mac2 = $Mac.substring(0, 8)
                    $OUI1 = Get-Content $Script:ScanOUI | Where-Object { $_ -like "$mac2*" }
                    #Sometimes the MAC won't be Null, but it's not an actual MAC address. This try catch was quicker to implement then troubleshooting the cause.
                    try {
                        $OUI2 = $OUI1.Substring(11)
                    }
                    catch {
                        $OUI2 = $null
                    }
                    ForEach-Object {
                        #Take the enumerated CIDR IP results from the API call and Port scan. Output using a PSCustomObject
                        [pscustomobject]@{
                            IP            = $IP
                            Hostname      = $Scan.'IP/DNS'
                            MacAddress    = $MAC
                            Vendor        = $OUI2
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
                # If Custom Port Scan
                if ($null -ne $Ports) {
                    #Filter the port scan to return results for the currently enumerated subnet
                    $Scan = $Script:PortScan | Where-Object { $_.Computername -eq $IP }
                    $Mac2 = $Mac.substring(0, 8)
                    #Invoke Mac Lookup against a text file in the support folder of this module
                    $OUI1 = Get-Content $Script:ScanOUI | Where-Object { $_ -like "$mac2*" }
                    #Sometimes the MAC won't be Null, but it's not an actual MAC address. This try catch was quicker to implement then troubleshooting the cause.
                    try {
                        $OUI2 = $OUI1.Substring(11)
                    }
                    catch {
                        $OUI2 = $null
                    }

                    #Take the enumerated CIDR IP results from the API call and Port scan. Output using a PSCustomObject
                    $portcount = $ports.Count

                    $result = [pscustomobject]@{
                        IP         = $IP
                        Hostname   = $Scan.'IP/DNS'
                        MacAddress = $MAC
                        Vendor     = $OUI2
                        Ping       = $Scan.Ping
                    }

                    # Add members to the PSCustomObject for each port scanned
                    for ( $i = 0; $i -lt $portcount; $i++) {
                        $pn = $ports[$i]
                        $result | Add-Member -MemberType NoteProperty -Name $ports[$i] -Value $scan."Port $pn"
                    }

                    $result
                }
            }

            #If Mac is Null or Skipmac parameter is used
            if ($SkipMac -eq $true) {
                #If Deepscan  parameter is chosen
                if ($Scantype -eq "Deep") {
                    #Filter the port scan to return results for the currently enumerated IP from the CIDR Range foreach-object loop
                    $Scan = $Script:DeepScan | Where-Object { $_.Computername -eq $IP }
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
                #If LightScan parameter is chosen
                if ($Scantype -eq "Light") {
                    #Filter the port scan to return results for the currently enumerated IP from the CIDR Range foreach-object loop
                    $Scan = $Script:LightScan | Where-Object { $_.Computername -eq $IP }
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
                # If Custom Port Scan
                if ($null -ne $Ports) {
                    #Filter the port scan to return results for the currently enumerated IP from the CIDR Range foreach-object loop
                    $Scan = $Script:PortScan | Where-Object { $_.Computername -eq $IP }
                    #Take the enumerated CIDR IP results from the Port scan and Output using a PSCustomObject
                    $portcount = $ports.Count

                    $result = [pscustomobject]@{
                        IP         = $IP
                        Hostname   = $Scan.'IP/DNS'
                        MacAddress = $MAC
                        Vendor     = $null
                        Ping       = $Scan.Ping
                    }

                    # Add members to the PSCustomObject for each port scanned
                    for ( $i = 0; $i -lt $portcount; $i++) {
                        $pn = $ports[$i]
                        $result | Add-Member -MemberType NoteProperty -Name $ports[$i] -Value $scan."Port $pn"
                    }

                    $result
                }
            }
        }
    }

    end {
    }
}
