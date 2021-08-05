#Consider adding rights paramether with a validate option for the existing options
#Consider a looping version for different scenarios. Maybe not sure on this.

#Gives explicit ownership rights of a calendar
Install-Module ExchangeOnlineManagement -Force -AllowClobber
Connect-ExchangeOnline
Add-MailboxFolderPermission -Identity user@domain.com:\calendar -User user@domain.com -AccessRights Owner