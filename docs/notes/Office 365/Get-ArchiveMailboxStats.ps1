Get-EXOMailbox -ErrorAction silentlycontinue |
Get-MailboxStatistics -Archive -ErrorAction silentlycontinue |
Select-Object DisplayName, TotalItemSize, ItemCount