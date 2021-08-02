---
external help file: AdminToolbox.EndpointManagementManifest-help.xml
Module Name: AdminToolbox.EndpointManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Add-LocalAdmin

## SYNOPSIS

## SYNTAX

```
Add-LocalAdmin [-user] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function adds a local admin to the computer or server it is run from.

## EXAMPLES

### EXAMPLE 1
```
Add-LocalAdmin -user domain\user
```

Adds specified domain user to the local administrators group

## PARAMETERS

### -user
The user that is to be added as a local admin

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
Azure AD Joined machines will require the user to first login to a computer with their domain account before adding their domain account as a local admin.
\
The user logging in registers their SID so that the command is successful.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

