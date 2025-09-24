<#
    .DESCRIPTION
    Finds directories at a specified path and depth, displaying their names and full paths.

    .PARAMETER Path
    The root path to search for directories.

    .PARAMETER Depth
    The depth to search for directories.

    .EXAMPLE
    Find-MovedFolder -Path "E:\folder\topsharefolder" -Depth 2 | Out-GridView

    .NOTES
    Uses Out-GridView for interactive selection.

    .LINK
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Find-MovedFolder {
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [int]$Depth
    )

    begin {
        get-elevation
        Set-BackupPrivilege -Enable $true
    }
    process {
        Get-ChildItem $Path -Depth $Depth -Directory | Select-Object Name, FullName
    }
    end {
        Set-BackupPrivilege -Enable $false
    }
}