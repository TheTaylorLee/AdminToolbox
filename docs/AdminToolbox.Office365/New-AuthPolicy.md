---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# New-AuthPolicy

## SYNOPSIS

## SYNTAX

```
New-AuthPolicy [<CommonParameters>]
```

## DESCRIPTION
Used to secure Exchange Online Authentication by creating authentication policies

Use of Modern Authentication Only is important for securing against Password Spray Attacks.
New attacks on Basic authentication allow for taking control of an Exchange Online account by simply sending a malicious link to a target.

Authentication Policies that are created are named...
"Modern Auth Only"
"Basic Auth Allowed"

## EXAMPLES

### EXAMPLE 1
```
Set-AuthPolicy -CreatePolicies
```

Creates two Authentication Policies.
One Basic and One Modern.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the Exchange Online module be installed, imported, and Connected.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

