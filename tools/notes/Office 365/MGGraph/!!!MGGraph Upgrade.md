# Need to Do
- [ ] Update existing MsOnline and Azure AD functions to use MSGraph
- [ ] Update Connect-365 to remove legacy connection options
- [ ] Update Get-Office365 to put commands in the correct sections. Consider updating sections
- [ ] Review help for each function and update it with accurate info
- [ ] Change version to a new major on publish

# Install MS Graph Module
```powershell
Install-Module -Name Microsoft.Graph -AllowPrerelease -Force -AllowClobber
```

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