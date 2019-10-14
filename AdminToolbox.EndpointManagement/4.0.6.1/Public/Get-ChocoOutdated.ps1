function Get-ChocoOutdated {
    <#
    .DESCRIPTION
    Gets outdated choco packages

    .EXAMPLE
    Get-ChocoOutdated

    .Link
    Get-ChocoInstalls
    Install-Chocolatey
    Install-ChocoPackages
    Invoke-ChocoUpgrade
    #>
    [cmdletbinding()]
    [Alias('Show-ChocoOutdated')]
    param (

    )
    choco.exe outdated --ignore-unfound
}