<#
    .DESCRIPTION
    This command returns a list of local or remote printers

    .Parameter computer
    Specifies a remote computer to pull a list of printers for

    .Parameter complex
    Specifies to additional information on the printers

    .EXAMPLE
    Get-Printers

    Returns printers for the local computer only.

    .EXAMPLE
    Get-Printers -computer PCName

    -Computer is used to pull printers from remote computers.

    .EXAMPLE
    Get-Printers -computer PCName -complex

    Return long list of info on the printers

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-Printers {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $false)]$computer,
        [Parameter(Mandatory = $false)][switch]$complex
    )

    if ($complex) {
        Get-CimInstance cim_printer -computer $computer | Select-Object Name, Drivername, Portname, Status, SystemName, local, shared, CapabilityDescriptions
    }

    else {
        Get-CimInstance cim_printer -computer $computer | Select-Object Name, Drivername, Portname
    }
}