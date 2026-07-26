<#
    .DESCRIPTION
    Upgrade choco packages

    .EXAMPLE
    Invoke-ChocoUpgrade

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-ChocoUpgrade {

    [CmdletBinding()]
    param (
    )

    #Check for Admin Privleges
    Get-Elevation

    choco.exe upgrade all
}