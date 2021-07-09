---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-AddressObject

## SYNOPSIS

## SYNTAX

```
New-AddressObject [-AddressName] <Object> [-IPAddress] <Object> [-SubnetMask] <Object> [<CommonParameters>]
```

## DESCRIPTION
Create a New Address Object

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
AddressName   = "ComanyLan_192.168.0.1/26"
IPAddress     = "192.168.0.1"
SubnetMask    = "255.255.255.192"
}
```

New-AddressObject @params

## PARAMETERS

### -AddressName
Specify a Unique name for the Address Object

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

### -IPAddress
Specify a IPAddress that will be ranged by the subnet mask

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

### -SubnetMask
Specify a SubnetMask for the IPAddress

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

