<#
    .SYNOPSIS
    Sets versioning limits for SharePoint libraries.

    .DESCRIPTION
    The Set-SharepointVersionLimits function is used to set versioning limits for SharePoint libraries. It allows you to specify the sites, list name, and versioning settings for the libraries.

    .PARAMETER ClientID
    Specifies the Client ID of the Azure AD application that has the necessary permissions to connect to the SharePoint Online site. If not already done so, https://pnp.github.io/powershell/articles/registerapplication has instructions to register the required application.

    .PARAMETER Sites
    Specifies the SharePoint sites where the libraries are located. This parameter accepts an array of strings representing the site URLs.

    .PARAMETER ListName
    Specifies the name of the SharePoint list or library where the versioning limits should be set.

    .PARAMETER EnableVersioning
    Specifies whether versioning should be enabled for the SharePoint list or library. This parameter accepts a boolean value.

    .PARAMETER MajorVersionLimit
    Specifies the maximum number of major versions to keep for each item in the SharePoint list or library. This parameter accepts an integer value.

    .PARAMETER MinorVersionLimit
    Specifies the maximum number of minor versions to keep for each item in the SharePoint list or library. This parameter accepts an integer value.

    .EXAMPLE
    Set-SharepointVersionLimits -Sites "https://tenant.sharepoint.com/sites/site1", "https://tenant.sharepoint.com/sites/site2" -ListName "Documents" -EnableVersioning $true -MajorVersionLimit 10 -MinorVersionLimit 5 -clientid "12345678-1234-1234-1234-123456789012"

    Sets versioning limits for the "Documents" library in the "site1" and "site2" SharePoint sites. Versioning is enabled with a maximum of 10 major versions and 5 minor versions.

    .EXAMPLE
    $siteurl = "https://tenant-admin.sharepoint.com"
    Connect-PnPOnline $Site -Interactive
    [string[]]$allSites = Get-PnPTenantSite | Sort-Object -Property Url
    Set-SharepointVersionLimits -Sites $allsites -ListName "Documents" -EnableVersioning $false -clientid "12345678-1234-1234-1234-123456789012"

    Disables versioning for the "Documents" library on all sites that the connected account has owner rights to.

    .NOTES
    - This function requires the pnp.PowerShell module to be installed. You can install it by running the following command:
    Install-Module -Name pnp.PowerShell -Force
    - You need to have the necessary permissions to connect to the SharePoint Online site and perform the version removal operation.
    - If you have issues with pnp logins review these requirements. https://pnp.github.io/powershell/articles/registerapplication

    .LINK
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-SharepointVersionLimits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][string]$ClientID,
        [Parameter(Mandatory = $true)][string[]]$Sites,
        [Parameter(Mandatory = $true)][string]$ListName,
        [Parameter(Mandatory = $true)][Boolean]$EnableVersioning,
        [Parameter(Mandatory = $false)][int]$MajorVersionLimit,
        [Parameter(Mandatory = $false)][int]$MinorVersionLimit
    )


    foreach ($site in $sites) {
        Connect-PnPOnline $site -Interactive -ClientId $ClientId

        ### Get the Library
        $Library = Get-PnPList -Identity $ListName

        $params = @{
            Identity         = $Library
            EnableVersioning = $EnableVersioning
        }
        if ($null -ne $MajorVersionLimit) {
            $params.MajorVersions = $MajorVersionLimit
        }
        if ($null -ne $MinorVersionLimit) {
            $params.MinorVersions = $MinorVersionLimit
        }

        Set-PnPList @params

        ## Wrap it up
        Disconnect-PnPOnline
    }
}