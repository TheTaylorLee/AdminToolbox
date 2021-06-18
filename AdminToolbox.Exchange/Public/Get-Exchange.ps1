function Get-Exchange {

    Get-IntroEX

    Write-Host "Exchange Functions"                                                                            -ForegroundColor green
    Write-Host "Add-DistributionMember         ..Adds a mailbox to a Distribution Group"                       -ForegroundColor cyan
    Write-Host "Connect-ExchangeServer         ..Connects an Exchange server PSSession"                        -ForegroundColor cyan
    Write-Host "Disconnect-ExchangeServer      ..Disconnects an Exchange server PSSession"                     -ForegroundColor cyan
    Write-Host "Enable-365MailboxExistingUser  ..Enables office 365 Mailbox for existing local user"           -ForegroundColor cyan
    Write-Host "Get-MailboxDetail              ..Gets a report commonly queried mailbox details"               -ForegroundColor cyan
    Write-Host "Get-MailboxScaleReport         ..Gets a report for diagnosing outlook limits being exceeded"   -ForegroundColor cyan
    Write-Host "Get-MailLog                    ..Gets a csv of mail logs"                                      -ForegroundColor cyan
    Write-Host "Get-UserDisabledMailboxes      ..Gets mailboxes associated with disabled ad accounts"          -ForegroundColor cyan
    Write-Host "Get-VirtualDirectories         ..Gets IIS virtual directories for Exchange"                    -ForegroundColor cyan
    Write-Host "Grant-MailboxAccessOWAOnly     ..Grants OWA access to a mailbox"                               -ForegroundColor cyan
    Write-Host "Set-VirtualDirectories         ..Sets IIS virtual directories for Exchange"                    -ForegroundColor cyan
    Write-Host " "
}