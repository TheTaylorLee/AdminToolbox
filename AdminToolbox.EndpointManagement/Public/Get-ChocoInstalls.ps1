function Get-ChocoInstalls {
    <#
    .DESCRIPTION
    Show Installed Chocolatey packages

    .EXAMPLE
    Show-ChocoInstalls

    .Link
    Get-ChocoOutdated
    Install-Chocolatey
    Install-ChocoPackages
    Invoke-ChocoUpgrade
    #>
    [CmdletBinding()]
    [Alias('Show-ChocoInstalls')]
    param (
    )


    choco.exe list --local-only
}