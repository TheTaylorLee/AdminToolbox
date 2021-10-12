---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# Enable-Management

## SYNOPSIS

## SYNTAX

### TrustedCIDR6
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedCIDR1 <Object> -TrustedCIDR2 <Object> -TrustedCIDR3 <Object> -TrustedCIDR4 <Object>
 -TrustedCIDR5 <Object> -TrustedCIDR6 <Object> [<CommonParameters>]
```

### TrustedCIDR5
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedCIDR1 <Object> -TrustedCIDR2 <Object> -TrustedCIDR3 <Object> -TrustedCIDR4 <Object>
 -TrustedCIDR5 <Object> [<CommonParameters>]
```

### TrustedCIDR4
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedCIDR1 <Object> -TrustedCIDR2 <Object> -TrustedCIDR3 <Object> -TrustedCIDR4 <Object>
 [<CommonParameters>]
```

### TrustedCIDR3
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedCIDR1 <Object> -TrustedCIDR2 <Object> -TrustedCIDR3 <Object> [<CommonParameters>]
```

### TrustedCIDR2
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedCIDR1 <Object> -TrustedCIDR2 <Object> [<CommonParameters>]
```

### TrustedCIDR1
```
Enable-Management -AdminUsername <String> -AllowAccess <String> -WANInterfaceName <Object>
 -TrustedCIDR1 <Object> [<CommonParameters>]
```

## DESCRIPTION
Configures trusted hosts that the admin account may connect from and enables management from the WAN interface.
Don't forget to include your internal and management subnets if you still want to be able to manage the firewall from them!

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
AdminUsername    = "admin"
AllowAccess      = "ping https ssh ftm fgfm"
TrustedCIDR1     = "192.168.0.0/16"
TrustedCIDR2     = "10.0.0.0/8"
TrustedCIDR3     = "172.16.0.0/12"
TrustedCIDR4     = "8.8.8.8/32"
WANInterfaceName = "port1"
}
Enable-Management @Params
```

This example allows management from all Private Class ranges and one public IP

### EXAMPLE 2
```
$Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "https"
    TrustedCIDR1     = "192.168.0.0/24"
    TrustedCIDR2     = "8.8.8.8/32"
    WANInterfaceName = "port1"
}
Enable-Management @Params
```

This example allows management from a single /24 subnet and a single public range.
It also limits access to HTTPS

### EXAMPLE 3
```
New-SSHSession -computername 192.168.0.1
$Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "ping https ssh ftm fgfm"
    TrustedCIDR1     = "192.168.0.0/16"
    TrustedCIDR2     = "10.0.0.0/8"
    TrustedCIDR3     = "172.16.0.0/12"
    TrustedCIDR4     = "8.8.8.8/32"
    WANInterfaceName = "port1"
}
$command = Enable-Management @Params
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```

This example generates an SSH session and invokes the output of this function against that session.

### EXAMPLE 4
```
New-SSHSession -computername 192.168.0.1
New-SSHSession -computername 192.168.1.1
$Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "ping https ssh ftm fgfm"
    TrustedCIDR1     = "192.168.0.0/16"
    TrustedCIDR2     = "10.0.0.0/8"
    TrustedCIDR3     = "172.16.0.0/12"
    TrustedCIDR4     = "8.8.8.8/32"
    WANInterfaceName = "port1"
}
$command = Enable-Management @Params
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Write-Output "Invoking Command against $session.host"
    $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
    $result.output
}
```

This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

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

### -TrustedCIDR1
Set the first Trusted CIDR address allowed to access the Fortigate.
ex: 192.168.0.0/24

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

### -TrustedCIDR2
Set the second Trusted CIDR address allowed to access the Fortigate.
ex: 192.168.0.0/24

```yaml
Type: Object
Parameter Sets: TrustedCIDR6, TrustedCIDR5, TrustedCIDR4, TrustedCIDR3, TrustedCIDR2
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedCIDR3
Set the third Trusted CIDR address allowed to access the Fortigate.
ex: 192.168.0.0/24

```yaml
Type: Object
Parameter Sets: TrustedCIDR6, TrustedCIDR5, TrustedCIDR4, TrustedCIDR3
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedCIDR4
Set the fourth Trusted CIDR address allowed to access the Fortigate.
ex: 192.168.0.0/24

```yaml
Type: Object
Parameter Sets: TrustedCIDR6, TrustedCIDR5, TrustedCIDR4
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedCIDR5
Set the fifth Trusted CIDR address allowed to access the Fortigate.
ex: 192.168.0.0/24

```yaml
Type: Object
Parameter Sets: TrustedCIDR6, TrustedCIDR5
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TrustedCIDR6
Set the sixth Trusted CIDR address allowed to access the Fortigate.
ex: 192.168.0.0/24

```yaml
Type: Object
Parameter Sets: TrustedCIDR6
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
This function currently supports up to 6 Trusted Host subnets.
Open a Github issue to request more added.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

