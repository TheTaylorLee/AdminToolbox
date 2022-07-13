# Need to Do
- [ ] Convert Office 365 module functions if possible.
- [x]  Add workflow changes so that the MSGraph powershell module gets added to powershell gallery.
    - [x]  manifest needs to export new functions
    - [x]  Have to manually create v1 module manifest for workflow to work. Do this prior to publishing this dev branch to master.
- [x]  Full/major version bump admintoolbox master module when publishing msgraph.
- [x]  Add office 365 banner stating the depreciating status of the admintoolbox.office365 module and point to using msgraph instead.
- [x]  Create new custom intromsgraph private function and get-msgraph function list
    - [x] Consider how to organize functions. Either by submodule or purpose or some other factor that won't get confused during future updates.
- [ ] Review help for each function and update it with accurate info

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