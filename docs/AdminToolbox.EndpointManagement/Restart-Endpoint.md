---
external help file: AdminToolbox.EndpointManagementManifest-help.xml
Module Name: AdminToolbox.EndpointManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Restart-Endpoint

## SYNOPSIS

## SYNTAX

```
Restart-Endpoint [-Hours] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Sets a countdown to restart the Endpoint.
The command uses a multiplier set to 1 hour.
You can use decimals to return shorter than an hour restart times or get X hours and X minutes.

## EXAMPLES

### EXAMPLE 1
```
Restart-Endpoint -Hours 5
```

Restarts the Endpoint in 5 Hours

### EXAMPLE 2
```
Restart-Endpoint -Hours 5.25
```

Restarts the Endpoint in 5 hours and 15 minutes

### EXAMPLE 3
```
Restart-Endpoint -Hours 0.25
```

Restarts the Endpoint in 15 minutes

## PARAMETERS

### -Hours
Specify x hours until restart

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
The parameter must be typed when entering the command and not after.
If you typed the command and then entered the parameter when prompted the command will fail.
\

When using decimal values understand that the value is multiplying against the number of seconds in an hour.
\
So all multiplication needs to be done as a fraction of 1.
Don't try thinking that it needs to be done against the value of 60 for seconds or hours.
\
View the Examples for clarification.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

