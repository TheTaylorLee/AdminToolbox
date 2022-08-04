<#
.DESCRIPTION
Test and verify that required modules are installed and then connect to Office 365 and Azure. Used by SAML MAnagement functions.
#>

function Test-SAMLFunctionRequirements {

    [CmdletBinding()]
    Param (
    )

    # Check powershell version
    $version = $host.version.major
    if ($version -ne '5') {
        Write-Warning "Must run this function from Powershel 5.1"
        break
    }

    # Get needed modules, import or install, and connect
    try {
        Import-Module AzureAD -ErrorAction Stop
        Import-Module msonline -ErrorAction Stop
    }
    catch {
        Install-Module -Name AzureAD -Force -AllowClobber
        Install-Module -Name msonline -Force -AllowClobber
        Import-Module AzureAD -ErrorAction Stop
        Import-Module msonline -ErrorAction Stop
    }

    try {
        Connect-AzureAD
        Connect-MsolService
    }
    catch {
        $_
    }
}
