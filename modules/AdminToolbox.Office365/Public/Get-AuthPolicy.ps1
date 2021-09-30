<#
    .DESCRIPTION
    Used to view existing Authentication Policies for Exchange Online Mailboxes

    Use of Modern Authentication Only is important for securing against Password Spray Attacks. New attacks on Basic authentication allow for taking control of an Exchange Online account by simply sending a malicious link to a target.

    .EXAMPLE
    Get-AuthPolicy | Out-GridView

    Gets the Authentication Policy out to a grid view

    .NOTES
    Requires the Exchange Online module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-AuthPolicy {

    [CmdletBinding()]
    Param (
    )

    Get-Recipient -RecipientTypeDetails UserMailbox -ResultSize Unlimited | Get-User | Select-Object DisplayName, AuthenticationPolicy, Sts*
}