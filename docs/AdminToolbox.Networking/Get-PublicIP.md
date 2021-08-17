---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-PublicIP

## SYNOPSIS

## SYNTAX

```
Get-PublicIP [[-IP] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Returns WhoIS public IP info for your location or any specified public IP

## EXAMPLES

### EXAMPLE 1
```
Get-PublicIP
```

Returns local Public IP Info

### EXAMPLE 2
```
Get-PublicIP -IP 8.8.8.8
```

Returns Public IP Info for 8.8.8.8

## PARAMETERS

### -IP
Specify an IP to get WhoIs info for

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

