---
external help file: AdminToolbox.ExchangeManifest-help.xml
Module Name: AdminToolbox.Exchange
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Connect-ExchangeServer

## SYNOPSIS

## SYNTAX

```
Connect-ExchangeServer [-FQDN] <Object> [<CommonParameters>]
```

## DESCRIPTION
Import a Powershell session from a remote exchange server with the exchange commands available

## EXAMPLES

### EXAMPLE 1
```
Connect-ExchangeServer -FQDN server.domain.com
```

## PARAMETERS

### -FQDN
Fully Qualified Domain name of the Exchange Servers powershell virtual directory

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
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
The powershell virtual directory must be defined on the exchange server, or this will fail

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

