<#
    .SYNOPSIS
    Removes file version history older than # months for files, excluding the existing version and the latest version.

    .DESCRIPTION
    The Remove-VersionHistoryOlderThan function connects to a SharePoint Online site, retrieves a specified list, and removes version history older than 3 months for files in the list, excluding the existing version and the latest version. It logs the success and failure details of each version removal to a CSV file.

    .Parameter Confirm
    Specifies understanding of the risk to run this function and accepts the risks. This function will delete versions of files and they will not be able to be reverted back to once completed.

    .PARAMETER ClientID
    Specifies the Client ID of the Azure AD application that has the necessary permissions to connect to the SharePoint Online site. If not already done so, https://pnp.github.io/powershell/articles/registerapplication has instructions to register the required application.

    .PARAMETER site
    The URL of the SharePoint Online site.

    .PARAMETER listName
    The name of the SharePoint Online list.

    .PARAMETER months
    The number of months to keep the version history.

    .EXAMPLE
    Import-Module pnp.powershell
    Remove-VersionHistoryOlderThan -site "https://company.sharepoint.com/sites/site1", "https://company.sharepoint.com/sites/site2" -listName "Documents" -months 3 -logpath $env:userprofile\downloads\Remove-VersionHistoryOlderThan.csv -clientid "12345678-1234-1234-1234-123456789012"

    This example removes version history older than 3 months for files in the "Documents" list of the SharePoint Online site "https://company.sharepoint.com/sites/site1".

    .NOTES
    - This function requires the pnp.powershell module to be installed. You can install it by running the following command:
        Install-Module -Name pnp.powershell -Force
    - You need to have the necessary permissions to connect to the SharePoint Online site and perform the version removal operation.
    - If you have issues with pnp logins review these requirements. https://pnp.github.io/powershell/articles/registerapplication

    ***Invalid Retention Hold***
    - https://answers.microsoft.com/en-us/msoffice/forum/all/unable-to-delete-version/8f1097a4-d7c9-4770-b0b3-166aa1cf1745
    - If you run into an invalid retention hold error, navigate to admin.microsoft.com dashboard and click on help and support.
    - Paste this into the search bar "Can't delete the versions in Sharepoint Online Site"
    - Then where it says Sharepoint Online Site URL, paste the site url and run tests.

    This process can remove invalid retention holds that are preventing the versions from being deleted.

    .LINK
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-VersionHistoryOlderThan {

    param (
        [Parameter(Mandatory = $false)][Boolean]$Confirm,
        [Parameter(Mandatory = $true)][string]$ClientID,
        [Parameter(Mandatory = $true)][string[]]$sites,
        [Parameter(Mandatory = $true)][string]$listName,
        [Parameter(Mandatory = $true)][int]$months,
        [Parameter(Mandatory = $true)][string]$LogPath
    )

    if ($confirm) {
        foreach ($site in $sites) {
            # Import the PnP PowerShell module
            Import-Module PnP.PowerShell -Force


            # Connect to the site
            Connect-PnPOnline -Url $site -Interactive -ClientId $ClientId

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
                                FileSizeMB   = "{0}" -f ($version.Size / 1MB)
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
                                FileSizeMB   = $null
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
    else {
        Write-Output "The confirm parameter is required for this function to run. If you set Confirm to $true, you are accepting the risks of running this function."
    }
}