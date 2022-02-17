$filter = Find-MgGraphPermission | Out-GridView -PassThru -Title "Select needed permissions."
$scopes = ($filter).name -join ', '
Connect-MgGraph -Scopes $scopes