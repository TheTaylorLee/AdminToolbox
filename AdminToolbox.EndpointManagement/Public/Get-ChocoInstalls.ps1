function Get-ChocoInstalls {
    <#
    .DESCRIPTION
    Show Installed Chocolatey packages

    .EXAMPLE
    Show-ChocoInstalls

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>
    [CmdletBinding()]
    [Alias('Show-ChocoInstalls')]
    param (
    )


    choco.exe list --local-only
}