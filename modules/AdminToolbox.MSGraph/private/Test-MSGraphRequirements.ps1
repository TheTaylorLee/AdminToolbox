<#
.DESCRIPTION
Test and verify that Microsoft Graph requirements are met for the Admintoolbox.Office365 Module

.PARAMETER Scopes
Specify an array of scopes that must be imported prior to the function continueing.

.EXAMPLE
Test-MSGraphRequirements -scopes 'Reports.Read.All'

Used in the function Get-msgMFAStatus

.EXAMPLE
Test-MSGraphRequirements -Scopes 'openid', 'email', 'profile', 'user.read'

Test requirements needed to sign in with the Microsoft.Graph.Authentication module.
#>

function Test-MSGraphRequirements {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)][string[]]$scopes
    )

    # Test for required module and prompt for install

    $query = Get-Module Microsoft.Graph -ListAvailable
    if ($null -eq $query) {
        try {
            Import-Module Microsoft.Graph.Authentication -ErrorAction Stop
        }
        catch {
            Install-Module -Name Microsoft.Graph -Force -AllowClobber
        }
    }

    # Sets the MSGraph profile to beta if not already set. This is required for graph sdk v1 but not v2. This remains as a legacy solution for those that haven't upgraded.
    try {
        #Select-MgProfile -Name "beta" -Verbose
    }
    catch {}

    # Test that required scopes are imported and import them if they are not.
    $importedscopes = (Get-MgContext).scopes
    foreach ($scope in $scopes) {
        if ($importedscopes -notcontains $scope) {
            Connect-MgGraph -Scopes $scopes
        }
    }
}
