<#
    .DESCRIPTION
    Show Installed Chocolatey packages

    .EXAMPLE
    Show-ChocoInstalls

    .NOTES
    This function was updated to support chocolatey versions after version 2.0. If running an older version first update chocolatey.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-ChocoInstalls {

    [CmdletBinding()]
    [Alias('Show-ChocoInstalls')]
    param (
    )


    choco.exe list  --include-programs
}