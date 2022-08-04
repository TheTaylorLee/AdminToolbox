<#
.DESCRIPTION
Test and verify that required modules are installed and then connect to Office 365 and Azure. Used by SAML MAnagement functions.
#>

function Test-SAMLFunctionRequirements {

    [CmdletBinding()]
    Param (
    )

    $query = Get-Module AzureAD -ListAvailable
    if ($null -eq $query) {
        try {
            Import-Module AzureAD -ErrorAction Stop
            Connect-AzureAD
        }
        catch {
            Install-Module -Name AzureAD -Force -AllowClobber
            Import-Module AzureAD -ErrorAction Stop
            Connect-AzureAD
        }
    }

    $query = Get-Module msonline -ListAvailable
    if ($null -eq $query) {
        try {
            Import-Module msonline -ErrorAction Stop
            Connect-MsolService
        }
        catch {
            Install-Module -Name msonline -Force -AllowClobber
            Import-Module msonline -ErrorAction Stop
            Connect-MsolService
        }
    }
}
