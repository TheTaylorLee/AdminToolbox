<#
    .DESCRIPTION
    This is a PowerShell Crescendo wrapper function for Microsoft ethr

    .PARAMETER help
    Produces help from the native command

    .PARAMETER nologging
    Disable logging to file. Logging to file is enabled by default.

    .PARAMETER logfile
    Specify the file to log to.
    ex: c:\output.log

    .PARAMETER debuglogging
    Enable debug information in logging output.

    .PARAMETER ipv4
    Use only IP v4 version

    .PARAMETER ipv6
    Use only IP v6 version

    .PARAMETER servermode
    Specifies to run Ethr in Server Mode.

    .PARAMETER ip
    Bind to specified local IP address for TCP & UDP tests.
    This must be a valid IPv4 or IPv6 address.
    Default: <empty> - Any IP

    .PARAMETER port
    Use specified port number for TCP & UDP tests.
    Default: 8888

    .PARAMETER ui
    Show output in text UI

    .PARAMETER serveraddress
    Run in client mode and connect to <server>.
    Server is specified using name, FQDN or IP address.

    .PARAMETER bitrate
    Transmit only Bits per second (format: <num>[K | M | G])
    Only valid for Bandwidth tests.
    Default: 0 - Unlimited         Examples: 100 (100bits/s), 1M (1Mbits/s).

    .PARAMETER cport
    Use specified local port number in client for TCP & UDP tests.
    Default: 0 - Ephemeral Port

    .PARAMETER duration
    Duration for the test (format: <num>[ms | s | m | h].
    0: Run forever Default: 10s

    .PARAMETER gap
    Time interval between successive measurements (format: <num>[ms | s | m | h]
    Only valid for latency, ping and traceRoute tests.
    0: No gap
    Default: 1s

    .PARAMETER iterations
    Number of round trip iterations for each latency measurement.
    Only valid for latency testing.
    0Default: 1000

    .PARAMETER length
    Length of buffer (in Bytes) to use (format: <num>[KB | MB | GB])
    Only valid for Bandwidth tests. Max 1GB.
    Default: 16KB

    .PARAMETER throttle
    Number of Parallel Sessions (and Threads).
    0: Equal to number of CPUs
    Default: 1

    .PARAMETER clientprotocol
    Protocol ('tcp', 'udp', 'http', 'https', or 'icmp')
    Default: tcp

    .PARAMETER externalprotocol
    Protocol ('tcp', or 'icmp')
    Default: tcp

    .PARAMETER receive
    For Bandwidth tests, send data from server to client.

    .PARAMETER testclient
    Test to run ('b', 'c', 'p', 'l', 'pi', 'tr', or 'mtr')
    b: Bandwidth
    c: Connections/s
    p: Packets/s
    l: Latency, Loss & Jitter
    pi: Ping Loss & Latency
    tr: TraceRoute
    mtr: MyTraceRoute with Loss & Latency
    Default: b - Bandwidth measurement.

    .PARAMETER testexternal
    Test to run ('c', 'pi', 'tr', or 'mtr')
    c: Connections/s
    pi: Ping Loss & Latency
    tr: TraceRoute
    mtr: MyTraceRoute with Loss & Latency
    Default: pi - Ping Loss & Latency.

    .PARAMETER tos
    Specifies 8-bit value to use in IPv4 TOS field or IPv6 Traffic Class field.

    .PARAMETER warmup
    Use specified number of iterations for warmup.
    Default: 1

    .PARAMETER logtitle
    Use the given title in log files for logging results.
    Default: <empty>

    .PARAMETER destination
    Run in external client mode and connect to <destination>.
    <destination> is specified in URL or Host:Port format.
    For URL, if port is not specified, it is assumed to be 80 for http and 443 for https.
    Example: For TCP - www.microsoft.com: 443 or 10.1.0.4: 22 or https: //www.github.com
            For ICMP - www.microsoft.com or 10.1.0.4

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

function Invoke-Ethr {

    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'help')]
        [switch]$help,
        [Parameter(Mandatory = $true, ParameterSetName = 'noLogServer')]
        [Parameter(Mandatory = $true, ParameterSetName = 'noLogClient')]
        [Parameter(Mandatory = $true, ParameterSetName = 'noLogExternal')]
        [switch]$nologging,
        [Parameter(Mandatory = $true, ParameterSetName = 'LogServer')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogClient')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogExternal')]
        [string]$logfile = ".\ethr.log",
        [Parameter(ParameterSetName = 'LogServer')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [switch]$debuglogging,
        [Parameter(ParameterSetName = 'noLogServer')]
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogServer')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [switch]$ipv4,
        [Parameter(ParameterSetName = 'noLogServer')]
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogServer')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [switch]$ipv6,
        [Parameter(Mandatory = $true, ParameterSetName = 'noLogServer')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogServer')]
        [switch]$servermode,
        [Parameter(ParameterSetName = 'noLogServer')]
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogServer')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$ip,
        [Parameter(ParameterSetName = 'noLogServer')]
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'LogServer')]
        [Parameter(ParameterSetName = 'LogClient')]
        [string]$port,
        [Parameter(ParameterSetName = 'noLogServer')]
        [Parameter(ParameterSetName = 'LogServer')]
        [switch]$ui,
        [Parameter(Mandatory = $true, ParameterSetName = 'noLogClient')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogClient')]
        [string]$serveraddress,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'LogClient')]
        [string]$bitrate,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$cport,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$duration,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$gap,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'LogClient')]
        [string]$iterations,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'LogClient')]
        [string]$length,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$throttle,
        [ValidateSet('tcp', 'udp', 'http', 'https', 'icmp')]
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'LogClient')]
        [string]$clientprotocol,
        [ValidateSet('tcp', 'icmp')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$externalprotocol,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'LogClient')]
        [switch]$receive,
        [ValidateSet('b', 'c', 'p', 'l', 'pi', 'tr', 'mtr')]
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'LogClient')]
        [string]$testclient,
        [ValidateSet('c', 'pi', 'tr', 'mtr')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$testexternal,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [switch]$tos,
        [Parameter(ParameterSetName = 'noLogClient')]
        [Parameter(ParameterSetName = 'noLogExternal')]
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$warmup,
        [Parameter(ParameterSetName = 'LogClient')]
        [Parameter(ParameterSetName = 'LogExternal')]
        [string]$logtitle,
        [Parameter(Mandatory = $true, ParameterSetName = 'noLogExternal')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogExternal')]
        [string]$destination
    )

    BEGIN {
        $__PARAMETERMAP = @{
            help             = @{
                OriginalName     = '-h'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            nologging        = @{
                OriginalName     = '-no'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            logfile          = @{
                OriginalName     = '-o'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            debuglogging     = @{
                OriginalName     = '-debug'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ipv4             = @{
                OriginalName     = '-4'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ipv6             = @{
                OriginalName     = '-6'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            servermode       = @{
                OriginalName     = '-s'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ip               = @{
                OriginalName     = '-ip'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            port             = @{
                OriginalName     = '-port'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            ui               = @{
                OriginalName     = '-ui'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            serveraddress    = @{
                OriginalName     = '-c'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            bitrate          = @{
                OriginalName     = '-b'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            cport            = @{
                OriginalName     = '-cport'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            duration         = @{
                OriginalName     = '-d'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            gap              = @{
                OriginalName     = '-g'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            iterations       = @{
                OriginalName     = '-i'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            length           = @{
                OriginalName     = '-l'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            throttle         = @{
                OriginalName     = '-n'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            clientprotocol   = @{
                OriginalName     = '-p'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            externalprotocol = @{
                OriginalName     = '-p'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            receive          = @{
                OriginalName     = '-r'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            testclient       = @{
                OriginalName     = '-t'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            testexternal     = @{
                OriginalName     = '-t'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            tos              = @{
                OriginalName     = '-tos'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            warmup           = @{
                OriginalName     = '-w'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            logtitle         = @{
                OriginalName     = '-T'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
            destination      = @{
                OriginalName     = '-x'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $False
            }
        }

        $__outputHandlers = @{ Default = @{ StreamOutput = $true; Handler = { $input } } }
    }

    PROCESS {
        $__commandArgs = @()
        $__boundparms = $PSBoundParameters
        $MyInvocation.MyCommand.Parameters.Values.Where( { $_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $PSBoundParameters[$_.Name] }).ForEach( { $PSBoundParameters[$_.Name] = [switch]::new($false) })
        if ($PSBoundParameters["Debug"]) { Wait-Debugger }
        foreach ($paramName in $PSBoundParameters.Keys | Sort-Object { $__PARAMETERMAP[$_].OriginalPosition }) {
            $value = $PSBoundParameters[$paramName]
            $param = $__PARAMETERMAP[$paramName]
            if ($param) {
                if ( $value -is [switch] ) { $__commandArgs += if ( $value.IsPresent ) { $param.OriginalName } else { $param.DefaultMissingValue } }
                elseif ( $param.NoGap ) { $__commandArgs += "{0}""{1}""" -f $param.OriginalName, $value }
                else { $__commandArgs += $param.OriginalName; $__commandArgs += $value | ForEach-Object { $_ } }
            }
        }
        $__commandArgs = $__commandArgs | Where-Object { $_ }
        if ($PSBoundParameters["Debug"]) { Wait-Debugger }
        if ( $PSBoundParameters["Verbose"]) {
            Write-Verbose -Verbose -Message Ethr.exe
            $__commandArgs | Write-Verbose -Verbose
        }
        $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
        if (! $__handlerInfo ) {
            $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
        }
        $__handler = $__handlerInfo.Handler
        if ( $PSCmdlet.ShouldProcess("Ethr.exe $__commandArgs")) {
            if ( $__handlerInfo.StreamOutput ) {
                & "Ethr.exe" $__commandArgs | & $__handler
            }
            else {
                $result = & "Ethr.exe" $__commandArgs
                & $__handler $result
            }
        }
    }
}