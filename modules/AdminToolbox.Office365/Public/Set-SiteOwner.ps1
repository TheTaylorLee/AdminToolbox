<#
    .SYNOPSIS
    Sets the specified user as an owner for multiple SharePoint sites.

    .DESCRIPTION
    The Set-SiteOwner function sets the specified user as an owner for multiple SharePoint sites. It loops through each site in the provided array and adds the user as a site owner using the Set-SPOSite cmdlet.

    .PARAMETER siteOwner
    The user account to be set as an owner for the SharePoint sites. This parameter is mandatory.

    .PARAMETER sites
    An array of SharePoint sites for which the user will be set as an owner. This parameter is mandatory.

    .EXAMPLE
    Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking -UseWindowsPowerShell
    Set-SiteOwner -siteOwner "user@example.com" -sites "https://company.sharepoint.com/sites/site1", "https://company.sharepoint.com/sites/site2"

    Sets the user "user@example.com" as an owner for the SharePoint sites "https://contoso.sharepoint.com/sites/site1" and "https://contoso.sharepoint.com/sites/site2".

    .EXAMPLE
    Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking -UseWindowsPowerShell
    Connect-SPOService -Url "https://tenant-admin.sharepoint.com"
    $sites = Get-SPOSite -Limit All | Sort-Object
    Set-SiteOwner -siteOwner "user@example.com" -sites $sites

    Sets the user "user@example.com" as an owner for all SharePoint sites.

    .NOTES
    This function requires the SharePoint Online Management Shell module to be installed. You can install it by running the following command:
    Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Force

    .LINK
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-SiteOwner {
    param (
        [Parameter(Mandatory = $true)][string]$siteOwner,
        [Parameter(Mandatory = $true)][string[]]$sites
    )

    # Loop through each site and add the user as a site owner
    foreach ($site in $sites) {
        Set-SPOSite -Identity $site.Url -Owner $siteOwner
    }

    # Disconnect from SharePoint
    Disconnect-SPOService
}