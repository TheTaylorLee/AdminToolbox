---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-AuthPolicy

## SYNOPSIS

## SYNTAX

```
Get-AuthPolicy [<CommonParameters>]
```

## DESCRIPTION
Used to view existing Authentication Policies for Exchange Online Mailboxes

Use of Modern Authentication Only is important for securing against Password Spray Attacks.
New attacks on Basic authentication allow for taking control of an Exchange Online account by simply sending a malicious link to a target.

## EXAMPLES

### EXAMPLE 1
```
Get-AuthPolicy | Out-GridView
```

Gets the Authentication Policy out to a grid view

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the Exchange Online module be installed, imported, and Connected.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

