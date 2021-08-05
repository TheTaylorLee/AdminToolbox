function Get-ChocoOutdated {
    <#
    .DESCRIPTION
    Gets outdated choco packages

    .EXAMPLE
    Get-ChocoOutdated

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>
    [cmdletbinding()]
    [Alias('Show-ChocoOutdated')]
    param (

    )
    choco.exe outdated --ignore-unfound
}