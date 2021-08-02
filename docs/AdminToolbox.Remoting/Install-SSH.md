---
external help file: AdminToolbox.RemotingManifest-help.xml
Module Name: AdminToolbox.Remoting
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Install-SSH

## SYNOPSIS

## SYNTAX

### InstallFromFile
```
Install-SSH [-InstallFromScript] [-AutoServices] [-StartServices] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### InstallAsFeature
```
Install-SSH [-InstallAsFeature] [-AutoServices] [-StartServices] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### StartServices
```
Install-SSH [-StartServices] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Use this function on a local or remote endpoint to enable openssh.

Use PSRemoting to run the command on a remote endpoint.

## EXAMPLES

### EXAMPLE 1
```
Install-OpenSSH
```

Enable-OpenSSH features but don't set the services to Automatic

### EXAMPLE 2
```
Install-OpenSSH -AutoServices
```

Enable-OpenSSH features and set the services to Automatic

## PARAMETERS

### -InstallFromScript
Specifies to install from a script

```yaml
Type: SwitchParameter
Parameter Sets: InstallFromFile
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstallAsFeature
Specifies to install as a feature

```yaml
Type: SwitchParameter
Parameter Sets: InstallAsFeature
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AutoServices
Sets ssh services automatic

```yaml
Type: SwitchParameter
Parameter Sets: InstallFromFile, InstallAsFeature
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartServices
Started the ssh services

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

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

