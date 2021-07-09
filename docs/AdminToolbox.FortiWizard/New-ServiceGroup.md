---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-ServiceGroup

## SYNOPSIS

## SYNTAX

```
New-ServiceGroup [-ServiceGroupName] <Object> [-Members] <Object> [<CommonParameters>]
```

## DESCRIPTION
Create a new ServiceGroup Object

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
ServiceGroupName   = "ExchangeServers"
TCPPortRange       = "Exchange01 Exchange02"
}
```

New-ServiceGroup @params

## PARAMETERS

### -ServiceGroupName
Specify a Unique name for the ServiceGroup Object

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

### -Members
Specify the ServiceGroup Members

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

