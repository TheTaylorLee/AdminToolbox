---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-IPPoolFixedRange

## SYNOPSIS

## SYNTAX

```
New-IPPoolFixedRange [-IPPoolName] <Object> [-ExternalCIDR] <Object> [-InternalCIDR] <Object>
 [<CommonParameters>]
```

## DESCRIPTION
Create a New Fixed Range IP Pool

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
    IPPoolName            = "CompanyIPSECPool"
    ExternalCIDR          = "10.155.127.0/24"
    InternalCIDR          = "192.168.1.0/24"
}
New-IPPoolFixedRange @params
```

### EXAMPLE 2
```
New-SSHSession -computername 192.168.0.1
$Params = @{
    IPPoolName            = "CompanyIPSECPool"
    ExternalCIDR          = "10.155.127.0/24"
    InternalCIDR          = "192.168.1.0/24"
}
$command = New-IPPoolFixedRange @params
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```

This example generates an SSH session and invokes the output of this function against that session.

### EXAMPLE 3
```
New-SSHSession -computername 192.168.0.1
New-SSHSession -computername 192.168.1.1
$Params = @{
    IPPoolName            = "CompanyIPSECPool"
    ExternalCIDR          = "10.155.127.0/24"
    InternalCIDR          = "192.168.1.0/24"
}
$command = New-IPPoolFixedRange @params
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Write-Output "Invoking Command against $session.host"
    $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
    $result.output
}
```

This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

## PARAMETERS

### -IPPoolName
Specify a Unique name for the IP Pool

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

### -ExternalCIDR
Specify the external CIDR range for the IPPool

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

### -InternalCIDR
Specify the internal CIDR range for the IPPool

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
Source NAT (IP Pool) and Destination NAT (Virtual IP) \

Destination NAT changes the destination address of packets passing through the Router.
It also offers the option to perform the port translation in the TCP/UDP headers.
Destination NAT mainly used to redirect incoming packets with an external address or port destination to an internal IP address or port inside the network.
\

Source NAT is most commonly used for translating private IP address to a public routable address to communicate with the host.
Source NAT changes the source address of the packets that pass through the Router.
A NAT pool is a set of addresses that are designed as a replacement for client IP addresses.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

