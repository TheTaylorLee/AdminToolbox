<#
    .DESCRIPTION
    Get's all VM respective Folders in Vcenter, exports that information to an excel file, and save the excel file your download folder.

    .PARAMETER MailboxAliases
    Array of aliases for mailboxes to pull a report from if not all

    .PARAMETER Path
    Where to export the excel file to

    .EXAMPLE
    Get-VMFolderPaths

    .NOTES
    Must have the VMWARE.PowerCLI module loaded

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-VMFolderPaths {

    $folders = Get-Folder | Sort-Object Name

    ForEach ($folder in $folders) {
        Get-Folder -Name $folder | Get-VM | Sort-Object Name | Select-Object Name | Export-Excel -WorksheetName "$Folder" -Path "$env:USERPROFILE\Downloads\VMFolderPaths.xlsx" -FreezeTopRow -TableName "$Folder" -AutoSize
    }
    Start-Process $env:USERPROFILE\Downloads\VMFolderPaths.xlsx
}