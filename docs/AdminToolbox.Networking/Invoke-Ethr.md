---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# Invoke-Ethr

## SYNOPSIS

## SYNTAX

### help
```
Invoke-Ethr [-help] [<CommonParameters>]
```

### noLogExternal
```
Invoke-Ethr [-nologging] [-ipv4] [-ipv6] [-ip <String>] [-cport <String>] [-duration <String>] [-gap <String>]
 [-throttle <String>] [-externalprotocol <String>] [-testexternal <String>] [-tos] [-warmup <String>]
 -destination <String> [<CommonParameters>]
```

### noLogClient
```
Invoke-Ethr [-nologging] [-ipv4] [-ipv6] [-ip <String>] [-port <String>] -serveraddress <String>
 [-bitrate <String>] [-cport <String>] [-duration <String>] [-gap <String>] [-iterations <String>]
 [-length <String>] [-throttle <String>] [-clientprotocol <String>] [-receive] [-testclient <String>] [-tos]
 [-warmup <String>] [<CommonParameters>]
```

### noLogServer
```
Invoke-Ethr [-nologging] [-ipv4] [-ipv6] [-servermode] [-ip <String>] [-port <String>] [-ui]
 [<CommonParameters>]
```

### LogExternal
```
Invoke-Ethr -logfile <String> [-debuglogging] [-ipv4] [-ipv6] [-ip <String>] [-cport <String>]
 [-duration <String>] [-gap <String>] [-throttle <String>] [-externalprotocol <String>]
 [-testexternal <String>] [-tos] [-warmup <String>] [-logtitle <String>] -destination <String>
 [<CommonParameters>]
```

### LogClient
```
Invoke-Ethr -logfile <String> [-debuglogging] [-ipv4] [-ipv6] [-ip <String>] [-port <String>]
 -serveraddress <String> [-bitrate <String>] [-cport <String>] [-duration <String>] [-gap <String>]
 [-iterations <String>] [-length <String>] [-throttle <String>] [-clientprotocol <String>] [-receive]
 [-testclient <String>] [-tos] [-warmup <String>] [-logtitle <String>] [<CommonParameters>]
```

### LogServer
```
Invoke-Ethr -logfile <String> [-debuglogging] [-ipv4] [-ipv6] [-servermode] [-ip <String>] [-port <String>]
 [-ui] [<CommonParameters>]
```

## DESCRIPTION
This is a PowerShell Crescendo wrapper function for Microsoft ethr

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -help
Produces help from the native command

```yaml
Type: SwitchParameter
Parameter Sets: help
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -nologging
Disable logging to file.
Logging to file is enabled by default.

```yaml
Type: SwitchParameter
Parameter Sets: noLogExternal, noLogClient, noLogServer
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -logfile
Specify the file to log to.
ex: c:\output.log

```yaml
Type: String
Parameter Sets: LogExternal, LogClient, LogServer
Aliases:

Required: True
Position: Named
Default value: .\ethr.log
Accept pipeline input: False
Accept wildcard characters: False
```

### -debuglogging
Enable debug information in logging output.

```yaml
Type: SwitchParameter
Parameter Sets: LogExternal, LogClient, LogServer
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ipv4
Use only IP v4 version

```yaml
Type: SwitchParameter
Parameter Sets: noLogExternal, noLogClient, noLogServer, LogExternal, LogClient, LogServer
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ipv6
Use only IP v6 version

```yaml
Type: SwitchParameter
Parameter Sets: noLogExternal, noLogClient, noLogServer, LogExternal, LogClient, LogServer
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -servermode
Specifies to run Ethr in Server Mode.

```yaml
Type: SwitchParameter
Parameter Sets: noLogServer, LogServer
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ip
Bind to specified local IP address for TCP & UDP tests.
This must be a valid IPv4 or IPv6 address.
Default: \<empty\> - Any IP

```yaml
Type: String
Parameter Sets: noLogExternal, noLogClient, noLogServer, LogExternal, LogClient, LogServer
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -port
Use specified port number for TCP & UDP tests.
Default: 8888

```yaml
Type: String
Parameter Sets: noLogClient, noLogServer, LogClient, LogServer
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ui
Show output in text UI

