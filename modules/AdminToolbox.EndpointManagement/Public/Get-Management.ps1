<#
    .DESCRIPTION
    Opens Computer management connected for another PC

    .Parameter Computer
    Specify remote computer to manage

    .Example
    Get-Management -computer PCName

    Specify the computer you are connecting to.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-Management {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$computer
    )

    compmgmt.msc /computer:$computer

}