[Consider other Modules ](https://petri.com/practical-microsoft-graph-powershell-for-microsoft-teams/)]

```
# Won't convert or can't currently Convert
[-] Clear-TeamsCache (Doesn't make sense for this module)
[-] Enable-MailboxAccess (Can't convert)
[-] Get-AuthPolicy (Can't convert)
[-] Get-Office365
[-] Get-Quarantine
[-] Get-TenantDiagrams
[-] Get-VMDetails
[-] Invoke-EXOSharedSession
[-] Invoke-PowerState
[-] Invoke-Sync365
[-] Set-Subscription
[-] Start-AzureSync
[-] Unblock-Quarantine

# Maybe convert
[?] Convert-MailboxToShared

# Converted
[x] Connect-Office365 (Test-MSGraphRequirements) -private
[x] Get-AzureRoleMembers (Get-msgDirectoryRoleMembers)
[x] Get-GuestUsers
[x] Get-MFAStatus
[x] Get-MSOLRoleMembers

# In progress
[-] Enable-MailboxAccess (maybe can convert)
[ ] remove-mgusermessage (can remove unwanted emails from many mailboxes?)
[ ] Invoke-PerUserMFAEnforced
[ ] New-AuthPolicy
[ ] Set-365GroupVisibility
[ ] Set-AuthPolicy
[ ] Set-PasswordNeverExpire
```
https://github.com/microsoftgraph/msgraph-sdk-powershell
https://docs.microsoft.com/en-us/graph/permissions-reference
https://www.powershellgallery.com/packages/Microsoft.Graph/1.9.2
https://docs.microsoft.com/en-us/graph/overview
https://docs.microsoft.com/en-us/powershell/microsoftgraph/azuread-msoline-cmdlet-map?view=graph-powershell-1.0