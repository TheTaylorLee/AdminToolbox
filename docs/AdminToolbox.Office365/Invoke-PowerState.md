---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
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
Invoke-Powerstate -Shutdown -Force
```

Specifies the selected VM's will be shutdown forcefully

### EXAMPLE 2
```
Invoke-Powerstate -Restart
```

Specifies the selected VM's will be restarted

### EXAMPLE 3
```
Invoke-Powerstate -Start
```

Specifies the selected VM's will be Started

### EXAMPLE 4
```
Invoke-Powerstate -status
```

Specifies the discover of VM statuses

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

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

