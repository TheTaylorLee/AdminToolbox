<#

.SYNOPSIS
Retrieves all SharePoint site members filtered by email domain.

.DESCRIPTION
Connects to SharePoint Online tenant, enumerates all sites, and exports users whose email matches the specified domain.

.PARAMETER AdminSiteUrl
The URL of the SharePoint Online admin site.

.PARAMETER ClientID
Specifies the Client ID of the Azure AD application that has the necessary permissions to connect to the SharePoint Online site. If not already done so, https://pnp.github.io/powershell/articles/registerapplication has instructions to register the required application.

.PARAMETER Domain
The email domain to filter users (e.g., contoso.com).

.EXAMPLE
Install-Module PnP.PowerShell
Import-Module PnP.PowerShell
Get-SharePointSiteMembersByDomain -AdminSiteUrl "https://contoso-admin.sharepoint.com/" -ClientID "xxxx-xxxx-xxxx" -Domain "contoso.com"

.NOTES
Requires PnP.PowerShell module.

.LINK
https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-SharePointSiteMembersByDomain {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$AdminSiteUrl,
        [Parameter(Mandatory)]
        [string]$ClientID,
        [Parameter(Mandatory)]
        [string]$Domain
    )

    Install-Module PnP.PowerShell -Scope CurrentUser -Force
    Connect-PnPOnline -Url $AdminSiteUrl -Interactive

    $sites = Get-PnPTenantSite

    $report = foreach ($site in $sites) {
        Connect-PnPOnline -Url $site.Url -Interactive -ClientId $ClientID
        $users = Get-PnPUser
        foreach ($user in $users) {
            if ($user.Email -and $user.Email -like "*@$Domain") {
                [PSCustomObject]@{
                    SiteUrl   = $site.Url
                    UserName  = $user.Title
                    LoginName = $user.LoginName
                    Email     = $user.Email
                }
            }
        }
    }

    $report | Export-Csv -Path ".\AllSharePointSiteMembers.csv" -NoTypeInformation
}