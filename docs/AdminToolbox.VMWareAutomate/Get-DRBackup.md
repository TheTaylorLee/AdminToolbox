---
external help file: AdminToolbox.VMWareAutomateManifest-help.xml
Module Name: AdminToolbox.VMWareAutomate
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-DRBackup

## SYNOPSIS

## SYNTAX

```
Get-DRBackup [-DNSZone] <Object> [-PrimaryDNSServer] <Object> [-OutPath] <Object> [-VCenter] <Object> [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The purpose of this function is to provide records that would simplify bringing back up a large vcenter array in a recovery scenario.

Get's Domain DNS Records, Hosts, and VM's, saves the Gatered data to 3 separate spreadsheets, and prompts to Delete any files older than 45 days in the output path

## EXAMPLES

### EXAMPLE 1
```
Get-DRRecords -DNSZone DNSZone.com -PrimaryDNSServer DNSServer -OutPath c:\drbackup -Vcenter vcentername
```

Specify the DNS Zone Name containing the VMware DNS Records.
Specify a Domain Controller containing the Primary DNS Zone.
Specify the folder where the records are to be saved.
Specify the Vcenter Server hosting the VM's.

## PARAMETERS

### -DNSZone
DNSZone that has records for the VMS and Hosts

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

### -PrimaryDNSServer
Server that hosts the DNSZone

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

### -OutPath
Path to save the output

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

### -VCenter
Vcenter Server Host and VM data is pulled from

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the VMware.PowerCLI Module \
Requires the ImportExcel Module

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