```yaml
Type: SwitchParameter
Parameter Sets: noLogServer, LogServer
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -serveraddress
Run in client mode and connect to \<server\>.
Server is specified using name, FQDN or IP address.

```yaml
Type: String
Parameter Sets: noLogClient, LogClient
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -bitrate
Transmit only Bits per second (format: \<num\>\[K | M | G\])
Only valid for Bandwidth tests.
Default: 0 - Unlimited         Examples: 100 (100bits/s), 1M (1Mbits/s).

```yaml
Type: String
Parameter Sets: noLogClient, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -cport
Use specified local port number in client for TCP & UDP tests.
Default: 0 - Ephemeral Port

```yaml
Type: String
Parameter Sets: noLogExternal, noLogClient, LogExternal, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -duration
Duration for the test (format: \<num\>\[ms | s | m | h\].
0: Run forever Default: 10s

```yaml
Type: String
Parameter Sets: noLogExternal, noLogClient, LogExternal, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -gap
Time interval between successive measurements (format: \<num\>\[ms | s | m | h\]
Only valid for latency, ping and traceRoute tests.
0: No gap
Default: 1s

```yaml
Type: String
Parameter Sets: noLogExternal, noLogClient, LogExternal, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -iterations
Number of round trip iterations for each latency measurement.
Only valid for latency testing.
0Default: 1000

```yaml
Type: String
Parameter Sets: noLogClient, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -length
Length of buffer (in Bytes) to use (format: \<num\>\[KB | MB | GB\])
Only valid for Bandwidth tests.
Max 1GB.
Default: 16KB

```yaml
Type: String
Parameter Sets: noLogClient, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -throttle
Number of Parallel Sessions (and Threads).
0: Equal to number of CPUs
Default: 1

```yaml
Type: String
Parameter Sets: noLogExternal, noLogClient, LogExternal, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -clientprotocol
Protocol ('tcp', 'udp', 'http', 'https', or 'icmp')
Default: tcp

```yaml
Type: String
Parameter Sets: noLogClient, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -externalprotocol
Protocol ('tcp', or 'icmp')
Default: tcp

```yaml
Type: String
Parameter Sets: noLogExternal, LogExternal
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -receive
For Bandwidth tests, send data from server to client.

```yaml
Type: SwitchParameter
Parameter Sets: noLogClient, LogClient
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -testclient
Test to run ('b', 'c', 'p', 'l', 'pi', 'tr', or 'mtr')
b: Bandwidth
c: Connections/s
p: Packets/s
l: Latency, Loss & Jitter
pi: Ping Loss & Latency
tr: TraceRoute
mtr: MyTraceRoute with Loss & Latency
Default: b - Bandwidth measurement.

```yaml
Type: String
Parameter Sets: noLogClient, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -testexternal
Test to run ('c', 'pi', 'tr', or 'mtr')
c: Connections/s
pi: Ping Loss & Latency
tr: TraceRoute
mtr: MyTraceRoute with Loss & Latency
Default: pi - Ping Loss & Latency.

```yaml
Type: String
Parameter Sets: noLogExternal, LogExternal
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -tos
Specifies 8-bit value to use in IPv4 TOS field or IPv6 Traffic Class field.

```yaml
Type: SwitchParameter
Parameter Sets: noLogExternal, noLogClient, LogExternal, LogClient
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -warmup
Use specified number of iterations for warmup.
Default: 1

```yaml
Type: String
Parameter Sets: noLogExternal, noLogClient, LogExternal, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -logtitle
Use the given title in log files for logging results.
Default: \<empty\>

```yaml
Type: String
Parameter Sets: LogExternal, LogClient
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -destination
Run in external client mode and connect to \<destination\>.
\<destination\> is specified in URL or Host:Port format.
For URL, if port is not specified, it is assumed to be 80 for http and 443 for https.
Example: For TCP - www.microsoft.com: 443 or 10.1.0.4: 22 or https: //www.github.com
        For ICMP - www.microsoft.com or 10.1.0.4

```yaml
Type: String
Parameter Sets: noLogExternal, LogExternal
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

