<#
    .DESCRIPTION
    Recursively retrieves information about every file and directory under a specified parent directory.

    .Parameter Path
    The parent directory path to recurse.

    .EXAMPLE
    Get-LastUsedItem -Path "C:\Temp" | Export-csv .\lastused.csv -NoTypeInformation -append

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

    Get-ChildItem -Path $Path -Recurse -Force | Select-Object name, directoryname, fullname, psiscontainer, lastwritetime, creationtime, lastaccesstime

}