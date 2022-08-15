<#
.DESCRIPTION
Get a list of empty directories within a given path

.EXAMPLE
get-emptydirectory -path c:\temp -recurse

.LINK
https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-EmptyDirectory {

    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $false)]
        [switch]$Recurse

    )

    if ($Recurse) {
        Get-ChildItem $path -Recurse -Directory | ForEach-Object {
            if ($null -eq (Get-ChildItem $_.FullName)) { $_.FullName }
        }
    }
    else {
        Get-ChildItem $path -Directory | ForEach-Object {
            if ($null -eq (Get-ChildItem $_.FullName)) { $_.FullName }
        }
    }
}