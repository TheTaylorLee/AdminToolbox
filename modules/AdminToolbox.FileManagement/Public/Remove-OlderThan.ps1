<#
    .Description
    This scripts function is to delete files and folders older than x days recursively.

    .Parameter Path
    Path where files are to be deleted from

    .Parameter Daysback
    Specify files over x days old to be deleted

    .Parameter Recurse
    Specify if the path should have files also removed from subfolders

    .Example
    Delete-OlderThan -Path "C:\Folder" -DaysBack "-90"

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-OlderThan {

    Param (
        [Parameter(Mandatory = $true)]$Path,
        [Parameter(Mandatory = $true)][ValidateScript( { $_ -lt 0 })][int]$Daysback,
        [Parameter(Mandatory = $false)][Switch]$Recurse
    )

    #Check For Admin Privleges
    Get-Elevation

    if ($Recurse) {
        $CurrentDate = Get-Date
        $DatetoDelete = $CurrentDate.AddDays($Daysback)
        Get-ChildItem $Path -Recurse | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Force
    }

    else {
        $CurrentDate = Get-Date
        $DatetoDelete = $CurrentDate.AddDays($Daysback)
        Get-ChildItem $Path | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Force
    }

}