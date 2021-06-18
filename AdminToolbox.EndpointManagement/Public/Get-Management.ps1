function Get-Management {

    <#
    .DESCRIPTION
    Opens Computer management connected for another PC

    .Parameter Computer
    Specify remote computer to manage

    .Example
    Specify the computer you are connecting to.

    Get-Management -computer PCName
    #>

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$computer
    )

    compmgmt.msc /computer:$computer

}