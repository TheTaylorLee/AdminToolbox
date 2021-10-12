---
external help file: AdminToolbox.RemotingManifest-help.xml
Module Name: AdminToolbox.Remoting
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-QWinSta

## SYNOPSIS

## SYNTAX

```
Invoke-QWinSta [-Server] <Object> [<CommonParameters>]
```

## DESCRIPTION
Wrapper function for qwinsta to get rdp sessions

## EXAMPLES

### EXAMPLE 1
```
Invoke-QWinSta -Server name.domain.tld
```

Find remote sessions

## PARAMETERS

### -Server
specify the target server to run qwinsta against

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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

