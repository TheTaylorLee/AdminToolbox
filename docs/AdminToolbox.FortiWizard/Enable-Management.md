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

Required: True
Position: Named
Default value: Admin
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowAccess
Specify the Administrative Access preferences that should be allowed. Should be provided in a space delimited string format. Options below
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

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

