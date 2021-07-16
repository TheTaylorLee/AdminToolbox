---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# Enable-Management

## SYNOPSIS

## SYNTAX

### TrustedHost6
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedHost1 <Object> -TrustedHost2 <Object> -TrustedHost3 <Object> -TrustedHost4 <Object>
 -TrustedHost5 <Object> -TrustedHost6 <Object> [<CommonParameters>]
```

### TrustedHost5
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedHost1 <Object> -TrustedHost2 <Object> -TrustedHost3 <Object> -TrustedHost4 <Object>
 -TrustedHost5 <Object> [<CommonParameters>]
```

### TrustedHost4
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedHost1 <Object> -TrustedHost2 <Object> -TrustedHost3 <Object> -TrustedHost4 <Object>
 [<CommonParameters>]
```

### TrustedHost3
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedHost1 <Object> -TrustedHost2 <Object> -TrustedHost3 <Object> [<CommonParameters>]
```

### TrustedHost2
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedHost1 <Object> -TrustedHost2 <Object> [<CommonParameters>]
```

### TrustedHost1
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedHost1 <Object> [<CommonParameters>]
```

## DESCRIPTION
Configures trusted hosts that the admin account may connect from and enables management from the WAN interface.
Don't forget to include your internal and management subnets if you still want to be able to manage the firewall from them!

## EXAMPLES

### EXAMPLE 1
```
This example allows management from all Private Class ranges and one public IP
```

$Params = @{
AdminUsername    = "admin"
AllowAccess      = "ping https ssh ftm fgfm"
TrustedHost1     = "192.168.0.0 255.255.0.0"
TrustedHost2     = "10.0.0.0 255.0.0.0"
TrustedHost3     = "172.16.0.0 255.240.0.0"
TrustedHost4     = "8.8.8.8 255.255.255.255"
WANInterfaceName = "port1"
}

Enable-Management @Params

### EXAMPLE 2
```
This example allows management from a single /24 subnet and a single public range. It also limits access to HTTPS
```

$Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "https"
    TrustedHost1     = "192.168.0.0 255.255.255.0"
    TrustedHost2     = "8.8.8.8 255.255.255.255"
    WANInterfaceName = "port1"
}

Enable-Management @Params

### EXAMPLE 3
```
This example generates and SSH session and invokes the output of this function against that sessions.
```

New-SSHSession -computername 192.168.0.1

$Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "ping https ssh ftm fgfm"
    TrustedHost1     = "192.168.0.0 255.255.0.0"
    TrustedHost2     = "10.0.0.0 255.0.0.0"
    TrustedHost3     = "172.16.0.0 255.240.0.0"
    TrustedHost4     = "8.8.8.8 255.255.255.255"
    WANInterfaceName = "port1"
}
$command = Enable-Management @Params

$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output

### EXAMPLE 4
```
This example generates multiple SSH sessions and invokes the output of this function against all active sessions.
```

New-SSHSession -computername 192.168.0.1
New-SSHSession -computername 192.168.1.1

$Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "ping https ssh ftm fgfm"
    TrustedHost1     = "192.168.0.0 255.255.0.0"
    TrustedHost2     = "10.0.0.0 255.0.0.0"
    TrustedHost3     = "172.16.0.0 255.240.0.0"
    TrustedHost4     = "8.8.8.8 255.255.255.255"
    WANInterfaceName = "port1"
}
$command = Enable-Management @Params

$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Write-Output "Invoking Command against $session.host"
    $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
    $result.output
}

## PARAMETERS

### -AdminUsername
Specify the admin username who management access is being enabled for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowAccess
Specify the Administrative Access preferences that should be allowed.
Should be provided in a space delimited string format.
Options below
ping              PING access.
https             HTTPS access.
ssh               SSH access.
snmp              SNMP access.
http              HTTP access.
telnet            TELNET access.
fgfm              FortiManager access.
radius-acct       RADIUS accounting access.
probe-response    Probe access.
fabric            Security Fabric access.
ftm               FTM access.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: Ping https ssh ftm fgfm
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedHost1
Set the first Trusted subnet allowed to access the Fortigate

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedHost2
Set the second Trusted subnet allowed to access the Fortigate

```yaml
Type: Object
Parameter Sets: TrustedHost6, TrustedHost5, TrustedHost4, TrustedHost3, TrustedHost2
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedHost3
Set the third Trusted subnet allowed to access the Fortigate

```yaml
Type: Object
Parameter Sets: TrustedHost6, TrustedHost5, TrustedHost4, TrustedHost3
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedHost4
Set the fourth Trusted subnet allowed to access the Fortigate

```yaml
Type: Object
Parameter Sets: TrustedHost6, TrustedHost5, TrustedHost4
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedHost5
Set the fifth Trusted subnet allowed to access the Fortigate

```yaml
Type: Object
Parameter Sets: TrustedHost6, TrustedHost5
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedHost6
Set the sixth Trusted subnet allowed to access the Fortigate

```yaml
Type: Object
Parameter Sets: TrustedHost6
Aliases:

Required: True
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
This function currently supports up to 6 Trusted Host subnets

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

