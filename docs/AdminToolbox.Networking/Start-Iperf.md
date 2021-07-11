---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Start-Iperf

## SYNOPSIS

## SYNTAX

### Server
```
Start-Iperf [-server] -port <Object> [<CommonParameters>]
```

### Client
```
Start-Iperf [-client] [-udp] -serverip <Object> -port <Object> [<CommonParameters>]
```

## DESCRIPTION
Setup and iperf server or client connection for testing connection speeds

## EXAMPLES

### EXAMPLE 1
```
Setup a iperf server connection
```

Start-Iperf -server -port 10555

### EXAMPLE 2
```
Initiate a client bandwidth test
```

Start-Iperf -client -serverip 0.0.0.0 -port 10555

### EXAMPLE 3
```
Initiate a client bandwidth test
```

Start-Iperf -Client -serverip 0.0.0.0 --port 10555 udp

## PARAMETERS

### -server
Specify if running in server mode

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

### -client
Specify if running in client mode

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
Specify to use udp

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

### -serverip
Specify the ip of the server connecting to when in client mode

```yaml
Type: Object
Parameter Sets: Client
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -port
specify the port for the client and server connections

```yaml
Type: Object
Parameter Sets: (All)
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

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

