---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-NetworkStatistics

## SYNOPSIS
Display current TCP/IP connections for local or remote system

## SYNTAX

```
Get-NetworkStatistics [[-ProcessName] <String>] [[-Address] <String>] [[-Port] <Object>]
 [[-ComputerName] <String[]>] [-Protocol <String>] [-State <String>] [-ShowHostnames] [-ShowProcessNames]
 [-TempFile <String>] [-AddressFamily <String>] [<CommonParameters>]
```

## DESCRIPTION
Display current TCP/IP connections for local or remote system. 
Includes the process ID (PID) and process name for each connection.
If the port is not yet established, the port number is shown as an asterisk (*).

## EXAMPLES

### EXAMPLE 1
```
Get-NetworkStatistics | Format-Table
```

### EXAMPLE 2
```
Get-NetworkStatistics iexplore -computername k-it-thin-02 -ShowHostNames | Format-Table
```

### EXAMPLE 3
```
Get-NetworkStatistics -ProcessName md* -Protocol tcp
```

### EXAMPLE 4
```
Get-NetworkStatistics -Address 192* -State LISTENING
```

### EXAMPLE 5
```
Get-NetworkStatistics -State LISTENING -Protocol tcp
```

### EXAMPLE 6
```
Get-NetworkStatistics -Computername Computer1, Computer2
```

### EXAMPLE 7
```
'Computer1', 'Computer2' | Get-NetworkStatistics
```

### EXAMPLE 8
```
Get-NetworkStatistics | where {$_.LocalAddress -like "192.168.240.8"} | sort processname | ft
```

## PARAMETERS

### -ProcessName
Gets connections by the name of the process.
The default value is '*'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Address
Gets connections by the IP address of the connection, local or remote.
Wildcard is supported.
The default value is '*'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
The port number of the local computer or remote computer.
The default value is '*'.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
If defined, run this command on a remote system via WMI. 
\\\\computername\c$\netstat.txt is created on that system and the results returned here

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Protocol
The name of the protocol (TCP or UDP).
The default value is '*' (all)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
Indicates the state of a TCP connection.
The possible states are as follows:

Closed       - The TCP connection is closed.
Close_Wait   - The local endpoint of the TCP connection is waiting for a connection termination request from the local user.
Closing      - The local endpoint of the TCP connection is waiting for an acknowledgement of the connection termination request sent previously.
Delete_Tcb   - The transmission control buffer (TCB) for the TCP connection is being deleted.
Established  - The TCP handshake is complete.
The connection has been established and data can be sent.
Fin_Wait_1   - The local endpoint of the TCP connection is waiting for a connection termination request from the remote endpoint or for an acknowledgement of the connection termination request sent previously.
Fin_Wait_2   - The local endpoint of the TCP connection is waiting for a connection termination request from the remote endpoint.
Last_Ack     - The local endpoint of the TCP connection is waiting for the final acknowledgement of the connection termination request sent previously.
Listen       - The local endpoint of the TCP connection is listening for a connection request from any remote endpoint.
Syn_Received - The local endpoint of the TCP connection has sent and received a connection request and is waiting for an acknowledgment.
Syn_Sent     - The local endpoint of the TCP connection has sent the remote endpoint a segment header with the synchronize (SYN) control bit set and is waiting for a matching connection request.
Time_Wait    - The local endpoint of the TCP connection is waiting for enough time to pass to ensure that the remote endpoint received the acknowledgement of its connection termination request.
Unknown      - The TCP connection state is unknown.

Values are based on the TcpState Enumeration:
http://msdn.microsoft.com/en-us/library/system.net.networkinformation.tcpstate%28VS.85%29.aspx

Cookie Monster - modified these to match netstat output per here:
http://support.microsoft.com/kb/137984

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowHostnames
If specified, will attempt to resolve local and remote addresses.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowProcessNames
{{ Fill ShowProcessNames Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -TempFile
Temporary file to store results on remote system. 
Must be relative to remote system (not a file share). 
Default is "C:\netstat.txt"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: C:\netstat.txt
Accept pipeline input: False
Accept wildcard characters: False
```

### -AddressFamily
Filter by IP Address family: IPv4, IPv6, or the default, * (both).

If specified, we display any result where both the localaddress and the remoteaddress is in the address family.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSObject
## NOTES
Author: Shay Levy, code butchered by Cookie Monster
Shay's Blog: http://PowerShay.com
Cookie Monster's Blog: http://ramblingcookiemonster.github.io/

## RELATED LINKS
