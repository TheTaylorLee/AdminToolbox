<#
    .DESCRIPTION
    Adds a specified user as a Site Collection Administrator to all SharePoint Online site collections.

    .Parameter AdminSiteUrl
    The URL of the SharePoint Online Admin Center.

    .Parameter UserToAdd
    The user principal name (UPN) of the user to add as Site Collection Administrator.

    .EXAMPLE
    Import-Module Microsoft.Online.SharePoint.PowerShell
    Add-SiteCollectionAdmin -AdminSiteUrl "https://contoso-admin.sharepoint.com/" -UserToAdd "johns@contoso.com"

    .Notes
    Requires the SharePoint Online Management Shell module.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Add-SiteCollectionAdmin {

    param (
        [Parameter(Mandatory)]
        [string]$AdminSiteUrl,
        [Parameter(Mandatory)]
        [string]$UserToAdd
    )

    # Connect to SharePoint Online
    Import-Module Microsoft.Online.SharePoint.PowerShell -ErrorAction Stop

    # Connect to SharePoint Online Admin Center
    Connect-SPOService -Url $AdminSiteUrl

    # Get all site collections
    $SiteCollections = Get-SPOSite -Limit All

    # Add the user as a Site Collection Administrator to each site
    foreach ($Site in $SiteCollections) {
        Set-SPOUser -Site $Site.Url -LoginName $UserToAdd -IsSiteCollectionAdmin $true
    }
}