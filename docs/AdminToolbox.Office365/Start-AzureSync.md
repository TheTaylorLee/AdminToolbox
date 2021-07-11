---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Start-AzureSync

## SYNOPSIS

## SYNTAX

```
Start-AzureSync [-Policy] <Object> [<CommonParameters>]
```

## DESCRIPTION
Starts a local Active Directory sync to Azure Active Directory.

## EXAMPLES

### EXAMPLE 1
```
Performs a full sync with Azure Active Directory
```

Start-AzureSync -Policy Initial

### EXAMPLE 2
```
Performs an incrmental sync with Azure Active Directroy
```

Start-AzureSync -Policy Delta

## PARAMETERS

### -Policy
Specify a Delta or Initial sync

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Must be run from the Domain Controller that has Azure AD Connect.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

