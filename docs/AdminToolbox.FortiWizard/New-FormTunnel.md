---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-FormTunnel

## SYNOPSIS

## SYNTAX

```
New-FormTunnel [-VPNFormPath] <Object> [-TunnelType] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function will use a VPN form to build a tunnel from one of 4 VPN tunnel types.
It will use that vpn form to populate parameters for one of the specified tunnel functions New-P2PTunnel, New-P2PTunnelNAT, New-DialupRemoteNAT, or New-DialupBehindNAT.
Use the link provided in this description to download the VPN Form.
The VPN form may be modified in it's entirety with the exception of where the provided parameter values are to be entered.
Those cells must remain in the same location or this function will not work for you.

https://github.com/TheTaylorLee/AdminToolbox/raw/master/docs/AdminToolbox.FortiWizard/Examples/VPN%20Buildout%20Form.xlsx

## EXAMPLES

### EXAMPLE 1
```
New-TunnelForm -tunneltype p2pnat -vpnformpath .\vpnform.xlsx
```

## PARAMETERS

### -VPNFormPath
This is the file path to the VPN Form.

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

### -TunnelType
This specifies the type of VPN being created from the VPN form.

Parameter options are 'P2P', 'P2PNAT', 'DialupRemoteNAT', 'DialupBehindNAT'

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

