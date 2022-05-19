---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Use-WSLnano

## SYNOPSIS

## SYNTAX

```
Use-WSLnano [-filepath] <Object> [<CommonParameters>]
```

## DESCRIPTION
Edit a file interactively from powershell.
Requires that Windows subsystem for linux is already enabled.

## EXAMPLES

### EXAMPLE 1
```
nano /mnt/c/windows/System32/drivers/etc/hosts
```

Edit hosts file

## PARAMETERS

### -filepath
Path to the file to be edited.

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

