function Invoke-PSnmap {
    <#
    .SYNOPSIS
    Linux nmap for PowerShell (almost).
    Ping sweeps and scans a network for specified open ports. Can also perform DNS lookups.
    Port connect timeout is custom (milliseconds).
    Multithreaded with a default of 32 concurrent threads.

    If you get over about 20-25,000 threads, you'll experience significant slowdowns
    towards the end, so avoiding that is recommended. This number may vary in your environment.

    Svendsen Tech.
    Copyright (c) 2015, Joakim Borger Svendsen. All rights reserved.

    MIT license. http://www.opensource.org/licenses/MIT

    Homepage/documentation:
    https://www.powershelladmin.com/wiki/Port_scan_subnets_with_PSnmap_for_PowerShell

    .PARAMETER ComputerName
    List of CIDR, IP/subnet, IP or DNS/NetBIOS name.
    .PARAMETER PORT
    Port or ports to check.
    .PARAMETER Dns
    Perform a DNS lookup.
    .PARAMETER ScanOnPingFail
    Scan all hosts even if ping fails.
    .PARAMETER ThrottleLimit
    Number of concurrent threads. Default: 32.
    .PARAMETER HideProgress
    Do not display progress with Write-Progress
    .PARAMETER Timeout
    Timeout in seconds for each thread. Causes problems if too short. 30 as a default seems OK.
    .PARAMETER PortConnectTimeoutMs
    Port connect timeout in milliseconds. 5 seconds as a default for LAN scans. Increase for mobile/slow WAN.
    .PARAMETER NoSummary
    Do not display the end summary with start and end time, using Write-Host.

    .EXAMPLE
    $x = PSnmap -Cn 192.168.1.1/24, synology, ubuntuvm, vista64esxi -Port 22,3389,80,443 -Dns #-Verbose
    PS C:\> $x | Where { $_.Ping } | Format-Table -AutoSize

    ComputerName  IP/DNS                                    Ping Port 22 Port 80 Port 443 Port 3389
    ------------  ------                                    ---- ------- ------- -------- ---------
    192.168.1.1   router.asus.com                           True   False    True    False     False
    192.168.1.17  Chromecast                                True   False   False    False     False
    192.168.1.25  android-xxxxxxxxxxxxxxx                   True   False   False    False     False
    192.168.1.31  ubuntuvm                                  True    True    True    False     False
    192.168.1.77                                            True    True   False    False     False
    192.168.1.84  synology                                  True    True    True     True     False
    192.168.1.122 desktop                                   True   False   False    False     False
    192.168.1.124 PC58271                                   True   False    True     True      True
    192.168.1.127 stuepc                                    True   False   False    False      True
    192.168.1.131 2008r2esxi                                True   False    True    False      True
    192.168.1.132 2008r2esxi2                               True   False    True    False      True
    192.168.1.133 win7esxi                                  True   False   False    False      True
    192.168.1.151 SERVER2008                                True   False   False    False      True
    192.168.1.166                                           True    True    True     True     False
    192.168.1.195                                           True   False   False    False     False
    192.168.1.231 HPENVY4500                                True   False    True     True     False
    192.168.1.234 elitebook                                 True    True   False    False      True
    192.168.1.245 server2012                                True   False    True    False      True
    192.168.1.253 vista64esxi                               True   False   False    False      True
    synology      192.168.1.84                              True    True    True     True     False
    ubuntuvm      192.168.1.31                              True    True    True    False     False
    vista64esxi   fa70::614c:f45a:72f9:46a5%3;192.168.1.253 True   False   False    False      True

    .EXAMPLE
    $x = PSnmap -Cn 192.168.1.1/24, synology, ubuntuvm, vista64esxi -Port 22,3389,80,443 -Dns #-Verbose
    PS C:\> $x | Where { $_.'Port 22' } | Format-Table -AutoSize

    ComputerName  IP/DNS       Ping Port 22 Port 80 Port 443 Port 3389
    ------------  ------       ---- ------- ------- -------- ---------
    192.168.1.31  ubuntuvm     True    True    True    False     False
    192.168.1.77               True    True   False    False     False
    192.168.1.84  synology     True    True    True     True     False
    192.168.1.166              True    True    True     True     False
    192.168.1.234 elitebook    True    True   False    False      True
    synology      192.168.1.84 True    True    True     True     False
    ubuntuvm      192.168.1.31 True    True    True    False     False

    #>
    [CmdletBinding()]
    [Alias('psnmap')]
    param(
        # CIDR, IP/subnet, IP, or DNS/NetBIOS name.
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('PSComputerName', 'Cn')]
        [String[]] $ComputerName,
        # Port or ports to check.
        [Int[]] $Port,
        # Perform a DNS lookup.
        [Switch] $Dns,
        # Scan all hosts even if ping fails.
        [Switch] $ScanOnPingFail,
        # Number of concurrent threads.
        [Int] $ThrottleLimit = 32,
        # Do not display progress with Write-Progress.
        [Switch] $HideProgress,
        # Timeout in seconds. Causes problems if too short. 30 as a default seems OK.
        [Int] $Timeout = 30,
        # Port connect timeout in milliseconds. 5000 as a default seems sane.
        [int] $PortConnectTimeoutMs = 5000,
        # Do not display the end summary with start and end time, using Write-Host.
        [Switch] $NoSummary,
        # Add IANA service for the port number in parentheses.
        [Switch] $AddService)
    #[Switch] $UpdateServicesFromIANA)

    Set-StrictMode -Version Latest
    $MyEAP = "Stop"
    $ErrorActionPreference = $MyEAP
    $StartTime = Get-Date

    if ($AddService) {
        if ($PSVersionTable.PSVersion.Major -eq 2) {
            $MyScriptRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
        }
        $MyScriptRoot = $PSScriptRoot
        # https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv
        $IANAServicesFile = "$MyScriptRoot\service-names-port-numbers.csv"
    }
    # Populate services hash for quick lookup later.
    if ($AddService) {
        $PortServiceHash = @{} # string types as keys are best, which we will get for the ports from ipcsv..
        foreach ($Entry in Import-Csv -LiteralPath $IANAServicesFile | Where-Object { $_."Transport Protocol" -eq "tcp" }) {
            $PortServiceHash[$Entry."Port Number"] = $Entry."Service Name"
        }
    }
    $IPv4Regex = "(?:(?:0?0?\d|0?[1-9]\d|1\d\d|2[0-5][0-5]|2[0-4]\d)\.){3}(?:0?0?\d|0?[1-9]\d|1\d\d|2[0-5][0-5]|2[0-4]\d)"

    $RunspaceTimers = [HashTable]::Synchronized(@{})
    $PortData = [HashTable]::Synchronized(@{})
    $Runspaces = New-Object -TypeName System.Collections.ArrayList
    $RunspaceCounter = 0

    Write-Verbose -Message 'Creating initial session state.'
    $ISS = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
    $ISS.Variables.Add(
        (New-Object -TypeName System.Management.Automation.Runspaces.SessionStateVariableEntry `
                -ArgumentList 'RunspaceTimers', $RunspaceTimers, '')
    )
    $ISS.Variables.Add(
        (New-Object -TypeName System.Management.Automation.Runspaces.SessionStateVariableEntry `
                -ArgumentList 'PortData', $PortData, '')
    )

    Write-Verbose -Message 'Creating runspace pool.'

    $RunspacePool = [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspacePool(1, $ThrottleLimit, $ISS, $Host)
    $RunspacePool.ApartmentState = 'STA'
    $RunspacePool.Open()
    $ScriptBlock =
    {
        [CmdletBinding()]
        param(
            [int] $ID,
            [string] $Computer,
            [int[]] $Port,
            [switch] $Dns,
            [int] $PortConnectTimeout
        )
        # Get the start time.
        $RunspaceTimers.$ID = Get-Date
        # The objects returned here are passed to the pipeline...
        if (-not $PortData.ContainsKey($Computer)) {
            #'' | Select-Object -Property ComputerName, Error, Ping
            $PortData[$Computer] = New-Object -TypeName PSObject -Property @{
                ComputerName = $Computer
            }
        }
        # I'm lazy (in the right way?) and just took this DNS stuff from the existing Get-PortState module.
        if ($Dns) {
            $ErrorActionPreference = 'SilentlyContinue'
            $HostEntry = [System.Net.Dns]::GetHostEntry($Computer)
            $Result = $?
            $ErrorActionPreference = 'Continue'
            # It looks like it's "successful" even when it isn't, for any practical purposes (pass in IP, get IP as .HostName)...
            if ($Result) {
                ## This is a best-effort attempt at handling things flexibly.
                ##
                # I think this should mostly work... If I pass in an IPv4 address that doesn't
                # resolve to a host name, the same IP seems to be used to populate the HostName property.
                # So this means that you'll get the IP address twice for IPs that don't resolve, but
                # it will still say it resolved. For IPs that do resolve to a host name, you will
                # correctly get the host name in the IP/DNS column. For host names or IPs that resolve to
                # one or more IP addresses, you will get the IPs joined together with semicolons.
                # Both IPv6 and IPv4 may be reported depending on your environment.
                if ($HostEntry.HostName.Split('.')[0] -ieq $Computer.Split('.')[0]) {
                    $IPDns = @($HostEntry | Select-Object -Expand AddressList |
                        Select-Object -Expand IPAddressToString)
                }
                else {
                    $IPDns = @(@($HostEntry.HostName) + @($HostEntry.Aliases)) # -join ';') -join ';' -replace ';\z'
                }
                $PortData[$Computer] | Add-Member -MemberType NoteProperty -Name 'IP/DNS' -Value $IPDns
            }
            else {
                $PortData[$Computer] | Add-Member -MemberType NoteProperty -Name 'IP/DNS' -Value $Null
            }
            continue
        } # end of if $Dns
        foreach ($p in $Port | Sort-Object) {
            # only one port per thread, legacy code...
            Write-Verbose -Message "Processing ${Computer}, port $p in thread."
            $MySock, $IASyncResult, $Result = $Null, $Null, $Null
            $MySock = New-Object Net.Sockets.TcpClient
            $IASyncResult = [IAsyncResult] $MySock.BeginConnect($Computer, $p, $null, $null)
            $Result = $IAsyncResult.AsyncWaitHandle.WaitOne($PortConnectTimeout, $true)
            if ($MySock.Connected) {
                $MySock.Dispose()
                $MySock = $Null
                Write-Verbose "${Computer}: Port $p is OPEN"
                $PortData[$Computer] | Add-Member -MemberType NoteProperty -Name "Port $p" -Value $True
            }
            else {
                $MySock.Dispose()
                $MySock = $Null
                Write-Verbose "${Computer}: Port $p is CLOSED"
                $PortData[$Computer] | Add-Member -MemberType NoteProperty -Name "Port $p" -Value $False
            }
        }
    } # end of script block that's run for each host/port/DNS

    function Get-Result {
        [CmdletBinding()]
        param(
            [switch] $Wait
        )
        do {
            $More = $false
            foreach ($Runspace in $Runspaces) {
                $StartTime = $RunspaceTimers[$Runspace.ID]
                if ($Runspace.Handle.IsCompleted) {
                    #Write-Verbose -Message ('Thread done for {0}' -f $Runspace.IObject)
                    $Runspace.PowerShell.EndInvoke($Runspace.Handle)
                    $Runspace.PowerShell.Dispose()
                    $Runspace.PowerShell = $null
                    $Runspace.Handle = $null
                }
                elseif ($null -ne $Runspace.Handle) {
                    $More = $true
                }
                if ($Timeout -and $StartTime) {
                    if ((New-TimeSpan -Start $StartTime).TotalSeconds -ge $Timeout -and $Runspace.PowerShell) {
                        Write-Warning -Message ('Timeout {0}' -f $Runspace.IObject)
                        $Runspace.PowerShell.Dispose()
                        $Runspace.PowerShell = $null
                        $Runspace.Handle = $null
                    }
                }
            }
            if ($More -and $PSBoundParameters['Wait']) {
                Start-Sleep -Milliseconds 100
            }
            foreach ($Thread in $Runspaces.Clone()) {
                if (-not $Thread.Handle) {
                    Write-Verbose -Message ('Removing {0} from runspaces' -f $Thread.IObject)
                    $Runspaces.Remove($Thread)
                }
            }
            if (-not $HideProgress) {
                $ProgressSplatting = @{
                    Activity        = 'Processing'
                    Status          = 'Processing: {0} of {1} total threads done' -f ($RunspaceCounter - $Runspaces.Count), $RunspaceCounter
                    PercentComplete = ($RunspaceCounter - $Runspaces.Count) / $RunspaceCounter * 100
                }
                Write-Progress @ProgressSplatting
            }
        }
        while ($More -and $PSBoundParameters['Wait'])
    } # end of Get-Result
    $PingScriptBlock =
    {
        [CmdletBinding()]
        param(
            [int] $ID,
            [string] $ComputerName
        )
        $RunspaceTimers.$ID = Get-Date
        if (-not $PortData.ContainsKey($ComputerName)) {
            $PortData[$ComputerName] = New-Object -TypeName PSObject -Property @{ Ping = $Null }
        }
        $PortData[$ComputerName] | Add-Member -MemberType NoteProperty `
            -Name Ping -Value (Test-Connection -ComputerName $ComputerName -Quiet -Count 1) -Force
    }

    $AllComputerName = @(
        foreach ($Computer in $ComputerName) {
            if ($Computer -match "\A(?:${IPv4Regex}/\d{1,2}|${IPv4Regex}[\s/]+$IPv4Regex)\z") {
                Write-Verbose -Message "Detected CIDR notation or IP/subnet: '$Computer'. Expanding ..."
                (Invoke-PSipcalc -NetworkAddress $Computer -Enumerate).IPEnumerated
            }
            else {
                $Computer
            }
        }
    )
    # Do a ping scan using the same thread engine as later, but don't run Get-Result.
    # We sort of need some type of feedback even without Write-Verbose at this step...
    # Abandoned support for pipeline input (I'm guessing "who cares" about that 99 % of the time with this script).
    Write-Verbose -Message "$(Get-Date): Doing a ping sweep. Please wait."
    foreach ($Computer in $AllComputerName) {
        ++$RunspaceCounter
        $psCMD = [System.Management.Automation.PowerShell]::Create().AddScript($PingScriptBlock)
        [void] $psCMD.AddParameter('ID', $RunspaceCounter)
        [void] $psCMD.AddParameter('Computer', $Computer) #
        [void] $psCMD.AddParameter('Verbose', $VerbosePreference)
        $psCMD.RunspacePool = $RunspacePool
        Write-Verbose -Message "Starting $Computer ping thread" #
        [void]$Runspaces.Add(@{
                Handle     = $psCMD.BeginInvoke()
                PowerShell = $psCMD
                IObject    = $Computer #
                ID         = $RunspaceCounter
            })
        #Get-Result
        Start-Sleep -Milliseconds 25
    }
    [int] $Count = 1
    # Wait for pings to finish, so we have objects for all computernames/IPs.
    # This is pretty ugly, but works.
    while (1) {
        if ($Runspaces[($RunspaceCounter - 1)].Handle.IsCompleted) {
            break
        }
        Start-Sleep -Milliseconds 500
        if ($Count % 4) {
            Write-Verbose -Message "Waiting for ping scan to finish... (iterations: $Count)."
        }
        ++$Count
    }
    # Ugh, wait for the last one. Damn off by one crap. :( Not even sure why.
    Start-Sleep -Milliseconds 3500
    # seems to work without now? # no, one missing result, damn it.
    if ($PSBoundParameters['ScanOnPingFail']) {
        $IterComputerName = $PortData.Keys
    }
    else {
        $IterComputerName = $PortData.GetEnumerator() | Where-Object { $_.Value.Ping -eq $True } | Select-Object -ExpandProperty Name
    }
    foreach ($Computer in $IterComputerName) {
        # Starting DNS thread if switch was specified.
        if ($PSBoundParameters['Dns']) {
            ++$RunspaceCounter
            $psCMD = [System.Management.Automation.PowerShell]::Create().AddScript($ScriptBlock)
            [void] $psCMD.AddParameter('ID', $RunspaceCounter)
            [void] $psCMD.AddParameter('Computer', $Computer)
            [void] $PSCMD.AddParameter('Port', $Null)
            [void] $PSCMD.AddParameter('Dns', $Dns)
            [void] $psCMD.AddParameter('Verbose', $VerbosePreference)
            $psCMD.RunspacePool = $RunspacePool
            Write-Verbose -Message "Starting $Computer DNS thread"
            [void]$Runspaces.Add(@{
                    Handle     = $psCMD.BeginInvoke()
                    PowerShell = $psCMD
                    IObject    = $Computer
                    ID         = $RunspaceCounter
                })
        }
        Get-Result
        # Starting one thread for each port.
        foreach ($p in $Port) {
            #Start-Sleep -Milliseconds 25
            $RunspaceCounter++
            $psCMD = [System.Management.Automation.PowerShell]::Create().AddScript($ScriptBlock)
            [void] $psCMD.AddParameter('ID', $RunspaceCounter)
            [void] $psCMD.AddParameter('Computer', $Computer)
            [void] $psCMD.AddParameter('Port', $p)
            [void] $psCMD.AddParameter('Dns', $Null)
            [void] $psCMD.AddParameter('PortConnectTimeout', $PortConnectTimeoutMs)
            [void] $psCMD.AddParameter('Verbose', $VerbosePreference)
            $psCMD.RunspacePool = $RunspacePool
            Write-Verbose -Message "Starting $Computer, port $p"
            [void]$Runspaces.Add(@{
                    Handle     = $psCMD.BeginInvoke()
                    PowerShell = $psCMD
                    IObject    = $Computer
                    ID         = $RunspaceCounter
                })
            Get-Result
        }
    }
    #Get-Result
    Get-Result -Wait
    if (-not $HideProgress) {
        Write-Progress -Activity 'Processing' -Status 'Done' -Completed
    }
    Write-Verbose -Message "Closing runspace pool."
    $RunspacePool.Close()
    $RunspacePool.Dispose()
    [HashTable[]] $Script:TestPortProperties = @{ Name = 'ComputerName'; Expression = { $_.Name } }
    if ($Dns) {
        $Script:TestPortProperties += @{ Name = 'IP/DNS'; Expression = { $_.Value.'IP/DNS' } }
    }
    $Script:TestPortProperties += @{ Name = 'Ping'; Expression = { $_.Value.Ping } }
    #if (-not $NoServices) {
    #    foreach ($p in $Port) {
    #        $Script:TestPortProperties += @{ Name = "Service"; Expression = { $PortServiceHash[$p] } }
    #    }
    #}
    #$Script:TestPortProperties += @($Port | ForEach-Object { @{ Name = "Port $_"; Expression = { $_."Port $_" } } })
    foreach ($p in $Port | Sort-Object) {
        $Script:TestPortProperties += @{
            Name       = "Port $p$(
                if ($AddService) {
                    "" ("" + $PortServiceHash[[String] $p] + "")""
                }
            )";
            Expression = [ScriptBlock]::Create("`$_.Value.'Port $p'")
        }
    }
    $PortData.GetEnumerator() |
    Sort-Object -Property @{ # sort IPs for humans
        Expression = { if ($_.Name -match "\A$IPv4Regex\z") {
                ($_.Name.Split('.') | ForEach-Object {
                        '{0:D3}' -f [int] $_
                    }) -join '.'
            }
            else {
                $_.Name
            }
        }
    } |
    Select-Object -Property $Script:TestPortProperties
    #Write-Verbose -Message '"Exporting" $Global:STTestPortData and $Global:STTestPortDataProperties'
    #$Global:STTestPortData = $PortData
    #$Global:STTestPortDataProperties = $Script:TestPortProperties
    if (-not $NoSummary) {
        Write-Host -ForegroundColor Green ('Start time: ' + $StartTime)
        Write-Host -ForegroundColor Green ('End time:   ' + (Get-Date))
    }
}

