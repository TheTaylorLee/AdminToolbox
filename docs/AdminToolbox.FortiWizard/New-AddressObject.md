---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-AddressObject

## SYNOPSIS

## SYNTAX

```
New-AddressObject [-AddressName] <Object> [-CIDR] <Object> [<CommonParameters>]
```

## DESCRIPTION
Create a New Address Object

## EXAMPLES

### EXAMPLE 1
```
$Params = @{
    AddressName   = "ComanyLan_192.168.0.1/26"
    CIDR          = "192.168.0.1/26"
}
New-AddressObject @params
```

### EXAMPLE 2
```
New-SSHSession -computername 192.168.0.1
$Params = @{
    AddressName   = "ComanyLan_192.168.0.1/26"
    CIDR          = "192.168.0.1/26"
}
$command = New-AddressObject @params
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```

This example generates an SSH session and invokes the output of this function against that session.

### EXAMPLE 3
```
New-SSHSession -computername 192.168.0.1
New-SSHSession -computername 192.168.1.1
$Params = @{
    AddressName   = "ComanyLan_192.168.0.1/26"
    CIDR          = "192.168.0.1/26"
}
$command = New-AddressObject @params
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Write-Output "Invoking Command against $session.host"
    $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
    $result.output
}
```

This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

## PARAMETERS

### -AddressName
Specify a Unique name for the Address Object

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

### -CIDR
Specify a CIDR address.
ex: 192.168.0.0/24

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

