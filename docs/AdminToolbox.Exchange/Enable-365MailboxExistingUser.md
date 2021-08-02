---
external help file: AdminToolbox.ExchangeManifest-help.xml
Module Name: AdminToolbox.Exchange
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Enable-365MailboxExistingUser

## SYNOPSIS

## SYNTAX

```
Enable-365MailboxExistingUser [-Identity] <Object> [-PrimarySmtpAddress] <Object>
 [-RemoteRoutingAddress] <Object> [-DomainController] <Object> [<CommonParameters>]
```

## DESCRIPTION
Simply a wrapper for existing function Enable-RemoteMailbox.
This exists so if run it prompts for only needed attributes.
This function will enable an office 365 mailbox for an existing user if they don't have a mailbox.
If they have a mailbox in Exchange Online, but it's not visible in the on-premise exchange server, this function will make it visible locally.

## EXAMPLES

### EXAMPLE 1
```
Enable-365Mailbox -Identity Domain\Username -PrimarySmtpAddress email@company.com -RemoteRoutingAddres email@company.onmicrosoft.com -DomainController server.domain.com
```

Enable an office 365 mailbox for an existing Active Directory User

## PARAMETERS

### -Identity
The Identity parameter specifies the identity of the existing on-premises user.
You can use any value that uniquely identifies the user.
For example:

ADObjectID
GUID
Distinguished name (DN)
Domain\Username
User principal name (UPN)
LegacyExchangeDN
User alias

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

### -PrimarySmtpAddress
The PrimarySmtpAddress parameter specifies the primary return email address that's used for the recipient.

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

### -RemoteRoutingAddress
The RemoteRoutingAddress parameter specifies the SMTP address of the mailbox in the service that this user is associated with.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomainController
The DomainController parameter specifies the domain controller that's used by this cmdlet to read data from or write data to Active Directory.
You identify the domain controller by its fully qualified domain name (FQDN).
For example, dc01.contoso.com.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