function Convert-IPToBinary {
    param(
        [String] $IP
    )
    $IP = $IP.Trim()
    if ($IP -match "\A${IPv4Regex}\z") {
        try {
            return ($IP.Split('.') | ForEach-Object { [System.Convert]::ToString([byte] $_, 2).PadLeft(8, '0') }) -join ''
        }
        catch {
            Write-Warning -Message "Error converting '$IP' to a binary string: $_"
            return $Null
        }
    }
    else {
        Write-Warning -Message "Invalid IP detected: '$IP'."
        return $Null
    }
}

function Convert-BinaryToIP {
    param(
        [string] $Binary
    )
    $Binary = $Binary -replace '\s+'
    if ($Binary.Length % 8) {
        Write-Warning -Message "Binary string '$Binary' is not evenly divisible by 8."
        return $Null
    }
    [int] $NumberOfBytes = $Binary.Length / 8
    $Bytes = @(foreach ($i in 0..($NumberOfBytes - 1)) {
            try {
                #$Bytes += # skipping this and collecting "outside" seems to make it like 10 % faster
                [System.Convert]::ToByte($Binary.Substring(($i * 8), 8), 2)
            }
            catch {
                Write-Warning -Message "Error converting '$Binary' to bytes. `$i was $i."
                return $Null
            }
        })
    return $Bytes -join '.'
}

