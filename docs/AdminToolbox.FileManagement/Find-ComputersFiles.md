---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version:
schema: 2.0.0
---

# Find-ComputersFiles

## SYNOPSIS

## SYNTAX

```
Find-ComputersFiles [-computers] <Object> [-csvout] <Object> [-include] <Object> [[-Path] <Object>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Discover queried files meeting a specific search parameter and output the findings to a spreadsheet.

## EXAMPLES

### EXAMPLE 1
```
Searches computers listed in the text file for pst files and outputs the findings to a spreadsheet.
(Computers should be line delimited)
```

find-computersfiles -computers C:\computers.txt -csvout c:\results.csv -include *.pst

### EXAMPLE 2
```
Performs the same function as the first example, except it only searches the specified path and it's subfolders.
```

find-computersfiles -computers C:\computers.txt -csvout c:\results.csv -include *.pst -path "c$\users\*\appdata\local"

## PARAMETERS

### -computers
A list of computers that are being searched

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

### -csvout
Path and filename for the CSV report

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -include
Specify filename being searched for

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Patch on the computers that are being search

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: C$
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

## RELATED LINKS

[Get-ShareNTFSReport
Get-SharePermissionsReport
Get-FileOwner]()

