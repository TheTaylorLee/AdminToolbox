---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-MacVendor

## SYNOPSIS
Resolve MacAddresses To Vendors

## SYNTAX

### MacAddress (Default)
```
Get-MacVendor -MacAddress <String[]> [<CommonParameters>]
```

### Local Subnet
```
Get-MacVendor -Subnet <String> [-SkipDNS] [<CommonParameters>]
```

## DESCRIPTION
This Function Queries The MacVendors API With Supplied MacAdderess And Returns Manufacturer Information If A Match Is Found

## EXAMPLES

### EXAMPLE 1
```
Get-MacVendor -MacAddress 00:00:00:00:00:00
```

### EXAMPLE 2
```
Get-MacVendor -MacAddress 00:00:00:00:00:00,11:11:11:11:11:11
```

### EXAMPLE 3
```
Get-MacVendor -Subnet 192.168.0 | Sort-Object Vendor
```

Get Mac addresses for all devices on the local subnet and query their OUI

## PARAMETERS

### -MacAddress
MacAddress To Be Resolved

```yaml
Type: String[]
Parameter Sets: MacAddress
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subnet
Specify a local subnet to query

```yaml
Type: String
Parameter Sets: Local Subnet
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SkipDNS
If you are using public DNS, use SKipDNS.
This will prevent long delays caused by retrieving Hostnames.

```yaml
Type: SwitchParameter
Parameter Sets: Local Subnet
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

