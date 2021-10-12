---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Remove-OlderThan

## SYNOPSIS

## SYNTAX

```
Remove-OlderThan [-Path] <Object> [-Daysback] <Int32> [-Recurse] [<CommonParameters>]
```

## DESCRIPTION
This scripts function is to delete files and folders older than x days recursively.

## EXAMPLES

### EXAMPLE 1
```
Delete-OlderThan -Path "C:\Folder" -DaysBack "-90"
```

## PARAMETERS

### -Path
Path where files are to be deleted from

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

### -Daysback
Specify files over x days old to be deleted

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Recurse
Specify if the path should have files also removed from subfolders

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

