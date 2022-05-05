---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Remove-All

## SYNOPSIS

## SYNTAX

```
Remove-All [[-hostname] <Object>] [-server] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This Command removes log files, temp files, downloads, some appdata, and empties the recycle bin.
Dependent on if it's specified this is running on a workstation or server will determine what is deleted.

## EXAMPLES

### EXAMPLE 1
```
Remove-All
```

Free up space on the local computer

### EXAMPLE 2
```
Remove-All -Hostname JackPC10
```

Free up space on a remote PC.
May be more effective if run locally.

### EXAMPLE 3
```
Remove-All -server
```

Removes folders you wouldn't want on a server such as google chrome and meeting applications in local user appdata, but that you would not want to delete on a workstation.

### EXAMPLE 4
```
Remove-All -server -hostname 'azure-rds-04.domain.tld'
```

Removes folders you wouldn't want on a remote server such as google chrome and meeting applications in local user appdata, but that you would not want to delete on a workstation.
May be more effective if run locally.

## PARAMETERS

### -hostname
Specify a remote endpoint and run cleanup against the C$ unc path.
Do not use this if the $env:systemdrive of the remote endpoint is not C:

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

### -server
{{ Fill server Description }}

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
USE AT YOUR OWN RISK.
YOU SHOULD READ AND UNDERSTAND THIS FUNCTION BEFORE USING IT.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

