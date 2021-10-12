---
external help file: AdminToolbox.VMWareAutomateManifest-help.xml
Module Name: AdminToolbox.VMWareAutomate
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-VMTools

## SYNOPSIS

## SYNTAX

### AllTools
```
Get-VMTools [-AllTools] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### OutDatedTools
```
Get-VMTools [-OutDatedTools] [-Unmanaged] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Get Virtual Machines that have outdated VMWare Tools or all Virtual Machine tools versions.

## EXAMPLES

### EXAMPLE 1
```
Get-VMTools
```

### EXAMPLE 2
```
Get-VMTools -Alltools
```

Show tools versions for all VM's

### EXAMPLE 3
```
Get-VMTools -OutDatedTools
```

Only show VM's with Outdated Tools

### EXAMPLE 4
```
Get-VMTools -OutDatedTools -Unmanaged
```

Show VM's with Outdated Tools and include unmanaged tools

## PARAMETERS

### -AllTools
Specifies if VMTools Status should be retrieved for all VM's

```yaml
Type: SwitchParameter
Parameter Sets: AllTools
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutDatedTools
Specifies if VMTools Status should be retrieved for only outdated VM's

```yaml
Type: SwitchParameter
Parameter Sets: OutDatedTools
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unmanaged
Specifies if VMTools Status should be retrieved for unmanaged VM's

```yaml
Type: SwitchParameter
Parameter Sets: OutDatedTools
Aliases:

Required: False
Position: Named
Default value: False
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
Requires the VMware.PowerCLI Module

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

