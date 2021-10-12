---
external help file: AdminToolbox.ActiveDirectoryManifest-help.xml
Module Name: AdminToolbox.ActiveDirectory
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-GroupMembers

## SYNOPSIS

## SYNTAX

```
Get-GroupMembers [[-Path] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Get a list of Active Directory groups and the Members of those groups

## EXAMPLES

### EXAMPLE 1
```
Get-GroupMembers -Path "$env:USERPROFILE\downloads\AD Group Members.xlsx"
```

## PARAMETERS

### -Path
Specifies the export directory and filename for the report

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$env:USERPROFILE\downloads\AD Group Members.xlsx"
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires Active Directory and ImportExcel Modules

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

