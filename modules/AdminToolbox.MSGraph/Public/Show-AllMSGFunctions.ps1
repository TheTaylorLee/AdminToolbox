<#
.DESCRIPTION
Gets all available Microsoft Graph Functions that are available with currently installed MSGraph module versions.
#>

function Show-AllMSGFunctions {
    Test-MSGraphRequirements
    Get-Command -Module microsoft.graph*
}