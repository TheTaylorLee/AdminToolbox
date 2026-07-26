<#
.DESCRIPTION
This is a PowerShell Crescendo wrapper function for Iperf3
[KMG] indicates options that support a K/M/G suffix for kilo-, mega-, or giga-
If string input is accepted for a parameter, the first line fo the description help indicates the expected value type.

.PARAMETER help
Get native help for Iperf3.exe


.PARAMETER version
show version information and quit


.PARAMETER port
#
server port to listen on/connect to


.PARAMETER format
[kmgKMG]
format to report: Kbits, Mbits, KBytes, MBytes


.PARAMETER interval
#
seconds between periodic bandwidth reports


.PARAMETER file
xmit/recv the specified file


.PARAMETER bind
host
bind to a specific interface


.PARAMETER verboseout
more detailed output


.PARAMETER json
output in JSON format


.PARAMETER logfile
f
send output to logfile


.PARAMETER debugout
emit debugging output


.PARAMETER server
run in server mode


.PARAMETER daemon
run the server as a daemon


.PARAMETER pidfile
file
write PID file


.PARAMETER oneoff
handle one client connection then exit


.PARAMETER client
ipaddress
run in client mode, connecting to <host>


.PARAMETER udp
use UDP rather than TCP


.PARAMETER bandwidth
#[KMG][/#]
target bandwidth in bits/sec (0 for unlimited)
(default 1 Mbit/sec for UDP, unlimited for TCP)
(optional slash and packet count for burst mode)


.PARAMETER time
#
time in seconds to transmit for (default 10 secs)


.PARAMETER bytes
#[KMG]
number of bytes to transmit (instead of -t)


.PARAMETER blockcount
#[KMG]
number of blocks (packets) to transmit (instead of -t or -n)


.PARAMETER bufferlength
#[KMG]
length of buffer to read or write
(default 128 KB for TCP, 8 KB for UDP)


.PARAMETER cport
port
bind to a specific client port (TCP and UDP, default: ephemeral port)


.PARAMETER parallel
#
number of parallel client streams to run


.PARAMETER reverse
run in reverse mode (server sends, client receives)


.PARAMETER window
#[KMG]
set window size / socket buffer size


.PARAMETER mtu
#
set TCP/SCTP maximum segment size (MTU - 40 bytes)


.PARAMETER nodelay
set TCP/SCTP no delay, disabling Nagle's Algorithm


.PARAMETER ipv4only
only use IPv4


.PARAMETER ipv6only
only use IPv6


.PARAMETER tos
set the IP 'type of service'


.PARAMETER zerocopy
use a 'zero copy' method of sending data


.PARAMETER omitseconds
omit the first n seconds


.PARAMETER Title
prefix every output line with this string


.PARAMETER showserveroutput
get results from server


.PARAMETER udp64bitcounters
use 64-bit counters in UDP test packets



#>

