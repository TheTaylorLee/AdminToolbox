---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-LocalinPolicy

## SYNOPSIS

## SYNTAX

```
New-LocalinPolicy [-administrators] <String[]> [-interfaces] <String[]> [-policyname] <String>
 [[-Services] <String[]>] [-trustedhosts] <String[]> [<CommonParameters>]
```

## DESCRIPTION
The purpose of this function is to write a configuration script.
The purpose of that configuration script will be to implement a localin restriction policy.
A use case being to allow managing the firewall from a public interface, but only from permitted IP addresses.
If you fully understand the config output you can leverage this for additional purposes related to localin policies.

## EXAMPLES

### EXAMPLE 1
```
$params = @{
    Administrators      = "AdminAccount01", "AdminAccount02"
    Interfaces          = "wan1", "DMZ"
    PolicyName          = "RemoteAccess"
    Services            = "HTTPS/443/TCP", "SSH/22/TCP"
    TrustedHosts        = "192.168.0.0/16", "172.16.0.0/12", "10.0.0.0/8"
}
New-LocalinPolicy @params
```

## PARAMETERS

### -administrators
Provide and array administrators that should be able to access the firewall by the services to be specified in another parameter.

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

### -interfaces
An interface or interfaces that the localin policy will apply for.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -policyname
This is a string that will be used in parts of the config to avoid overwriting existing configurations.
This must be unique.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Services
Specify the Service or services that the local-in policy applies to.

ex: "RDP/3389/TCP", "piov/5060-5061/UDP"

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -trustedhosts
Provide an array of CIDR addresses that should be able to acccess the firewall management interfaces using the services to be provided later.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
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

