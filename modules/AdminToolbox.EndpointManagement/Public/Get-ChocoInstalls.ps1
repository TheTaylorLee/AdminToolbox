<#
    .DESCRIPTION
    Show Installed Chocolatey packages

    .EXAMPLE
    Show-ChocoInstalls

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-ChocoInstalls {

    [CmdletBinding()]
    [Alias('Show-ChocoInstalls')]
    param (
    )


    choco.exe list --local-only
}