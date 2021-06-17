Function Grant-MailboxAccessOWAOnly {

    <#
    .DESCRIPTION
    Grant access to a mailbox while not having it automap in outlook

    .PARAMETER Mailbox
    Alias of the mailbox that access is being granted to

    .PARAMETER User
    Alias of user that should have access to the mailbox

    .EXAMPLE
    Grants Jane access to John's mailbox

    Grant-MailboxAccessOWAOnly -user jane -mailbox john

    .NOTES
    Must have the Exchange module loaded and importexcel module
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]$User,
        [Parameter(Mandatory = $false)]$Mailbox
    )

    Add-MailboxPermission -AutoMapping $false -Identity $Mailbox -user $User -AccessRights FullAccess -InheritanceType All
}