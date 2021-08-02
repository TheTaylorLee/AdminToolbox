---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# Disable-SipALG

## SYNOPSIS

## SYNTAX

```
Disable-SipALG [-LessThanMajor6Minor2] [<CommonParameters>]
```

## DESCRIPTION
Creates a Fortigate Config Script for disabling SIP ALG

## EXAMPLES

### EXAMPLE 1
```
Disable-SipALG -LessThanMajor6Minor2
```

Disables SIP ALG for Versions on FortiOS Versions prior to version 6.2

### EXAMPLE 2
```
New-SSHSession -computername 192.168.0.1
$command = Disable-SipALG -LessThanMajor6Minor2
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```

This example generates an SSH session and invokes the output of this function against that session.

### EXAMPLE 3
```
New-SSHSession -computername 192.168.0.1
New-SSHSession -computername 192.168.1.1
$command = Disable-SipALG -LessThanMajor6Minor2
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Write-Output "Invoking Command against $session.host"
    $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
    $result.output
}
```

This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

## PARAMETERS

### -LessThanMajor6Minor2
Specifies if the FortiOS version is lest than version 6.2.
In this scenario a different set of commands are used

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

