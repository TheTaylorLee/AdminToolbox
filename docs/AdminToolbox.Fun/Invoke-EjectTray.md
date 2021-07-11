---
external help file: AdminToolbox.FunManifest-help.xml
Module Name: AdminToolbox.Fun
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-EjectTray

## SYNOPSIS
This script helps in ejecting or closing the CD/DVD Drive

## SYNTAX

```
Invoke-EjectTray [-Eject] [-Close] [<CommonParameters>]
```

## DESCRIPTION
This script helps in ejecting or closing the CD/DVD Drive

## EXAMPLES

### EXAMPLE 1
```
Invoke-EjectTray -Eject
```

Ejects the CD Drive

### EXAMPLE 2
```
Invoke-EjectTray -Close
```

Closes the CD Drive

### EXAMPLE 3
```
Invoke-Command -Computername CoWorkerPC -Scriptblock {Import-Module Admintoolbox -force; Invoke-EjectTray -Eject}
```

Closes the CD Drive on another PC

## PARAMETERS

### -Eject
Ejects the CD/DVD Drive

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

### -Close
Closes the CD/DVD Drive

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
Author : Sitaram Pamarthi
WebSite: http://techibee.com

## RELATED LINKS
