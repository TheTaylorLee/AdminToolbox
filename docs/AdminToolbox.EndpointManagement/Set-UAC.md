---
external help file: AdminToolbox.EndpointManagementManifest-help.xml
Module Name: AdminToolbox.EndpointManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Set-UAC

## SYNOPSIS

## SYNTAX

### Disable
```
Set-UAC [-Disable] [<CommonParameters>]
```

### DisablePrompt
```
Set-UAC [-DisablePrompt] [<CommonParameters>]
```

### Enable
```
Set-UAC [-Enable] [<CommonParameters>]
```

## DESCRIPTION
This function can Enable/Disable UserAccountControl entirely or just the Prompt Behavior

## EXAMPLES

### EXAMPLE 1
```
Set-UAC -DisablePrompt
```

Disabled UAC Prompting for Admins, but keeps UAC enabled

### EXAMPLE 2
```
Set-UAC -Disable
```

Disabled UAC Entirely

### EXAMPLE 3
```
Set-UAC -Enable
```

Enable UAC Entirely

## PARAMETERS

### -Disable
Disables UAC entirely

```yaml
Type: SwitchParameter
Parameter Sets: Disable
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisablePrompt
Disables UAC prompting only but leaves UAC enabled

```yaml
Type: SwitchParameter
Parameter Sets: DisablePrompt
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enable
Enables UAC

```yaml
Type: SwitchParameter
Parameter Sets: Enable
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

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

