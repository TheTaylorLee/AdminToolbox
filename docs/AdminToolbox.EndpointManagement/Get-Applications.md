---
external help file: AdminToolbox.EndpointManagementManifest-help.xml
Module Name: AdminToolbox.EndpointManagement
online version:
schema: 2.0.0
---

# Get-Applications

## SYNOPSIS
Sourced from https://mcpmag.com/articles/2017/07/27/gathering-installed-software-using-powershell.aspx
Created by Boe Prox

## SYNTAX

```
Get-Applications [[-Computername] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Get detailed information on installed applications and their uninstall strings.

## EXAMPLES

### EXAMPLE 1
```
Get installed software outputted to a table
```

Get-Software | ft

### EXAMPLE 2
```
Get installed software on all online domain joined Endpoints
```

$Computername = get-adcomputer -filter *
$computername = Get-Software

### EXAMPLE 3
```
Get installed software on all computers listed in a text file
```

$Computername = get-content c:\computers.txt
$computername = Get-Software

## PARAMETERS

### -Computername
For specifying a remote computer to get an application list from

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $env:COMPUTERNAME
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Software.Inventory
## NOTES

## RELATED LINKS

[Uninstall-Application]()