function Get-ProperCIDR {
    param(
        [string] $CIDRString
    )
    $CIDRString = $CIDRString.Trim()
    $o = '' | Select-Object -Property IP, NetworkLength
    if ($CIDRString -match "\A(?<IP>${IPv4Regex})\s*/\s*(?<NetworkLength>\d{1,2})\z") {
        # Could have validated the CIDR in the regex, but this is more informative.
        if ([int] $Matches['NetworkLength'] -lt 0 -or [int] $Matches['NetworkLength'] -gt 32) {
            Write-Warning "Network length out of range (0-32) in CIDR string: '$CIDRString'."
            return
        }
        $o.IP = $Matches['IP']
        $o.NetworkLength = $Matches['NetworkLength']
    }
    elseif ($CIDRString -match "\A(?<IP>${IPv4Regex})[\s/]+(?<SubnetMask>${IPv4Regex})\z") {
        $o.IP = $Matches['IP']
        $SubnetMask = $Matches['SubnetMask']
        if (-not ($BinarySubnetMask = Convert-IPToBinary $SubnetMask)) {
            return # warning displayed by Convert-IPToBinary, nothing here
        }
        # Some validation of the binary form of the subnet mask,
        # to check that there aren't ones after a zero has occurred (invalid subnet mask).
        # Strip all leading ones, which means you either eat 32 1s and go to the end (255.255.255.255),
        # or you hit a 0, and if there's a 1 after that, we've got a broken subnet mask, amirite.
        if ((($BinarySubnetMask) -replace '\A1+') -match '1') {
            Write-Warning -Message "Invalid subnet mask in CIDR string '$CIDRString'. Subnet mask: '$SubnetMask'."
            return
        }
        $o.NetworkLength = [Regex]::Matches($BinarySubnetMask, '1').Count
    }
    else {
        Write-Warning -Message "Invalid CIDR string: '${CIDRString}'. Valid examples: '192.168.1.0/24', '10.0.0.0/255.0.0.0'."
        return
    }
    # Check if the IP is all ones or all zeroes (not allowed: http://www.cisco.com/c/en/us/support/docs/ip/routing-information-protocol-rip/13788-3.html )
    if ($o.IP -match '\A(?:(?:1\.){3}1|(?:0\.){3}0)\z') {
        Write-Warning "Invalid IP detected in CIDR string '${CIDRString}': '$($o.IP)'. An IP can not be all ones or all zeroes."
        return
    }
    return $o
}

