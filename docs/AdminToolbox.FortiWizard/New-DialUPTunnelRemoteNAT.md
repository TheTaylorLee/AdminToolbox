---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-DialUPTunnelRemoteNAT

## SYNOPSIS

## SYNTAX

```
New-DialUPTunnelRemoteNAT [-dhgroups] <String[]> [-ikev] <Object> [-LANInterface] <String[]>
 [-LocalAddressCIDRs] <String[]> [-PeerID] <Object> [-PFS] <Object> [-Proposal] <String[]> [-PSK] <Object>
 [-RemoteAddressCIDRs] <String[]> [[-Services] <String[]>] [-TTL] <Object> [-TunnelName] <Object>
 [-WANInterface] <Object> [[-Comments] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This is a CLI wizard that generates a new Dialup IPSec Tunnel Config and related objects.
This will be for the firewall whose public IP is static and whose end does not sit behind another NAT firewall.

## EXAMPLES

### EXAMPLE 1
```
$params = @{
   dhgroups           = "5", "14"
   LANInterface       = "port1", "port2"
   LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
   PeerID             = "187"
   Proposal           = "aes256-sha512", "aes256-sha1"
   PSK                = "dfdayb%^4356456"
   RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
   Services           = "RDP/3389/TCP", "DNS/53/UDP"
   TTL                = "28800"
   TunnelName         = "TestTunnel"
   WANInterface       = "wan3"
   ikev               = "1"
}
New-DialUPTunnelRemoteNAT @params
```

This example will generate a Dial-up VPN tunnel config.

### EXAMPLE 2
```
New-SSHSession -computername 192.168.0.1
$params = @{
   dhgroups           = "5", "14"
   LANInterface       = "port1", "port2"
   LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
   PeerID             = "187"
   Proposal           = "aes256-sha512", "aes256-sha1"
   PSK                = "dfdayb%^4356456"
   RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
   Services           = "RDP/3389/TCP", "DNS/53/UDP"
   TTL                = "28800"
   TunnelName         = "TestTunnel"
   WANInterface       = "wan3"
   ikev               = "1"
}
$command = New-DialUPTunnelRemoteNAT @params
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```

This example generates an SSH session and invokes the output of this function against that session.

## PARAMETERS

### -dhgroups
This is the Diffie-Hellman group or groups used by the Phase 1 and Phase 2 interfaces.
If providing multiple values input them in comma delimited format.

ex: "5", "14"

*These are the available DH Groups
32 31 30 29 28 27
21 20 19 18 17 16
15 14 5 2 1

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ikev
Provide the desired ike version 1 or 2

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

### -LANInterface
This is the name of the lan interface/s allowed for the tunnel.

ex: "phone vlan", "wifi vlan"

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LocalAddressCIDRs
This is the Address Object CIDRs that will be created for the local side of the tunnel.

ex: "192.168.1.0/24", "10.100.0/24"

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PeerID
This is a unique 3 numeric character long Identifier for this tunnel.

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

### -PFS
Specify if PFS should be enabled on the Phase 2 interface.

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

### -Proposal
This is the encryption proposal or proposals for the Phase 1 and Phase 2 interfaces.
Provide in commad delimited format.

ex: aes256-sha512, aes256-sha1

*These are the available proposals that can be used.
des-md5
des-sha1
des-sha256
des-sha384
des-sha512
3des-md5
3des-sha1
3des-sha256
3des-sha384
3des-sha512
aes128-md5
aes128-sha1
aes128-sha256
aes128-sha384
aes128-sha512
aes192-md5
aes192-sha1
aes192-sha256
aes192-sha384
aes192-sha512
aes256-md5
aes256-sha1
aes256-sha256
aes256-sha384
aes256-sha512

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PSK
This is the Private Shared Key for the Phase 1 and Phase 2 interfaces.

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

### -RemoteAddressCIDRs
This is the Address Object CIDRs that will be created for the remote side of the tunnel.

ex: "192.168.1.0/24", "10.100.0/24"

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Services
Specify the Service or services that will be applied to the Firewall Policy for this tunnel.

ex: "RDP/3389/TCP", "piov/5060-5061/UDP"

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TTL
This is the Time to Live for the Phase 1 and Phase 2 proposals.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TunnelName
This is the name for the VPN Tunnel.
Maximum 15 Alphanumeric characters.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WANInterface
This is the name of the WAN interface that the tunnel will be built on.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Comments
Optional parameter for providing comments on the tunnel.
Will be recorded in the tunnel interface.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
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

