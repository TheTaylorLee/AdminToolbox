---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version:
schema: 2.0.0
---

# Get-FolderSize

## SYNOPSIS

## SYNTAX

```
Get-FolderSize [-Folder] <Object> [[-ByteSize] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Quickly Finds the size of a path

## EXAMPLES

### EXAMPLE 1
```
Finds the size of the C:\users folder in MegaBytes
```

Get-Foldersize -Folder c:\users\ -ByteSize MB

### EXAMPLE 2
```
Finds the size of the C:\users folder in GigaBytes
```

Get-Foldersize -Folder c:\users\ -ByteSize GB

### EXAMPLE 3
```
Finds the size of the C:\users folder in MegaBytes
```

Get-Foldersize -Folder c:\users\ -ByteSize TB

## PARAMETERS

### -Folder
Folder that is being audited for size

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

### -ByteSize
Measurement used for displaying the folder size

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
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
