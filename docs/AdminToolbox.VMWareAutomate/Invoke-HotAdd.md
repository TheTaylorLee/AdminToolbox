---
external help file: AdminToolbox.VMWareAutomateManifest-help.xml
Module Name: AdminToolbox.VMWareAutomate
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-HotAdd

## SYNOPSIS

## SYNTAX

### Disable Mem Hotadd
```
Invoke-HotAdd [-DisableMem] [-VMName <Object>] [<CommonParameters>]
```

### Disable CPU Hotadd
```
Invoke-HotAdd [-DisableCPU] [-VMName <Object>] [<CommonParameters>]
```

### Enable Mem Hotadd
```
Invoke-HotAdd [-EnableMem] [-VMName <Object>] [<CommonParameters>]
```

### Enable CPU Hotadd
```
Invoke-HotAdd [-EnableCpu] [-VMName <Object>] [<CommonParameters>]
```

## DESCRIPTION
Modify Hotadd settings for a single or all VM's

## EXAMPLES

### EXAMPLE 1
```
Invoke-HotAdd -DisableMem
```

Disable Memory HotAdd on all VM's

### EXAMPLE 2
```
Invoke-HotAdd -DisableMem -VMName ExchangeServer
```

Disable Memory HotAdd on a single vm

## PARAMETERS

### -DisableMem
Specify disabling Memory Hotadd

```yaml
Type: SwitchParameter
Parameter Sets: Disable Mem Hotadd
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisableCPU
Specify disabling CPU Hotadd

```yaml
Type: SwitchParameter
Parameter Sets: Disable CPU Hotadd
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableMem
Specify enabling Memory Hotadd

```yaml
Type: SwitchParameter
Parameter Sets: Enable Mem Hotadd
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableCpu
Specify enabling CPU Hotadd

```yaml
Type: SwitchParameter
Parameter Sets: Enable CPU Hotadd
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -VMName
Specify a specific VM to change HotAdd settings for

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

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

