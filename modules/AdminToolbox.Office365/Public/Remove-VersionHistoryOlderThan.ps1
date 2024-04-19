<#
    .SYNOPSIS
    Removes file version history older than # months for files, excluding the existing version and the latest version.

    .DESCRIPTION
    The Remove-VersionHistoryOlderThan function connects to a SharePoint Online site, retrieves a specified list, and removes version history older than 3 months for files in the list, excluding the existing version and the latest version. It logs the success and failure details of each version removal to a CSV file.

    .PARAMETER site
    The URL of the SharePoint Online site.

    .PARAMETER listName
    The name of the SharePoint Online list.

    .PARAMETER months
    The number of months to keep the version history.

    .EXAMPLE
    Import-Module pnp.powershell
    Remove-VersionHistoryOlderThan -site "https://company.sharepoint.com/sites/site1", "https://company.sharepoint.com/sites/site2" -listName "Documents" -months 3 -logpath $env:userprofile\downloads\Remove-VersionHistoryOlderThan.csv

    This example removes version history older than 3 months for files in the "Documents" list of the SharePoint Online site "https://company.sharepoint.com/sites/site1".

    .NOTES
    - This function requires the pnp.powershell module to be installed. You can install it by running the following command:
        Install-Module -Name pnp.powershell -Force
    - You need to have the necessary permissions to connect to the SharePoint Online site and perform the version removal operation.

    .LINK
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-VersionHistoryOlderThan {

    param (
        [Parameter(Mandatory = $true)][string[]]$sites,
        [Parameter(Mandatory = $true)][string]$listName,
        [Parameter(Mandatory = $true)][int]$months,
        [Parameter(Mandatory = $true)][string]$LogPath
    )

    $query = "You assume the risk of running this function. Do you wish to continue? (yes/no)"

    if ((Read-Host -Prompt $query) -ne "yes") {
        Write-Output "Operation aborted."
        return
    }

    foreach ($site in $sites) {
        # Import the PnP PowerShell module
        Import-Module PnP.PowerShell -Force


        # Connect to the site
        Connect-PnPOnline -Url $site -Interactive

        # Get the list
        $list = Get-PnPList -Identity $listName
        $items = Get-PnPListItem -List $list -PageSize 500 | Where-Object { $_.FileSystemObjectType -eq "File" }

        # Loop through each item
        foreach ($item in $items) {
            # Get the versions of the item
            $versions = Get-PnPFileVersion -Url $item.FieldValues.FileRef
            $versionsforRemoval = $versions | Sort-Object -Property Created | Select-Object -SkipLast 1

            # Loop through each version
            foreach ($version in $versionsforRemoval) {
                # Check if the version is older than specified months
                if ($version.Created -lt (Get-Date).AddMonths(-$months)) {
                    try {
                        Remove-PnPFileVersion -Url $item.FieldValues.FileRef -Identity $version.VersionLabel -Force
                        # Log successes
                        [PSCustomObject]@{
                            Deleted      = Write-Output "true"
                            VersionLabel = $version.VersionLabel
                            FileSize     = "{0}" -f ($version.Size / 1MB)
                            FileName     = $item.FieldValues.FileLeafRef
                            FullPath     = $item.FieldValues.FileRef
                            ListName     = $listName
                            Site         = $site
                            Error        = $null
                        } | Export-Csv $logpath -Append -NoTypeInformation
                    }
                    catch {
                        # Log failures
                        [PSCustomObject]@{
                            Deleted      = Write-Output "false"
                            VersionLabel = $version.VersionLabel
                            FileSize     = $null
                            FileName     = $item.FieldValues.FileLeafRef
                            FullPath     = $item.FieldValues.FileRef
                            ListName     = $listName
                            Site         = $site
                            Error        = $error[0].Exception.Message
                        } | Export-Csv $logpath -Append -NoTypeInformation
                    }
                }
            }
        }

        # Disconnect from SharePoint Online
        Disconnect-PnPOnline
    }
}