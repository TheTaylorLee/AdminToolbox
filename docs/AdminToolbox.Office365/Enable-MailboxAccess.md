---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Enable-MailboxAccess

## SYNOPSIS

## SYNTAX

```
Enable-MailboxAccess [-MailboxIdentity] <Object> [-ReaderIdentity] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function permits full access to a user mailbox and launches a browser session to Outlook on the Web.
The reason to use this function would be for an unlicensed global admin to access a user mailbox.
The gui in that instance would not be an option.

## EXAMPLES

### EXAMPLE 1
```
Enable-MailboxAccess -MailboxIdentity user@domain.com -ReaderIdentity user@domain.com
```

## PARAMETERS

### -MailboxIdentity
The MailboxIdentity parameter specifies the mailbox where you want to assign permissions to the user.
Use the user principal name (UPN)

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

### -ReaderIdentity
The readerIdentity parameter specifies the mailbox where you want to assign permissions to the user.
Use the user principal name (UPN)

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
Requires the Exchange Online Powershell Module be installed and an Active exchange online session running.
\

This is intended for Management purposes only.
If you abuse this function to abuse Microsofts EULA that is on you.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

