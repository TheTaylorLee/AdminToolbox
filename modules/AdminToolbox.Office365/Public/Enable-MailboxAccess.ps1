<#
    .Description
    This function permits full access to a user mailbox and launches a browser session to Outlook on the Web. The reason to use this function would be for an unlicensed global admin to access a user mailbox. The gui in that instance would not be an option.

    .Parameter MailboxIdentity

    The MailboxIdentity parameter specifies the mailbox where you want to assign permissions to the user. Use the user principal name (UPN)

    .Parameter ReaderIdentity

    The readerIdentity parameter specifies the mailbox where you want to assign permissions to the user. Use the user principal name (UPN)

    .EXAMPLE
    Enable-MailboxAccess -MailboxIdentity user@domain.com -ReaderIdentity user@domain.com

    .Notes
    Requires the Exchange Online Powershell Module be installed and an Active exchange online session running. \

    This is intended for Management purposes only. If you abuse this function to abuse Microsofts EULA that is on you.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Enable-MailboxAccess {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$MailboxIdentity,
        [Parameter(Mandatory = $true)]$ReaderIdentity
    )

    add-mailboxpermission -Identity $MailboxIdentity -user $ReaderIdentity -AccessRights fullaccess -Confirm:$false -verbose

    Write-Host " "

    Write-Host "Allow time for the permitted access to take effect" -ForegroundColor Yellow
    Write-Host " "
    Write-Host "Access URL for the mailbox listed below" -ForegroundColor Green
    Write-Output "https://outlook.office.com/mail/$MailboxIdentity/?offline=disabled"
    Write-Host " "

}