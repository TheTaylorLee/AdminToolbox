<#
    .Description
    This function recurses through all directories in a given path. It then returns the last time any file within the top level directories of that path had a file modified, written, and created.

    This can be useful in various scenarios. One such scenario is for cleaning up file shares.

    Take careful not of the fact the dates returned are not for the folder itself or any single file withing those folder. Instead those date times are in relation to any file within the folder. If dealing with a large amount of files and/or folders, this can take a long time to run.

    .Parameter Folder
    Directory with subfolders that should be audited.

    .Example
    Get-LastUsedDirectory -Folder c:\temp | export-csv $env:userprofile\downloads\results.csv

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-LastUsedDirectory {

    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, Mandatory = $true)]$Folder
    )

    $dirs = Get-ChildItem $Folder | Where-Object { $_.PSIsContainer -eq $True }
    ForEach ($dir in $dirs) {
        $LastWriteTime = Get-ChildItem  "$Folder\$($dir.name)" -Recurse |
        Where-Object { ($_.PSIsContainer -eq $False) } |
        Select-Object LastWriteTime |
        Sort-Object  -Property LastWriteTime -Descending |
        Select-Object -First 1

        $CreationTime = Get-ChildItem  "$Folder\$($dir.name)" -Recurse |
        Where-Object { ($_.PSIsContainer -eq $False) } |
        Select-Object CreationTime |
        Sort-Object  -Property CreationTime -Descending |
        Select-Object -First 1

        $LastAccessTime = Get-ChildItem  "$Folder\$($dir.name)" -Recurse |
        Where-Object { ($_.PSIsContainer -eq $False) } |
        Select-Object @{name = 'Folder'; expression = { $dir.Name } }, LastAccessTime |
        Sort-Object  -Property LastAccessTime -Descending |
        Select-Object -First 1

        [pscustomobject]@{
            Folder         = $dir.Name
            LastWriteTime  = $LastWriteTime.LastWriteTime
            CreationTime   = $CreationTime.CreationTime
            LastAccessTime = $LastAccessTime.LastAccessTime
        }
    }
}