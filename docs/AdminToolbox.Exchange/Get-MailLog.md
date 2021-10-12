---
external help file: AdminToolbox.ExchangeManifest-help.xml
Module Name: AdminToolbox.Exchange
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-MailLog

## SYNOPSIS

## SYNTAX

```
Get-MailLog [-Start] <Object> [-End] <Object> [-ResultSize] <Object> [<CommonParameters>]
```

## DESCRIPTION
Creates a csv file containing logs of mail in a given time frame.

## EXAMPLES

### EXAMPLE 1
```
Get-MailLog -Start 05/14/2017 -End 05/14/2018 -Resultsize 10000
```

Specify the date range, report path, and amount of records to return.

## PARAMETERS

### -Start
Start date for the search

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

### -End
End date for the search

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

### -ResultSize
Maximum number of results returned

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the Microsoft Exchange module.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

