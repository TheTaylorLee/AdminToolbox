---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Convert-MailboxToShared

## SYNOPSIS

## SYNTAX

```
Convert-MailboxToShared [<CommonParameters>]
```

## DESCRIPTION
Convert an Exchange Online Mailbox to a Shared Mailbox without the need of maintaining a license.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requirements:
    1.
This Function is used for an Active Directory Synced account that is being disabled and the mailbox converted to an Exchange Online Shared Mailbox.
    2.
This Function must be run from the server that hosts Azure AD Connect and the on-premise Account must be synced to an Exchange Online Mailbox.
    3.
The Exchange online Module must be imported into the console before this function is run.
    4.
The account associated with the Exchange Online Mailbox must be disabled and moved to an OU that is not Azure AD Synced

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

