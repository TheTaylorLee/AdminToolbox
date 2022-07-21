<#
    .DESCRIPTION
    Get multifactor authentication status for Microsoft Azure accounts

    .EXAMPLE
    Get-msgMFAStatus

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-msgMFAStatus {

    [CmdletBinding()]
    Param (
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'Reports.Read.All' | Out-Null

    #Output MFA Statuses
    Get-MgReportCredentialUserRegistrationDetail -All
}