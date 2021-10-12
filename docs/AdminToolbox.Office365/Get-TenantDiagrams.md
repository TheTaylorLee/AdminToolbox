---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-TenantDiagrams

## SYNOPSIS

## SYNTAX

```
Get-TenantDiagrams [-theme] <Object> [-OutputFilePath] <String> [[-LabelVerbosity] <Int32>]
 [[-CategoryDepth] <Int32>] [[-OutputFormat] <String>] [[-Direction] <String>] [<CommonParameters>]
```

## DESCRIPTION
This funcion expands on the AZViz module by PrateekSingh.
That module can export Azure resourcegroups to create dependency diagrams.
This function will loop through all resource groups to create a diagram for all in a tenant and export them into a logical folder structure.

## EXAMPLES

### EXAMPLE 1
```
Get-TenantDiagrams -theme light -OutputFilePath (Get-FolderName) -Direction left-to-right -CategoryDepth 3 -LabelVerbosity 1
```

## PARAMETERS

### -theme
{{ Fill theme Description }}

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

### -OutputFilePath
{{ Fill OutputFilePath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LabelVerbosity
{{ Fill LabelVerbosity Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -CategoryDepth
{{ Fill CategoryDepth Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 3
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputFormat
{{ Fill OutputFormat Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Png
Accept pipeline input: False
Accept wildcard characters: False
```

### -Direction
{{ Fill Direction Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: Left-to-right
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Tested and compatible with AZViz version 1.0.9 and PSGraph version 2.1.38.27.
If not working in the future look for changes in those modules versions

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

