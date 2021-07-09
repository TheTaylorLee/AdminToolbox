---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# Enable-Management

## SYNOPSIS

## SYNTAX

```
Enable-Management [[-AdminUsername] <String>] [-WANInterfaceName] <Object> [<CommonParameters>]
```

## DESCRIPTION
Configures trusted hosts that the admin account may connect from and enables management from the WAN interface!

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
AdminUsername    = "admin"
WANInterfaceName = "port1"
}
```

Enable-Management @Params

## PARAMETERS

### -AdminUsername
{{ Fill AdminUsername Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Admin
Accept pipeline input: False
Accept wildcard characters: False
```

### -WANInterfaceName
Name of the Wan Interface

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

