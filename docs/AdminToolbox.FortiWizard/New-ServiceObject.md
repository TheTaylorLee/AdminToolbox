---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-ServiceObject

## SYNOPSIS

## SYNTAX

### UDP
```
New-ServiceObject -ServiceName <Object> -UDPPortRange <Object> [<CommonParameters>]
```

### TCP
```
New-ServiceObject -ServiceName <Object> -TCPPortRange <Object> [<CommonParameters>]
```

## DESCRIPTION
Create a new Service Object

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
ServiceName   = "OWA"
TCPPortRange  = "443"
}
```

New-ServiceObject @params

### EXAMPLE 2
```
If you require a range of ports specify the parameter range like shown here.
```

$Params = @{
ServiceName   = "RTP"
UDPPortRange  = "10000-11000"
}

New-ServiceObject @params

## PARAMETERS

### -ServiceName
Specify a Unique name for the Service Object

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

### -TCPPortRange
Specify the TCP port or port range

```yaml
Type: Object
Parameter Sets: TCP
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UDPPortRange
Specify the UDP port or port range

```yaml
Type: Object
Parameter Sets: UDP
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

