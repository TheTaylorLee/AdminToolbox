---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/FortiWizard/tree/main/docs
schema: 2.0.0
---

# Write-SSLVPNConfig

## SYNOPSIS

## SYNTAX

```
Write-SSLVPNConfig [-CommaSeperatedDNSSuffixes] <Object> [-DNofParentOU] <Object> [-DNSServerIP] <Object>
 [-InternalLanSubnetMask] <Object> [-InternalLanIP] <Object> [-LanInterfaceName] <Object>
 [-LDAPServerFriendlyName] <Object> [-ServiceAccountPassword] <Object> [-ServiceAccountsAMAccountName] <Object>
 [-WanInterfaceName] <Object> [<CommonParameters>]
```

## DESCRIPTION
Creates a Fortigate Config Script for a simple SSL Client VPN implementation.

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
CommaSeperatedDNSSuffixes    = "domain.com,domain2.com"
DNofParentOU                 = "DC=domain,DC=COM"
DNSServerIP                  = "192.168.0.1"
InternalLanIP                = "192.168.0.0"
InternalLanSubnetMask        = "255.255.255.0"
LanInterfaceName             = "port2"
LDAPSERVERFriendlyName       = "DomainLdap"
ServiceAccountPassword       = "Password"
ServiceAccountsAMAccountName = "fortigate"
WanInterfaceName             = "port1"
}
```

Write-SSLVPNConfig @Params

## PARAMETERS

### -CommaSeperatedDNSSuffixes
DNS Suffixes for Split DNS

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

### -DNofParentOU
Distinguished Name of the Top Level OU for the authenticating Domain

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

### -DNSServerIP
IPv4 address of the DNS server used by the SSLVPN clients

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

### -InternalLanSubnetMask
Subnet mask of the LANIP to be accessed ex: 255.255.255.0

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InternalLanIP
IP Address thats matches the Host Minimum for the Subnet

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LanInterfaceName
Name of the LAN interface containing the to be accessed Subnet

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LDAPServerFriendlyName
Friendly Name for referencing the LDAP authentication server

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServiceAccountPassword
Password of the Authenticating service account

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServiceAccountsAMAccountName
sAMAccountName for the service account that will authenticate to the LDAP server.
The Service account should have domain adming privleges and be denied logon locally

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WanInterfaceName
Name of the WAN interface where the incoming sslvpn Connections should originate.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 10
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

[https://github.com/TheTaylorLee/FortiWizard/tree/main/docs](https://github.com/TheTaylorLee/FortiWizard/tree/main/docs)

