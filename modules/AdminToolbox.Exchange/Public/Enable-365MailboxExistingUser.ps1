<#
    .DESCRIPTION
    Simply a wrapper for existing function Enable-RemoteMailbox. This exists so if run it prompts for only needed attributes. This function will enable an office 365 mailbox for an existing user if they don't have a mailbox. If they have a mailbox in Exchange Online, but it's not visible in the on-premise exchange server, this function will make it visible locally.

    .Parameter Identity
    The Identity parameter specifies the identity of the existing on-premises user. You can use any value that uniquely identifies the user. For example:

    ADObjectID
    GUID
    Distinguished name (DN)
    Domain\Username
    User principal name (UPN)
    LegacyExchangeDN
    User alias

    .Parameter PrimarySmtpAddress
    The PrimarySmtpAddress parameter specifies the primary return email address that's used for the recipient.

    .Parameter RemoteRoutingAddress
    The RemoteRoutingAddress parameter specifies the SMTP address of the mailbox in the service that this user is associated with.

    .Parameter DomainController
    The DomainController parameter specifies the domain controller that's used by this cmdlet to read data from or write data to Active Directory. You identify the domain controller by its fully qualified domain name (FQDN). For example, dc01.contoso.com.

    .EXAMPLE
    Enable-365Mailbox -Identity Domain\Username -PrimarySmtpAddress email@company.com -RemoteRoutingAddres email@company.onmicrosoft.com -DomainController server.domain.com

    Enable an office 365 mailbox for an existing Active Directory User

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Enable-365MailboxExistingUser {

    [CmdletBinding()]
    [alias('Enable-365Mailbox')]
    Param (
        [Parameter(Mandatory = $true)]$Identity,
        [Parameter(Mandatory = $true)]$PrimarySmtpAddress,
        [Parameter(Mandatory = $true)]$RemoteRoutingAddress,
        [Parameter(Mandatory = $true)]$DomainController
    )

    Enable-RemoteMailbox -Identity $Identity -PrimarySmtpAddress $PrimarySmtpAddress -RemoteRoutingAddres $RemoteRoutingAddres -DomainController $DomainController
}