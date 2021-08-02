---
external help file: AdminToolbox.EndpointManagementManifest-help.xml
Module Name: AdminToolbox.EndpointManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-Printers

## SYNOPSIS

## SYNTAX

```
Get-Printers [[-computer] <Object>] [-complex] [<CommonParameters>]
```

## DESCRIPTION
This command returns a list of local or remote printers

## EXAMPLES

### EXAMPLE 1
```
Get-Printers
```

Returns printers for the local computer only.

### EXAMPLE 2
```
Get-Printers -computer PCName
```

-Computer is used to pull printers from remote computers.

### EXAMPLE 3
```
Get-Printers -computer PCName -complex
```

Return long list of info on the printers

## PARAMETERS

### -computer
Specifies a remote computer to pull a list of printers for

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

### -complex
Specifies to additional information on the printers

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

