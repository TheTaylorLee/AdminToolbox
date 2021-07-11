---
external help file: AdminToolbox.ActiveDirectoryManifest-help.xml
Module Name: AdminToolbox.ActiveDirectory
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-EndpointReport

## SYNOPSIS

## SYNTAX

```
Get-EndpointReport [-Path] <Object> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Create a CSV report of Active Directory Endpoints

## EXAMPLES

### EXAMPLE 1
```
Be sure to specify a filename and extension for the report.
```

Get-EndpointReport -path C:\UserReport.csv

## PARAMETERS

### -Path
Output path and filename for the report file

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
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
Requires the Active Directory Module

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

