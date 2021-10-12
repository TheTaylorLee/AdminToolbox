---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-GuestUsers

## SYNOPSIS

## SYNTAX

```
Get-GuestUsers [[-StaleGuests] <Int32>] [[-RecentlyCreatedGuests] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function will create an Excel report of guest users accounts from Azure AD, and groups they are a member of.

## EXAMPLES

### EXAMPLE 1
```
Get-GuestUsers -StaleGuest 90
```

Shows all guest users accounts older than 90 days old

## PARAMETERS

### -StaleGuests
Get a list of guest users older than the given days old

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -RecentlyCreatedGuests
Get a list of guest users older no older than x days

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the AzureAD and Import excel modules be imported and the AzureAD module connected

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

