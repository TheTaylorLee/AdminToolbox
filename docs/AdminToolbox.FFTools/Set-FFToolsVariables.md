---
external help file: AdminToolbox.FFToolsManifest-help.xml
Module Name: AdminToolbox.FFTools
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Set-FFToolsVariables

## SYNOPSIS

## SYNTAX

```
Set-FFToolsVariables [-environment] <String> [-FFToolsSource] <String> [-FFToolsTarget] <String>
 [<CommonParameters>]
```

## DESCRIPTION
This function creates environment variables that persist after powershell closes.
The created variables will be used across multiple FFTools Functions.

Variables created are a source folder for media processed, and an output folder for processed media.

## EXAMPLES

### EXAMPLE 1
```
Set-FFToolsVariables -Source "c:\media\"" -Target "c:\media\out\"
```

Creates persistent environment variables.
Be sure to include a closing backslash for the parameters.

## PARAMETERS

### -environment
Specify whether you whish the environment variables to be stored for yourself 'user' or system wide 'machine'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FFToolsSource
Source path of media to be processed

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

### -FFToolsTarget
Target path for processed Media

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

