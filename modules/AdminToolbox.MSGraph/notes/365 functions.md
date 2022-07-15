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
```
# In progress
[ ] Invoke-PerUserMFAEnforced
[ ] New-AuthPolicy
[ ] Set-365GroupVisibility
[ ] Set-AuthPolicy
[ ] Set-PasswordNeverExpire
