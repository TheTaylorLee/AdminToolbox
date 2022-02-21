# Connecting and managing scopes
### Use beta api for newer function availability
```Powershell
Select-MgProfile -Name "beta"
```

### Get permitted scopes. Consider a function to allow all scopes used by functions created
```Powershell
(Get-MgContext).scopes
```

### To view available scopes and permit them to the app registration
```Powershell
$filter = Find-MgGraphPermission | Out-GridView -PassThru -Title "Select needed permissions."
$scopes = ($filter).name -join ', '
Connect-MgGraph -Scopes $scopes
```

# [Get-MFAStatus](https://docs.microsoft.com/en-us/powershell/module/microsoft.graph.reports/get-mgreportcredentialuserregistrationdetail?view=graph-powershell-beta)
```Powershell
[string[]]$scopes = 'Reports.Read.All'
Connect-MgGraph -Scopes $scopes
Get-MgReportCredentialUserRegistrationDetail
```