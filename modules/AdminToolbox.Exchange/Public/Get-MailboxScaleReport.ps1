<#
    .DESCRIPTION
    Get a mailbox report to help with troubleshooting where a mailbox may have exceeded outlook limits

    .PARAMETER MailboxAliases
    Array of aliases for mailboxes to pull a report from if not all

    .PARAMETER Path
    Where to export the excel file to

    .EXAMPLE
    Get-MailboxScaleReport -Path C:\report.xlsx

    Gets a report for all mailboxes

    .EXAMPLE
    Get-MailboxScaleReport -Path C:\report.xlsx -MailboxAliases JSmith

    Gets a report for one mailbox

    .EXAMPLE
    Get-MailboxScaleReport -Path C:\report.xlsx -MailboxAliases JOSmith, JASmith, SSmith

    Gets a report for some but not all mailboxes

    .NOTES
    Must have the Exchange and importexcel modules loaded. \
    Microsoft outlined limitations for mailboxes based on exchange versions noted below. \
    * Exchange 2007: 50000 messages per folder, 500 folders total
    * Exchange 2010/2013/2016/2019: 100000 messages per folder, 500 folders total

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-MailboxScaleReport {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]$Path,
        [Parameter(Mandatory = $false)]$MailboxAliases
    )

    $ErrorActionPreference = 'silentlycontinue'

    if ($null -eq $MailboxAliases) {
        $MailboxAliases1 = get-mailbox | Select-Object alias | Sort-Object alias
        $MailboxAliases2 = $MailboxAliases1.alias

        foreach ($MailboxAlias in $MailboxAliases2) {
            $Mailfolderstats = Get-MailboxFolderStatistics $MailboxAlias | Select-Object *
            $FolderCount = ($Mailfolderstats | Select-Object Name).count
            $FolderCount | Export-Excel -WorksheetName "$MailboxAlias" -Path "$Path" -FreezeTopRow -TableName "$mailboxalias Folder Count" -AutoSize -Title "$mailboxalias Folder Count" -TitleSize 11 -TitleBold
            $Mailboxstats = Get-MailboxStatistics $MailboxAlias | Select-Object Totalitemsize, itemcount
            $Mailboxstats | Export-Excel -WorksheetName "$MailboxAlias" -Path "$Path" -FreezeTopRow -TableName "$MailboxAlias MailboxSize" -AutoSize -Title "$mailboxalias MailboxSize" -TitleSize 11 -TitleBold  -StartRow 4
            $Mailfolderstats | Select-Object Name, FolderandSubFolderSize, ItemsinFolderandSubfolders | Export-Excel -WorksheetName "$MailboxAlias" -Path "$Path" -FreezeTopRow -TableName "$mailboxalias Folders" -AutoSize -StartColumn 4
        }
    }

    else {
        foreach ($MailboxAlias in $MailboxAliases) {
            $Mailfolderstats = Get-MailboxFolderStatistics $MailboxAlias | Select-Object *
            $FolderCount = ($Mailfolderstats | Select-Object Name).count
            $FolderCount | Export-Excel -WorksheetName "$MailboxAlias" -Path "$Path" -FreezeTopRow -TableName "$mailboxalias Folder Count" -AutoSize -Title "$mailboxalias Folder Count" -TitleSize 11 -TitleBold
            $Mailboxstats = Get-MailboxStatistics $MailboxAlias | Select-Object Totalitemsize, itemcount
            $Mailboxstats | Export-Excel -WorksheetName "$MailboxAlias" -Path "$Path" -FreezeTopRow -TableName "$MailboxAlias MailboxSize" -AutoSize -Title "$mailboxalias MailboxSize" -TitleSize 11 -TitleBold  -StartRow 4
            $Mailfolderstats | Select-Object Name, FolderandSubFolderSize, ItemsinFolderandSubfolders | Export-Excel -WorksheetName "$MailboxAlias" -Path "$Path" -FreezeTopRow -TableName "$mailboxalias Folders" -AutoSize -StartColumn 4
        }
    }

    $ErrorActionPreference = 'continue'
}