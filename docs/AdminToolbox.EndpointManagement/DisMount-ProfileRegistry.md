---
external help file: AdminToolbox.EndpointManagementManifest-help.xml
Module Name: AdminToolbox.EndpointManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# DisMount-ProfileRegistry

## SYNOPSIS

## SYNTAX

```
DisMount-ProfileRegistry [-SamAccountName] <Object> [<CommonParameters>]
```

## DESCRIPTION
Loads any local users registry hive into the registry as a friendly name.
Useful for modifying a users registry without the need of them being logged in locally.

## EXAMPLES

### EXAMPLE 1
```
DisMount-ProfileRegistry -SamAccountName JohnS
```

DisMounts the Mounted ProfileRegistry

## PARAMETERS

### -SamAccountName
SamAccountName of the domain account that you are mounting the local registry for.

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

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

