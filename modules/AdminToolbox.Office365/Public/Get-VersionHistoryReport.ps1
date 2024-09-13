<#
    .SYNOPSIS
    Retrieves version history information for files in SharePoint Online.

    .DESCRIPTION
    The Get-VersionHistoryReport function retrieves version history information for files in SharePoint Online.
    It connects to the specified SharePoint Online sites, retrieves the version history for each file in the specified list,
    and exports the information to a CSV file.

    .PARAMETER ClientID
    Specifies the Client ID of the Azure AD application that has the necessary permissions to connect to the SharePoint Online site. If not already done so, https://pnp.github.io/powershell/articles/registerapplication has instructions to register the required application.

    .PARAMETER sites
    Specifies an array of SharePoint Online site URLs to connect to.

    .PARAMETER ListName
    Specifies the name of the SharePoint Online list to retrieve version history from.

    .PARAMETER LogPath
    Specifies the path to the CSV file where the version history information will be exported.

    .EXAMPLE
    $date = Get-Date -Format yyyy-MM-dd
    Get-VersionHistoryReport -sites "https://company.sharepoint.com/sites/site1", "https://company.sharepoint.com/sites/site2" -ListName "Documents" -LogPath "$env:userprofile\downloads\$date SharepointVersionReport.csv" -clientid "12345678-1234-1234-1234-123456789012"

    Retrieves the version history for files in the "Documents" list from two SharePoint Online sites and exports the information to your downloads folder.

    .NOTES
    - This function requires the pnp.powershell module to be installed. You can install it by running the following command:
        Install-Module -Name pnp.powershell -Force
    - You need to have the necessary permissions to connect to the SharePoint site and perform get item versions.
    - If you have issues with pnp logins review these requirements. https://pnp.github.io/powershell/articles/registerapplication

    .LINK
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-VersionHistoryReport {
    param (
        [Parameter(Mandatory = $true)][string]$ClientID,
        [Parameter(Mandatory = $true)][string[]]$sites,
        [Parameter(Mandatory = $true)][string]$ListName,
        [Parameter(Mandatory = $true)][string]$LogPath
    )

    #Import Modules
    Import-Module PnP.PowerShell

    foreach ($site in $sites) {
        #Connect to SharePoint Online site.
        Connect-PnPOnline -Url $Site -Interactive -ClientId $ClientId


        $ListItems = Get-PnPListItem -List $ListName -PageSize 500 -Fields Author, Editor, Created, File_x0020_Type, File_x0020_Size, ObjectVersion | Where-Object { $_.FileSystemObjectType -eq "File" }


        foreach ($Item in $ListItems) {
            $versions = Get-PnPFileVersion -Url $item.FieldValues.FileRef
            foreach ($version in $versions) {
                [PSCustomObject]@{
                    Site            = [string]($site).split("/")[(($site).split("/").count) - 1]
                    Name            = $Item["FileLeafRef"]
                    Type            = $Item.FileSystemObjectType
                    FileSizeMB      = [Math]::Round(($version.size / 1MB), 2)
                    Version         = $version.VersionLabel
                    RelativeURL     = $Item["FileRef"]
                    CreatedByEmail  = $Item["Author"].Email
                    CreatedOn       = $Item["Created"]
                    Modified        = $Item["Modified"]
                    ModifiedByEmail = $Item["Editor"].Email
                } | Export-Csv $logpath -Append -NoTypeInformation
            }
        }


        # Disconnect from SharePoint Online
        Disconnect-PnPOnline
    }
}