function Get-IPRange {
    param(
        [String] $StartBinary,
        [String] $EndBinary
    )
    [Decimal] $StartInt = [System.Convert]::ToInt64($StartBinary, 2)
    [Decimal] $EndInt = [System.Convert]::ToInt64($EndBinary, 2)
    for ($BinaryIP = $StartInt; $BinaryIP -le $EndInt; $BinaryIP++) {
        Convert-BinaryToIP ([System.Convert]::ToString($BinaryIP, 2).PadLeft(32, '0'))
    }
}

function Test-IPIsInNetwork {
    param(
        [String] $IP,
        [String] $StartBinary,
        [String] $EndBinary
    )
    $TestIPBinary = Convert-IPToBinary $IP
    [Decimal] $TestIPInt64 = [System.Convert]::ToInt64($TestIPBinary, 2)
    [Decimal] $StartInt64 = [System.Convert]::ToInt64($StartBinary, 2)
    [Decimal] $EndInt64 = [System.Convert]::ToInt64($EndBinary, 2)
    if ($TestIPInt64 -ge $StartInt64 -and $TestIPInt64 -le $EndInt64) {
        return $True
    }
    else {
        return $False
    }
}

function Get-NetworkInformationFromProperCIDR {
    param(
        [PSObject] $CIDRObject)
    $o = '' | Select-Object -Property IP, NetworkLength, SubnetMask, NetworkAddress, HostMin, HostMax,
    Broadcast, UsableHosts, TotalHosts, IPEnumerated, BinaryIP, BinarySubnetMask, BinaryNetworkAddress,
    BinaryBroadcast
    $o.IP = [String] $CIDRObject.IP
    $o.BinaryIP = Convert-IPToBinary -IP $o.IP
    $o.NetworkLength = [Int32] $CIDRObject.NetworkLength
    $o.SubnetMask = Convert-BinaryToIP -Binary ('1' * $o.NetworkLength).PadRight(32, '0')
    $o.BinarySubnetMask = ('1' * $o.NetworkLength).PadRight(32, '0')
    $o.BinaryNetworkAddress = $o.BinaryIP.SubString(0, $o.NetworkLength).PadRight(32, '0')
    if ($Contains) {
        if ($Contains -match "\A${IPv4Regex}\z") {
            # Passing in IP to test, start binary and end binary.
            return Test-IPIsInNetwork -IP $Contains `
                -StartBinary $o.BinaryNetworkAddress `
                -EndBinary $o.BinaryNetworkAddress.SubString(0, $o.NetworkLength).PadRight(32, '1')
        }
        else {
            Write-Error "Invalid IPv4 address specified with -Contains"
            return
        }
    }
    $o.NetworkAddress = Convert-BinaryToIP -Binary $o.BinaryNetworkAddress
    if ($o.NetworkLength -eq 32 -or $o.NetworkLength -eq 31) {
        $o.HostMin = $o.IP
    }
    else {
        $o.HostMin = Convert-BinaryToIP -Binary ([System.Convert]::ToString(([System.Convert]::ToInt64($o.BinaryNetworkAddress, 2) + 1), 2)).PadLeft(32, '0')
    }
    #$o.HostMax = Convert-BinaryToIP ([System.Convert]::ToString((([System.Convert]::ToInt64($o.BinaryNetworkAddress.SubString(0, $o.NetworkLength)).PadRight(32, '1'), 2) - 1), 2).PadLeft(32, '0'))
    #$o.HostMax =
    [String] $BinaryBroadcastIP = $o.BinaryNetworkAddress.SubString(0, $o.NetworkLength).PadRight(32, '1') # this gives broadcast... need minus one.
    $o.BinaryBroadcast = $BinaryBroadcastIP
    [Decimal] $DecimalHostMax = [System.Convert]::ToInt64($BinaryBroadcastIP, 2) - 1
    [String] $BinaryHostMax = [System.Convert]::ToString($DecimalHostMax, 2).PadLeft(32, '0')
    $o.HostMax = Convert-BinaryToIP -Binary $BinaryHostMax
    $o.TotalHosts = [Decimal][System.Convert]::ToString(
        ([System.Convert]::ToInt64($BinaryBroadcastIP, 2) - [System.Convert]::ToInt64($o.BinaryNetworkAddress, 2) + 1)
    )
    $o.UsableHosts = $o.TotalHosts - 2
    # ugh, exceptions for network lengths from 30..32
    if ($o.NetworkLength -eq 32) {
        $o.Broadcast = $Null
        $o.UsableHosts = [Decimal] 1
        $o.TotalHosts = [Decimal] 1
        $o.HostMax = $o.IP
    }
    elseif ($o.NetworkLength -eq 31) {
        $o.Broadcast = $Null
        $o.UsableHosts = [Decimal] 2
        $o.TotalHosts = [Decimal] 2
        # Override the earlier set value for this (bloody exceptions).
        [Decimal] $DecimalHostMax2 = [System.Convert]::ToInt64($BinaryBroadcastIP, 2) # not minus one here like for the others
        [String] $BinaryHostMax2 = [System.Convert]::ToString($DecimalHostMax2, 2).PadLeft(32, '0')
        $o.HostMax = Convert-BinaryToIP -Binary $BinaryHostMax2
    }
    elseif ($o.NetworkLength -eq 30) {
        $o.UsableHosts = [Decimal] 2
        $o.TotalHosts = [Decimal] 4
        $o.Broadcast = Convert-BinaryToIP -Binary $BinaryBroadcastIP
    }
    else {
        $o.Broadcast = Convert-BinaryToIP -Binary $BinaryBroadcastIP
    }
    if ($Enumerate) {
        $IPRange = @(Get-IPRange -StartBinary $o.BinaryNetworkAddress `
                -EndBinary $o.BinaryNetworkAddress.SubString(0, $o.NetworkLength).PadRight(32, '1'))
        if ((31, 32) -notcontains $o.NetworkLength ) {
            $IPRange = $IPRange[1..($IPRange.Count - 1)] # remove first element
            $IPRange = $IPRange[0..($IPRange.Count - 2)] # remove last element
        }
        $o.IPEnumerated = $IPRange
    }
    else {
        $o.IPEnumerated = @()
    }
    return $o
}