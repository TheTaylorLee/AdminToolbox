---
external help file: AdminToolbox.RemotingManifest-help.xml
Module Name: AdminToolbox.Remoting
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Connect-OpenSSH

## SYNOPSIS

## SYNTAX

```
Connect-OpenSSH [-User] <Object> [-Server] <Object> [<CommonParameters>]
```

## DESCRIPTION
Use this function to connect to an SSH Session

## EXAMPLES

### EXAMPLE 1
```
Connect-SSH -User "domain\username" -server "Hostname"
```

Connect using a domain account and DNS Name

### EXAMPLE 2
```
Connect-SSH -User "username" -server "192.168.0.1"
```

Connect using a local account and ipv4

## PARAMETERS

### -User
User Account used for SSH Authentication

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

### -Server
SSH Server that is being connected to.

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
Requires the OpenSSH client feature be installed locally and SSH enabled on the server \
https://github.com/PowerShell/Win32-OpenSSH

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

