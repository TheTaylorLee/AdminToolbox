<#
    .DESCRIPTION
    Produces a concentrated report of mailboxes that is useful for migration projects.

    .EXAMPLE
    Get-MailboxReport

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function get-mailboxreport {

    $Mailboxes = get-mailbox | Select-Object alias, SamAccountName, DistinguishedName, PrimarySmtpAddress, database, emailaddresses, DisplayName

    foreach ($mailbox in $mailboxes) {

        $stats = Get-MailboxStatistics $mailbox.alias | Select-Object ItemCount, TotalItemSize, servername, LastLogonTime, IsArchiveMailbox, MailboxTypeDetail

        $emailaddresses1 = $mailbox.emailaddresses
        $emailaddresses2 = $emailaddresses1 -join ","

        [pscustomobject]@{
            Displayname        = $mailbox.DisplayName
            Alias              = $mailbox.alias
            SamAccountName     = $mailbox.SamAccountName
            DistinguishedName  = $mailbox.DistinguishedName
            PrimarySMTPAddress = $mailbox.PrimarySmtpAddress
            EmailAddresses     = $emailaddresses2
            Itemcount          = $stats.ItemCount
            TotalItemSize      = $stats.totalitemsize
            Database           = $mailbox.database
            ServerName         = $stats.servername
            LastLogonTime      = $stats.lastlogontime
            IsArchiveMailbox   = $stats.IsArchiveMailbox
            MailboxTypeDetail  = $stats.MailboxTypeDetail
        } | Export-Excel -Path $env:USERPROFILE\downloads\mailboxdetails.xlsx -WorksheetName $mailbox.database -FreezeTopRow -AutoSize -Append
    }
    Write-Host "Report can be found here $env:USERPROFILE\downloads\mailboxdetails.xlsx"
}
