function Get-Printers {

    <#
    .DESCRIPTION
    This command returns a list of local or remote printers

    .Parameter computer
    Specifies a remote computer to pull a list of printers for

    .Parameter complex
    Specifies to additional information on the printers

    .EXAMPLE
    Returns printers for the local computer only.

    Get-Printers

    .EXAMPLE
    -Computer is used to pull printers from remote computers.

    Get-Printers -computer PCName

    .EXAMPLE
    Return long list of info on the printers

    Get-Printers -computer PCName -complex

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

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