<#
    .DESCRIPTION
    Create a csv list for mailboxes associated with disabled AD Accounts

    .NOTES
    Requires the Active Directory module and must be run from the Exchange Server

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-UserDisabledMailboxes {

    [CmdletBinding()]

    Param (
    )

    Get-User -RecipientTypeDetails UserMailbox |
    Where-Object { $_.UserAccountControl -like "*accountdisabled*" }
}