<#
    .Description
    Get a gui prompt for Specifying a folder name

    .Example
    $Folder = Get-Foldername

    Creates a prompt to select a folder and then saves the path to a variable.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-FolderName {

    param([string]$Description = "Select Folder", [string]$RootFolder = "Desktop")

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $objForm = New-Object System.Windows.Forms.FolderBrowserDialog
    $objForm.Rootfolder = $RootFolder
    $objForm.Description = $Description
    $Show = $objForm.ShowDialog()

    If ($Show -eq "OK") {
        Return $objForm.SelectedPath
    }
    Else {
        Write-Error "Operation cancelled by user."
    }
}