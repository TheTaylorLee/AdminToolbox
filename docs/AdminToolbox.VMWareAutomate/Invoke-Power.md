---
external help file: AdminToolbox.VMWareAutomateManifest-help.xml
Module Name: AdminToolbox.VMWareAutomate
online version:
schema: 2.0.0
---

# Invoke-Power

## SYNOPSIS

## SYNTAX

### Power Cycle VM
```
Invoke-Power [-powercyclevm] -VM <Object> [<CommonParameters>]
```

### Restart Guest
```
Invoke-Power [-restartguest] -VM <Object> [<CommonParameters>]
```

### Power Off Guest
```
Invoke-Power [-poweroffguest] -VM <Object> [<CommonParameters>]
```

### Power Off VM
```
Invoke-Power [-poweroffvm] -VM <Object> [<CommonParameters>]
```

### Power On VM
```
Invoke-Power [-poweronvm] -VM <Object> [<CommonParameters>]
```

## DESCRIPTION
Use to alter VM Power states and reboot VM's.

## EXAMPLES

### EXAMPLE 1
```
Gracefully Restart the Guest
```

Invoke-Power -restartguest -VM vmname

### EXAMPLE 2
```
Gracefully shutdown the Guest
```

Invoke-Power -poweroffguest -VM vmname

### EXAMPLE 3
```
Hard Power Cycle VM
```

Invoke-Power -powercycle -VM vmname

### EXAMPLE 4
```
Hard Power Off Vm
```

Invoke-Power -poweroff -VM vmname

### EXAMPLE 5
```
Hard power on VM
```

Invoke-Power -poweron -VM vmname

## PARAMETERS

### -powercyclevm
Specifies the VM should be Power Cycled

```yaml
Type: SwitchParameter
Parameter Sets: Power Cycle VM
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -restartguest
Specifies the VM guest should be restarted

```yaml
Type: SwitchParameter
Parameter Sets: Restart Guest
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -poweroffguest
Specifies the VM guest should be Powered off

```yaml
Type: SwitchParameter
Parameter Sets: Power Off Guest
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -poweroffvm
Specifies the VM should be Powered off

```yaml
Type: SwitchParameter
Parameter Sets: Power Off VM
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -poweronvm
Specifies the VM should be Powered on

```yaml
Type: SwitchParameter
Parameter Sets: Power On VM
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -VM
Specifies the VM Name

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the VMware.PowerCLI Module

## RELATED LINKS
