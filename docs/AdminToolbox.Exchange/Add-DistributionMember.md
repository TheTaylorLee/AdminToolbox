---
external help file: AdminToolbox.ExchangeManifest-help.xml
Module Name: AdminToolbox.Exchange
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Add-DistributionMember

## SYNOPSIS

## SYNTAX

```
Add-DistributionMember [-Mailbox] <Object> [-DistributionGroup] <Object> [<CommonParameters>]
```

## DESCRIPTION
Add a mailbox or mailboxes to a distribution group.
Wildcards can be used to add the whole organization to a distribution group.

## EXAMPLES

### EXAMPLE 1
```
Add-DistributionMember -Mailbox JohnD@company.com -DistributionGroup "All Employees"
```

Add a single mailbox to a single distribution group

### EXAMPLE 2
```
Add-DistributionMember -Mailbox *@company.com -DistributionGroup "All Emp*"
```

Allows shortening the command or adding multiple mailboxes with a shared name to a Distribution Group

### EXAMPLE 3
```
Add-DistributionMember -Mailbox JohnD@company.com -DistributionGroup "All Employees,Worker Bees"
```

Add a single mailbox to multiple Distribution Groups.

## PARAMETERS

### -Mailbox
Specifies the Mailbox or Mailboxes that are to be added to the Distribution Group

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

### -DistributionGroup
The Distribution Group the Mailbox or Mailboxes are being added to

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
Requires the microsoft exchange module.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

