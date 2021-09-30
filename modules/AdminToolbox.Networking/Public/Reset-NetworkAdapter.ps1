<#
    .DESCRIPTION
    Reset a specified interface

    .Parameter Interface
    Interface to be disabled and enabled

    .EXAMPLE
    Reset-NetworkAdapter -interface "Local Area Connection"

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Reset-NetworkAdapter {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]$Interface
    )

    #Check For Admin Privleges
    Get-Elevation

    netsh.exe interface set interface $Interface admin=disable
    netsh.exe interface set interface $Interface admin=enable
}