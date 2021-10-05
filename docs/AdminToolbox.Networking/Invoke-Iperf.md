---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-Iperf

## SYNOPSIS

## SYNTAX

### help
```
Invoke-Iperf [-help] [-version] [<CommonParameters>]
```

### Client
```
Invoke-Iperf [-port <String>] [-format <String>] [-interval <String>] [-file <String>] [-bind <String>]
 [-verboseout] [-json] [-logfile <String>] [-debugout] [-daemon] [-client] [-udp] [-bandwidth <String>]
 [-time <String>] [-bytes <String>] [-blockcount <String>] [-bufferlength <String>] [-cport <String>]
 [-parallel <String>] [-reverse] [-window <String>] [-mtu <String>] [-nodelay] [-ipv4only] [-ipv6only]
 [-tos <String>] [-zerocopy] [-omitseconds <String>] [-Title <String>] [-showserveroutput <String>]
 [-udp64bitcounters <String>] [<CommonParameters>]
```

### Server
```
Invoke-Iperf [-port <String>] [-format <String>] [-interval <String>] [-file <String>] [-bind <String>]
 [-verboseout] [-json] [-logfile <String>] [-debugout] [-server] [-daemon] [-pidfile] [-oneoff]
 [<CommonParameters>]
```

## DESCRIPTION
This is a PowerShell Crescendo wrapper function for Iperf3
\[KMG\] indicates options that support a K/M/G suffix for kilo-, mega-, or giga-
If string input is accepted for a parameter, the first line fo the description help indicates the expected value type.

## EXAMPLES

### EXAMPLE 1
```
Invoke-Iperf -server -port 12345
```

Setup a iperf server connection using port 12345

### EXAMPLE 2
```
Invoke-Iperf -client -serverip 0.0.0.0 -port 12345 -parallel 8
```

Initiate a client bandwidth test with parallel connections

## PARAMETERS

### -help
Get native help for Iperf3.exe

```yaml
Type: SwitchParameter
Parameter Sets: help
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -version
show version information and quit

```yaml
Type: SwitchParameter
Parameter Sets: help
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -port
#
server port to listen on/connect to

```yaml
Type: String
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -format
\[kmgKMG\]
format to report: Kbits, Mbits, KBytes, MBytes

```yaml
Type: String
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -interval
#
seconds between periodic bandwidth reports

```yaml
Type: String
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -file
xmit/recv the specified file

```yaml
Type: String
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -bind
host
bind to a specific interface

```yaml
Type: String
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -verboseout
more detailed output

```yaml
Type: SwitchParameter
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -json
output in JSON format

```yaml
Type: SwitchParameter
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -logfile
f
send output to logfile

```yaml
Type: String
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -debugout
emit debugging output

```yaml
Type: SwitchParameter
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -server
run in server mode

```yaml
Type: SwitchParameter
Parameter Sets: Server
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -daemon
run the server as a daemon

```yaml
Type: SwitchParameter
Parameter Sets: Client, Server
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -pidfile
file
write PID file

```yaml
Type: SwitchParameter
Parameter Sets: Server
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -oneoff
handle one client connection then exit

```yaml
Type: SwitchParameter
Parameter Sets: Server
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -client
host
run in client mode, connecting to \<host\>

```yaml
Type: SwitchParameter
Parameter Sets: Client
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -udp
use UDP rather than TCP

```yaml
Type: SwitchParameter
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -bandwidth
#\[KMG\]\[/#\]
target bandwidth in bits/sec (0 for unlimited)
(default 1 Mbit/sec for UDP, unlimited for TCP)
(optional slash and packet count for burst mode)

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -time
#
time in seconds to transmit for (default 10 secs)

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -bytes
#\[KMG\]
number of bytes to transmit (instead of -t)

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -blockcount
#\[KMG\]
number of blocks (packets) to transmit (instead of -t or -n)

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -bufferlength
#\[KMG\]
length of buffer to read or write
(default 128 KB for TCP, 8 KB for UDP)

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -cport
port
bind to a specific client port (TCP and UDP, default: ephemeral port)

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -parallel
#
number of parallel client streams to run

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -reverse
run in reverse mode (server sends, client receives)

```yaml
Type: SwitchParameter
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -window
#\[KMG\]
set window size / socket buffer size

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -mtu
#
set TCP/SCTP maximum segment size (MTU - 40 bytes)

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -nodelay
set TCP/SCTP no delay, disabling Nagle's Algorithm

```yaml
Type: SwitchParameter
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ipv4only
only use IPv4

```yaml
Type: SwitchParameter
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ipv6only
only use IPv6

```yaml
Type: SwitchParameter
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -tos
set the IP 'type of service'

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -zerocopy
use a 'zero copy' method of sending data

```yaml
Type: SwitchParameter
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -omitseconds
omit the first n seconds

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
prefix every output line with this string

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -showserveroutput
get results from server

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -udp64bitcounters
use 64-bit counters in UDP test packets

```yaml
Type: String
Parameter Sets: Client
Aliases:

Required: False
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

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

