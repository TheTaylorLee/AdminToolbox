---
external help file: AdminToolbox.ActiveDirectoryManifest-help.xml
Module Name: AdminToolbox.ActiveDirectory
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-MailEnabledMembers

## SYNOPSIS

## SYNTAX

```
Get-MailEnabledMembers [[-Path] <Object>] [[-Searchbase] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Get a list of Active Directory groups and the Members for mail enabled groups.
This is intended to even provide membership for Azure mail enabled groups.
Group writeback must be enabled and the feature for those groups to have the friendly names enabled.

   This functions will not return full results if you name your groups Group_* or don't enable friendly names for writeback groups.
I have found the group_* writeback groups will have equivalent named writeback groups so they are excluded from the report.

   Each pages title is the "Group name -- description".
Don't store passwords in your descriptions or this will disclose them.
You should store confidential info in descrptions anyways it's not secure.

## EXAMPLES

### EXAMPLE 1
```
Get-MailEnabledMembers -Path "$env:USERPROFILE\downloads\AD Mail Enabled Group Members.xlsx" -searchbase "OU=Security Groups,DC=company,DC=net"
```

## PARAMETERS

### -Path
Specifies the export directory and filename for the report

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$env:USERPROFILE\downloads\AD Group Members.xlsx"
Accept pipeline input: False
Accept wildcard characters: False
```

### -Searchbase
A distinguished name for an OU path.

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
Requires Active Directory and ImportExcel Modules

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

