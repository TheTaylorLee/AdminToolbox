<#
.DESCRIPTION
Test and verify that required modules are installed and then connect to Office 365 and Azure. Used by SAML MAnagement functions.
#>

function Test-SAMLFunctionRequirements {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)][string[]]$scopes
    )

    # Get needed modules, import or install, and connect
    try {
        Import-Module Microsoft.Graph.Authentication -ErrorAction Stop
        Import-Module Microsoft.Graph.Users -ErrorAction Stop
        Import-Module  Microsoft.Graph.Groups -ErrorAction Stop
        Import-Module Microsoft.Graph.Applications -ErrorAction Stop
    }
    catch {
        Install-Module -Name Microsoft.Graph.Authentication -Force -AllowClobber
        Install-Module -Name Microsoft.Graph.Users -Force -AllowClobber
        Install-Module -Name Microsoft.Graph.Groups -Force -AllowClobber
        Install-Module -Name Microsoft.Graph.Applications -Force -AllowClobber
        Import-Module Microsoft.Graph.Authentication -ErrorAction Stop
        Import-Module Microsoft.Graph.Users -ErrorAction Stop
        Import-Module Microsoft.Graph.Groups -ErrorAction Stop
        Import-Module Microsoft.Graph.Applications -ErrorAction Stop
    }

    try {
        # Test that required scopes are imported and import them if they are not.
        $importedscopes = (Get-MgContext).scopes
        foreach ($scope in $scopes) {
            if ($importedscopes -notcontains $scope) {
                Connect-MgGraph -Scopes $scopes -NoWelcome
            }
        }
    }
    catch {
        $_
    }
}
