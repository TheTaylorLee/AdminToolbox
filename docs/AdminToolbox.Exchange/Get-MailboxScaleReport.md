---
external help file: AdminToolbox.ExchangeManifest-help.xml
Module Name: AdminToolbox.Exchange
online version:
schema: 2.0.0
---

# Get-MailboxScaleReport

## SYNOPSIS

## SYNTAX

```
Get-MailboxScaleReport [-Path] <Object> [[-MailboxAliases] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Get a mailbox report to help with troubleshooting where a mailbox may have exceeded outlook limits

## EXAMPLES

### EXAMPLE 1
```
Gets a report for all mailboxes
```

Get-MailboxScaleReport -Path C:\report.xlsx

### EXAMPLE 2
```
Gets a report for one mailbox
```

Get-MailboxScaleReport -Path C:\report.xlsx -MailboxAliases JSmith

### EXAMPLE 3
```
Gets a report for some but not all mailboxes
```

Get-MailboxScaleReport -Path C:\report.xlsx -MailboxAliases JOSmith, JASmith, SSmith

## PARAMETERS

### -Path
Where to export the excel file to

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

### -MailboxAliases
Array of aliases for mailboxes to pull a report from if not all

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
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
Must have the Exchange and importexcel modules loaded
Exchange 2007: 50000 messages per folder, 500 folders total
Exchange 2010/2013/2016/2019: 100000 messages per folder, 500 folders total

## RELATED LINKS

[Get-MailboxReport]()

