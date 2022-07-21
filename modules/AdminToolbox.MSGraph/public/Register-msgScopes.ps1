<#
    .DESCRIPTION
    Provides a simple way to browse and register Microsoft Graph scopes.

    .EXAMPLE
    Register-msgScopes

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Register-msgScopes {

    [CmdletBinding()]
    Param (
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements | Out-Null

    $filter = Find-MgGraphPermission | Out-GridView -PassThru -Title "Select needed permissions."
    $scopes = ($filter).name -join ', '
    Connect-MgGraph -Scopes $scopes
}