function Get-Exchange {

    Get-IntroEX

    Write-Host "Exchange Functions"                                                                        -Foregroundcolor green
    Write-Host "Add-DistributionMember     ..Adds a mailbox to a Distribution Group"                       -Foregroundcolor cyan
    Write-Host "Get-MailboxScaleReport     ..Gets a report for diagnosing outlook limits being exceeded"   -Foregroundcolor cyan
    Write-Host "Get-MailLog                ..Gets a csv of mail logs"                                      -Foregroundcolor cyan
    Write-Host "Get-UserDisabledMailboxes  ..Gets mailboxes associated with disabled ad accounts"          -Foregroundcolor cyan
    Write-Host "Get-VirtualDirectories     ..Gets IIS virtual directories for Exchange"                    -ForegroundColor cyan
    Write-Host "Grant-MailboxAccessOWAOnly ..Grants OWA access to a mailbox"                                -Foregroundcolor cyan
    Write-Host "Set-VirtualDirectories     ..Sets IIS virtual directories for Exchange"                    -ForegroundColor cyan
    Write-Host " "
}