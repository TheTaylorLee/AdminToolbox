---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-PSipcalc

## SYNOPSIS
Provides detailed network information.
Accepts CIDR notation and IP / subnet mask.
Inspired by the utility "ipcalc" on Linux.

Svendsen Tech.
Copyright (c) 2015, Joakim Svendsen
All rights reserved.

MIT license.
http://www.opensource.org/licenses/MIT

## SYNTAX

```
Invoke-PSipcalc [-NetworkAddress] <String[]> [[-Contains] <String>] [-Enumerate] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -NetworkAddress
CIDR notation network address, or using subnet mask.
Examples: '192.168.0.1/24', '10.20.30.40/255.255.0.0'.

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

### -Contains
Causes PSipcalc to return a boolean value for whether the specified IP is in the specified network.
Includes network address and broadcast address.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enumerate
Enumerates all IPs in subnet (potentially resource-expensive).
Ignored if you use -Contains.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

