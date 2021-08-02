---
external help file: AdminToolbox.RemotingManifest-help.xml
Module Name: AdminToolbox.Remoting
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-ServiceRecovery

## SYNOPSIS

## SYNTAX

```
Invoke-ServiceRecovery [-DisplayNameLike] <Object> [[-FromLog] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Restart one or multiple services that share a part of a Service Displayname

The purpose of this command is recover from issues with widely distributed services.
Example would be an antivirus service or Remote Access Agents providing trouble.

## EXAMPLES

### EXAMPLE 1
```
Invoke-ServiceRecovery -DisplayNameLike Kaseya
```

Restart specified service on all domain endpoints

### EXAMPLE 2
```
Invoke-ServiceRecovery -DisplayNameLike Kaseya -FromLog .\servicerecovery_log_0911.txt
```

Restart specified service on all remaining endpoints using the failed endpoints log.

## PARAMETERS

### -DisplayNameLike
Specify a full or partial name match for the service

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

### -FromLog
Specifies to pickup failed service recoveries from a log file

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
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
Must be Run from a DC or have the ActiveDirectory Module imported

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

