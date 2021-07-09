---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-AddressGroup

## SYNOPSIS

## SYNTAX

```
New-AddressGroup [-GroupName] <Object> [-AddressNames] <Object> [<CommonParameters>]
```

## DESCRIPTION
Create a New Address Object

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
AddressNames = "vlan10 vlan100 vlan 110 vlan200"
GroupName    = "Internal_Vlans"
}
```

New-AddressGroup @params

## PARAMETERS

### -GroupName
The Name of the AddressGroup

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

### -AddressNames
Specify AddressNames that are to be a member of this group.
Space delimited and the full string wrapped in only one set of quotes.

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

