---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Unblock-Quarantine

## SYNOPSIS

## SYNTAX

```
Unblock-Quarantine [[-pages] <Int32>] [[-pagesize] <Int32>] [-AllowSender] [<CommonParameters>]
```

## DESCRIPTION
This is an alternative to the function Release-QuarantineMessage.
This function bypasses the 1000 item per page limit by creating an array of results for up to 1000 pages and 1 million results.
That is the log limit applied by Microsoft.
I recommend limiting results as much as possible for performance reasons.
Use Get-QuarantineMessage to restrict results further.

## EXAMPLES

### EXAMPLE 1
```
Get-Quarantine -pages 15
```

Specify the number of pages with 1000 results to return

### EXAMPLE 2
```
Release-Quarantine
```

Return the default of 1 page with up to 1000 results of results from which emails can be released from quarantine.

### EXAMPLE 3
```
Release-Quarantine -pagesize 15
```

Specify the pagesize to limit output to only x number of results that can then be used to choose emails to release.

### EXAMPLE 4
```
Release-Quarantine -AllowSender
```

Allow sender to prevent future messages from the sender being quarantined.
Additional steps may be required to guarantee results.
Microsoft provides documentation on Mailflow rules for whitelisting senders.

## PARAMETERS

### -pages
{{ Fill pages Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -pagesize
{{ Fill pagesize Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 1000
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowSender
{{ Fill AllowSender Description }}

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
Requires the ExchangeOnline module be installed, imported, and Connected.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

