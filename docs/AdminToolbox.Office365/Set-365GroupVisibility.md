---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Set-365GroupVisibility

## SYNOPSIS

## SYNTAX

```
Set-365GroupVisibility [[-identity] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This functions purpose is to make an office365 group visible in the Outlook Client.
It's shorthand for an already existing command.
If no parameters are specified then a Gridview is presented to select the group to make visible.

This Function was initially created to resolve an issue where task comments dissapear for tasks in Teams.
This may or may not resolve the issue.
This function applies when the team does not show nested under the groups folder in outlook.
If the team is not visible in outlook, then the comments will dissapear in teams.
Run this function to resolve the task comments not being visible in teams, and restart outlook after awhile.
If the issue continues then further troubleshooting is required.

## EXAMPLES

### EXAMPLE 1
```
Set-365GroupVisibility
```

Running the function without specifying the identity will deliver a grid view to select the group from, and populate the parameter that way.

### EXAMPLE 2
```
Set-365GroupVisibility -identity groupname@companyname.com
```

Specifying the identity parameter will run the function without delivering a Grid View for selecting the identity.
This is faster if you already know the team identity

## PARAMETERS

### -identity
{{ Fill identity Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
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
Requires the ExchangeOnline module be installed, imported, and Connected.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

