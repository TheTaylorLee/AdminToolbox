<#
    .Description
    Get a gui prompt for Specifying a folder name

    .Example
    $Folder = Get-Foldername

    Creates a prompt to select a folder and then saves the path to a variable.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-FileName {

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $show = $OpenFileDialog.ShowDialog()

    If ($Show -eq "OK") {
        Return $OpenFileDialog.FileName
    }
    Else {
        Write-Error "Operation cancelled by user."
    }
}