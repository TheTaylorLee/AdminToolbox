<#
    .DESCRIPTION
    Gets all available Microsoft Graph Functions that are available with currently installed MSGraph module versions.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Show-AllMSGFunctions {

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements

    Get-Command -Module microsoft.graph*
}