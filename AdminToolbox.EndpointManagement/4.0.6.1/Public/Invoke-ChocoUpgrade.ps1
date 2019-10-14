function Invoke-ChocoUpgrade {
    <#
    .DESCRIPTION
    Upgrade choco packages

    .EXAMPLE
    Invoke-ChocoUpgrade

    .Link
    Get-ChocoInstalls
    Get-ChocoOutdated
    Install-Chocolatey
    Install-Chocolatey
    #>

    [CmdletBinding()]
    param (
    )

    #Check for Admin Privleges
    Get-Elevation

    choco.exe upgrade all
}