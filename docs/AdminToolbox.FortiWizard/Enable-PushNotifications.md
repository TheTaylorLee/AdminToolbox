---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# Enable-PushNotifications

## SYNOPSIS

## SYNTAX

```
Enable-PushNotifications [-UnusedPort] <Object> [-WanInterfaceName] <Object> [-WanIP] <Object>
 [<CommonParameters>]
```

## DESCRIPTION
Enable Push Notifications for Fortitokenson a Public Interface

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
    UnusedPort        = "26357"
    WanInterfaceName  = "wan1"
    WanIP             = "1.1.1.1"
}
Enable-PushNotifications @params
```

This example enables push notifications on wan1 using port 26357

### EXAMPLE 2
```
New-SSHSession -computername 192.168.0.1
$Params = @{
    UnusedPort        = "26357"
    WanInterfaceName  = "wan1"
    WanIP             = "1.1.1.1"
}
$command = Enable-PushNotifications @params
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```

This example generates an SSH session and invokes the output of this function against that session.

### EXAMPLE 3
```
New-SSHSession -computername 192.168.0.1
New-SSHSession -computername 192.168.1.1
$Params = @{
    UnusedPort        = "26357"
    WanInterfaceName  = "wan1"
    WanIP             = "1.1.1.1"
}
$command = Enable-PushNotifications @params
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Write-Output "Invoking Command against $session.host"
    $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
    $result.output
}
```

This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

## PARAMETERS

### -UnusedPort
\<1-65535\> Specify a port not used on the WAN interface for the given WAN IP.

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

### -WanInterfaceName
Specify the Name of the Wan Interface

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

### -WanIP
WAN IP within the range of the chosen Wan Interface

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
https://kb.fortinet.com/kb/documentLink.do?externalID=FD48702 \
https://docs.fortinet.com/document/fortigate/6.2.0/cookbook/183204/ssl-vpn-with-fortitoken-mobile-push-authentication

* There must be at least one administrator account with no trusted hosts configured:
* The FortiGate checks trusted host settings before allowing incoming traffic.
* This also applies to push notification responses.
* If no administrator without trusted hosts exists, the push response is denied and fails
* An administrator account with no privileges at all is sufficient to this end.

* If the FortiGate with push notification enabled is behind a router/other firewall that performs NATing, then a virtual IP/port forwarding must be configured on that unit to allow responses to reach the FortiGate.
* The FortiGate's server-ip must be set to the same IP the edge firewall/router allows the inbound traffic on.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

