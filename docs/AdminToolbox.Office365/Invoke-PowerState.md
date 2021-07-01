---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version:
schema: 2.0.0
---

# Invoke-PowerState

## SYNOPSIS

## SYNTAX

### Shutdown
```
Invoke-PowerState [-Force] [-Shutdown] [<CommonParameters>]
```

### Restart
```
Invoke-PowerState [-Restart] [<CommonParameters>]
```

### Start
```
Invoke-PowerState [-Start] [<CommonParameters>]
```

### Status
```
Invoke-PowerState [-Status] [<CommonParameters>]
```

## DESCRIPTION
Modify the powerstate of one or more VMs at once.
This command can also be used to discover the statuses.

## EXAMPLES

### EXAMPLE 1
```
Specifies the selected VM's will be shutdown forcefully
```

Invoke-Powerstate -Shutdown -Force

### EXAMPLE 2
```
Specifies the selected VM's will be restarted
```

Invoke-Powerstate -Restart

### EXAMPLE 3
```
Specifies the selected VM's will be Started
```

Invoke-Powerstate -Start

### EXAMPLE 4
```
Specifies the discover of VM statuses
```

Invoke-Powerstate -status

## PARAMETERS

### -Force
Used to force the shutdown of VMs.
Not recommended unless you are aware of the risks involved.

```yaml
Type: SwitchParameter
Parameter Sets: Shutdown
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Restart
Specifies Restarting the VM or VMs

```yaml
Type: SwitchParameter
Parameter Sets: Restart
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Shutdown
Specifies Shutting Down the VM or VMs

```yaml
Type: SwitchParameter
Parameter Sets: Shutdown
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Start
Specifies Starting the VM or VMs

```yaml
Type: SwitchParameter
Parameter Sets: Start
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Specifies showing the status of the VM or VMs

```yaml
Type: SwitchParameter
Parameter Sets: Status
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
Requires the AZ module be installed, imported, and Connected.

## RELATED LINKS

[Get-AzVM
New-AzVM
Remove-AzVM
Restart-AzVM
Stop-AzVM
Update-AzVM]()