function Invoke-Iperf {
    [CmdletBinding()]

    param(
        [Parameter(ParameterSetName = 'help')]
        [switch]$help,
        [Parameter(ParameterSetName = 'help')]
        [switch]$version,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [string]$port,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [string]$format,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [string]$interval,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [string]$file,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [string]$bind,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [switch]$verboseout,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [switch]$json,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [string]$logfile,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [switch]$debugout,
        [Parameter(Mandatory = $true, ParameterSetName = 'Server')]
        [switch]$server,
        [Parameter(ParameterSetName = 'Server')]
        [Parameter(ParameterSetName = 'Client')]
        [switch]$daemon,
        [Parameter(ParameterSetName = 'Server')]
        [switch]$pidfile,
        [Parameter(ParameterSetName = 'Server')]
        [switch]$oneoff,
        [Parameter(Mandatory = $true, ParameterSetName = 'Client')]
        [string]$client,
        [Parameter(ParameterSetName = 'Client')]
        [switch]$udp,
        [Parameter(ParameterSetName = 'Client')]
        [string]$bandwidth,
        [Parameter(ParameterSetName = 'Client')]
        [string]$time,
        [Parameter(ParameterSetName = 'Client')]
        [string]$bytes,
        [Parameter(ParameterSetName = 'Client')]
        [string]$blockcount,
        [Parameter(ParameterSetName = 'Client')]
        [string]$bufferlength,
        [Parameter(ParameterSetName = 'Client')]
        [string]$cport,
        [Parameter(ParameterSetName = 'Client')]
        [string]$parallel,
        [Parameter(ParameterSetName = 'Client')]
        [switch]$reverse,
        [Parameter(ParameterSetName = 'Client')]
        [string]$window,
        [Parameter(ParameterSetName = 'Client')]
        [string]$mtu,
        [Parameter(ParameterSetName = 'Client')]
        [switch]$nodelay,
        [Parameter(ParameterSetName = 'Client')]
        [switch]$ipv4only,
        [Parameter(ParameterSetName = 'Client')]
        [switch]$ipv6only,
        [Parameter(ParameterSetName = 'Client')]
        [string]$tos,
        [Parameter(ParameterSetName = 'Client')]
        [switch]$zerocopy,
        [Parameter(ParameterSetName = 'Client')]
        [string]$omitseconds,
        [Parameter(ParameterSetName = 'Client')]
        [string]$Title,
        [Parameter(ParameterSetName = 'Client')]
        [string]$showserveroutput,
        [Parameter(ParameterSetName = 'Client')]
        [string]$udp64bitcounters
    )

    BEGIN {
        $__PARAMETERMAP = @{
            help             = @{
                OriginalName      = '-h'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            version          = @{
                OriginalName      = '-v'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            port             = @{
                OriginalName      = '-p'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            format           = @{
                OriginalName      = '-f'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            interval         = @{
                OriginalName      = '-f'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            file             = @{
                OriginalName      = '-F'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            bind             = @{
                OriginalName      = '-B'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            verboseout       = @{
                OriginalName      = '-V'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            json             = @{
                OriginalName      = '-J'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            logfile          = @{
                OriginalName      = '--logfile'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            debugout         = @{
                OriginalName      = '-d'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            server           = @{
                OriginalName      = '-s'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            daemon           = @{
                OriginalName      = '-D'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            pidfile          = @{
                OriginalName      = '-I'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            oneoff           = @{
                OriginalName      = '-1'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            client           = @{
                OriginalName      = '-c'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            udp              = @{
                OriginalName      = '-u'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            bandwidth        = @{
                OriginalName      = '-b'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            time             = @{
                OriginalName      = '-t'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            bytes            = @{
                OriginalName      = '-n'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            blockcount       = @{
                OriginalName      = '-k'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            bufferlength     = @{
                OriginalName      = '-l'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            cport            = @{
                OriginalName      = '--cport'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            parallel         = @{
                OriginalName      = '-P'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            reverse          = @{
                OriginalName      = '-R'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            window           = @{
                OriginalName      = '-w'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            mtu              = @{
                OriginalName      = '-M'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            nodelay          = @{
                OriginalName      = '-N'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            ipv4only         = @{
                OriginalName      = '-4'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            ipv6only         = @{
                OriginalName      = '-6'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            tos              = @{
                OriginalName      = '-S'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            zerocopy         = @{
                OriginalName      = '-Z'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'switch'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            omitseconds      = @{
                OriginalName      = '-O'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            Title            = @{
                OriginalName      = '-T'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            showserveroutput = @{
                OriginalName      = '--get-server-output'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
            udp64bitcounters = @{
                OriginalName      = '--udp-counters-64bit'
                OriginalPosition  = '0'
                Position          = '2147483647'
                ParameterType     = 'string'
                ApplyToExecutable = $False
                NoGap             = $False
            }
        }

        $__outputHandlers = @{ Default = @{ StreamOutput = $true; Handler = { $input } } }
    }

    PROCESS {
        $__boundParameters = $PSBoundParameters
        $__defaultValueParameters = $PSCmdlet.MyInvocation.MyCommand.Parameters.Values.Where({ $_.Attributes.Where({ $_.TypeId.Name -eq "PSDefaultValueAttribute" }) }).Name
        $__defaultValueParameters.Where({ !$__boundParameters["$_"] }).ForEach({ $__boundParameters["$_"] = Get-Variable -value $_ })
        $__commandArgs = @()
        $MyInvocation.MyCommand.Parameters.Values.Where({ $_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $__boundParameters[$_.Name] }).ForEach({ $__boundParameters[$_.Name] = [switch]::new($false) })
        if ($__boundParameters["Debug"]) { Wait-Debugger }
        foreach ($paramName in $__boundParameters.Keys |
            Where-Object { !$__PARAMETERMAP[$_].ApplyToExecutable } |
            Sort-Object { $__PARAMETERMAP[$_].OriginalPosition }) {
            $value = $__boundParameters[$paramName]
            $param = $__PARAMETERMAP[$paramName]
            if ($param) {
                if ($value -is [switch]) {
                    if ($value.IsPresent) {
                        if ($param.OriginalName) { $__commandArgs += $param.OriginalName }
                    }
                    elseif ($param.DefaultMissingValue) { $__commandArgs += $param.DefaultMissingValue }
                }
                elseif ( $param.NoGap ) {
                    $pFmt = "{0}{1}"
                    if ($value -match "\s") { $pFmt = "{0}""{1}""" }
                    $__commandArgs += $pFmt -f $param.OriginalName, $value
                }
                else {
                    if ($param.OriginalName) { $__commandArgs += $param.OriginalName }
                    $__commandArgs += $value | ForEach-Object { $_ }
                }
            }
        }
        $__commandArgs = $__commandArgs | Where-Object { $_ -ne $null }
        if ($__boundParameters["Debug"]) { Wait-Debugger }
        if ( $__boundParameters["Verbose"]) {
            Write-Verbose -Verbose -Message iperf3.exe
            $__commandArgs | Write-Verbose -Verbose
        }
        $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
        if (! $__handlerInfo ) {
            $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
        }
        $__handler = $__handlerInfo.Handler
        if ( $PSCmdlet.ShouldProcess("iperf3.exe $__commandArgs")) {
            # check for the application and throw if it cannot be found
            if ( -not (Get-Command -ErrorAction Ignore "iperf3.exe")) {
                throw "Cannot find executable 'iperf3.exe'"
            }
            if ( $__handlerInfo.StreamOutput ) {
                & "iperf3.exe" $__commandArgs | & $__handler
            }
            else {
                $result = & "iperf3.exe" $__commandArgs
                & $__handler $result
            }
        }
    }
}