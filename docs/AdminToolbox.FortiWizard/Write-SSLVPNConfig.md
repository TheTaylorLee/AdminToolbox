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
 [[-InternalCIDR] <Object>] [[-SSLClientCIDR] <Object>] [-LanInterfaceName] <Object>
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
    InternalCIDR                 = "192.168.56.0/24"
    SSLClientCIDR                = "10.212.134.0/24"
    LanInterfaceName             = "port2"
    LDAPSERVERFriendlyName       = "DomainLdap"
    ServiceAccountPassword       = "Password"
    ServiceAccountsAMAccountName = "fortigate"
    WanInterfaceName             = "port1"
}
Write-SSLVPNConfig @Params
```

### EXAMPLE 2
```
New-SSHSession -computername 192.168.0.1
$Params = @{
    CommaSeperatedDNSSuffixes    = "domain.com,domain2.com"
    DNofParentOU                 = "DC=domain,DC=COM"
    DNSServerIP                  = "192.168.0.1"
    InternalCIDR                 = "192.168.56.0/24"
    SSLClientCIDR                = "10.212.134.0/24"
    LanInterfaceName             = "port2"
    LDAPSERVERFriendlyName       = "DomainLdap"
    ServiceAccountPassword       = "Password"
    ServiceAccountsAMAccountName = "fortigate"
    WanInterfaceName             = "port1"
}
$command = Write-SSLVPNConfig @Params
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```

This example generates an SSH session and invokes the output of this function against that session.

### EXAMPLE 3
```
New-SSHSession -computername 192.168.0.1
New-SSHSession -computername 192.168.1.1
$Params = @{
    CommaSeperatedDNSSuffixes    = "domain.com,domain2.com"
    DNofParentOU                 = "DC=domain,DC=COM"
    DNSServerIP                  = "192.168.0.1"
    InternalCIDR                 = "192.168.56.0/24"
    SSLClientCIDR                = "10.212.134.0/24"
    LanInterfaceName             = "port2"
    LDAPSERVERFriendlyName       = "DomainLdap"
    ServiceAccountPassword       = "Password"
    ServiceAccountsAMAccountName = "fortigate"
    WanInterfaceName             = "port1"
}
$command = Write-SSLVPNConfig @Params
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Write-Output "Invoking Command against $session.host"
    $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
    $result.output
}
```

This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

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

### -InternalCIDR
CIDR Address for the allowed LAN subnet

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SSLClientCIDR
CIDR Address for the subnet being handed out to SSLVPN Clients

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
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

