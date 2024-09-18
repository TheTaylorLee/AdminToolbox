<#
    .DESCRIPTION
    Get multifactor authentication status for Microsoft Azure accounts

    .EXAMPLE
    Get-msgMFAStatus | select userdisplayname, userprincipalname, {$_.authmethods -join ","}, iscapable, isenabled, ismfaregistered, isregistered | export-csv .\nacc-mfastatus.csv

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