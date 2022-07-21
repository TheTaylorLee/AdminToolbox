---
external help file: AdminToolbox.MSGraphManifest-help.xml
Module Name: AdminToolbox.MSGraph
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-msgSignIns

## SYNOPSIS

## SYNTAX

### all
```
Get-msgSignIns [-all] [<CommonParameters>]
```

### top
```
Get-msgSignIns -top <Int32> [<CommonParameters>]
```

## DESCRIPTION
Get an audit log of authentication attempts

## EXAMPLES

### EXAMPLE 1
```
Get-msgSignIns -top 100
```

Get only the top 100 or other specified number of available sign in logs.

### EXAMPLE 2
```
Get-msgSignIns -all
```

Get all available sign in logs.
Depending on retention this can take a very long time or never end.

## PARAMETERS

### -all
Specifiy to return all logs

```yaml
Type: SwitchParameter
Parameter Sets: all
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -top
Specify a number of logs to return.

```yaml
Type: Int32
Parameter Sets: top
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires Azure AD licensing

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

