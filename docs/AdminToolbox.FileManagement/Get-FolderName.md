---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version:
schema: 2.0.0
---

# Get-FolderName

## SYNOPSIS

## SYNTAX

```
Get-FolderName [[-Description] <String>] [[-RootFolder] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get a gui prompt for Specifying a folder name

## EXAMPLES

### EXAMPLE 1
```
$Folder = Get-Foldername
```

Creates a prompt to select a folder and then saves the path to a variable.

## PARAMETERS

### -Description
{{ Fill Description Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Select Folder
Accept pipeline input: False
Accept wildcard characters: False
```

### -RootFolder
{{ Fill RootFolder Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Desktop
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-FileName]()

