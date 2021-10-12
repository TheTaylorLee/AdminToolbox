---
external help file: AdminToolbox.VMWareAutomateManifest-help.xml
Module Name: AdminToolbox.VMWareAutomate
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-HostMemoryDimms

## SYNOPSIS
Returns memory dimms configuration for esxi

## SYNTAX

```
Get-HostMemoryDimms [-VMHost] <String> [-rootpw] <String> [<CommonParameters>]
```

## DESCRIPTION
This function utilizes wsman / cim in order to download configuration of memory dims in ESXi.

## EXAMPLES

### EXAMPLE 1
```
get-HostMemoryDimms -VMHost 'Esxi048.domain.local' -rootpw 'password.123' | ft *
    BankLabel               Manufacturer Description SizeGB MemoryType MemoryDef
    ---------               ------------ ----------- ------ ---------- ---------
    P0_Node0_Channel0_Dimm0 Samsung      P1-DIMMA1       16 24         DDR3
    P0_Node0_Channel0_Dimm1 Samsung      P1-DIMMA2       16 24         DDR3
    P0_Node0_Channel1_Dimm0 Samsung      P1-DIMMB1       16 24         DDR3
    P0_Node0_Channel1_Dimm1 Samsung      P1-DIMMB2       16 24         DDR3
    P0_Node0_Channel2_Dimm0 Samsung      P1-DIMMC1       16 24         DDR3
    P1_Node1_Channel2_Dimm0 Samsung      P2-DIMMG1       16 24         DDR3
    P1_Node1_Channel2_Dimm1 Samsung      P2-DIMMG2       16 24         DDR3
    P1_Node1_Channel3_Dimm0 Samsung      P2-DIMMH1       16 24         DDR3
    P1_Node1_Channel3_Dimm1 Samsung      P2-DIMMH2       16 24         DDR3
                            Winbond                  ...625 11         Flash
```

## PARAMETERS

### -VMHost
Specify esxi host for which you want to get the report

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -rootpw
Password for user root inside esxi

```yaml
Type: String
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

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

