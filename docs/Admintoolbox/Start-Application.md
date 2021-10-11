---
external help file: AdminToolboxManifest-help.xml
Module Name: Admintoolbox
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Start-Application

## SYNOPSIS

## SYNTAX

### Application (Default)
```
Start-Application [-Application] <String> [<CommonParameters>]
```

### Index
```
Start-Application [-Index] [<CommonParameters>]
```

## DESCRIPTION
Launch most applications using powershell and the name of the executable

## EXAMPLES

### EXAMPLE 1
```
Start-Application -Application outlook
```

Launch and Application

### EXAMPLE 2
```
app outlook
```

Launch an application using the function alias and without specifying the application parameter

### EXAMPLE 3
```
Start-Application -index
```

Build the index used for launching applications.
Can be run again to update the index when needed

## PARAMETERS

### -Application
Specify all or part of the name for an applications EXE or msc file

```yaml
Type: String
Parameter Sets: Application
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Index
Used to build an index of application executables and msc files

```yaml
Type: SwitchParameter
Parameter Sets: Index
Aliases:

Required: True
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
Uses the private function Get-Elevation

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

