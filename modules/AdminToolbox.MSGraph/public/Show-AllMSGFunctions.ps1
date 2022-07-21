<#
    .DESCRIPTION
    Gets all available Microsoft Graph Functions that are available with currently installed MSGraph module versions and gives the option to run it if desired.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Show-AllMSGFunctions {

    [CmdletBinding()]
    Param (
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements | Out-Null

    $runit = Get-Command -Module microsoft.graph* | Out-GridView -PassThru -Title "Select a function to run and hit ok if desired."
    Show-Command ($runit).name
}