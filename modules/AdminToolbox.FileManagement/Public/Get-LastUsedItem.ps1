<#
    .DESCRIPTION
    Recursively retrieves information about every file and directory under a specified parent directory.

    .Parameter Path
    The parent directory path to recurse.

    .EXAMPLE
    Get-LastUsedItem -Path "C:\Temp" | Export-Excel .\lastused.xlsx

    .Notes
    Returns a list of custom objects with item name, full path, container status, and timestamps.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>
function Get-LastUsedItem {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $items = Get-ChildItem -Path $Path -Recurse -Force

    foreach ($item in $items) {
        [pscustomobject]@{
            Item           = $item.Name
            DirectoryName  = $item.DirectoryName
            FullName       = $item.FullName
            PSIsContainer  = $item.PSIsContainer
            LastWriteTime  = $item.LastWriteTime
            CreationTime   = $item.CreationTime
            LastAccessTime = $item.LastAccessTime
        }
    }
}