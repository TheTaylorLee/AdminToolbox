<#
    .DESCRIPTION
    Get a report of what authentication methods a user has registered and if they have signed up for sspr.

    .PARAMETER all
    Specifiy to return all logs

    .PARAMETER top
    Specify a number of logs to return.

    .EXAMPLE
    Get-msgAuthenticationRegistration -top 100

    Get only the top 100 of users.

    .EXAMPLE
    Get-msgAuthenticationRegistration -all

    Get all users. Depending on retention this can take a very long time or never end.

    .NOTES
    Requires Azure AD licensing

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-msgAuthenticationRegistration {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "all")][switch]$all,
        [Parameter(Mandatory = $true, ParameterSetName = "top")][int]$top
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'AuditLog.Read.All', 'Directory.Read.All' | Out-Null

    # Get Report
    if ($all) {
        Get-MgReportAuthenticationMethodUserRegistrationDetail -Property * -all |
        Select-Object Id, DefaultMfaMethod, IsMfaCapable, IsMfaRegistered, IsPasswordlessCapable, IsSsprCapable, IsSsprEnabled, IsSsprRegistered,
        @{ Name = "MethodsRegistered"; Expression = { $_.MethodsRegistered -join “; ” } },
        UserDisplayName, UserPrincipalName, additionalproperties
    }

    if ($top) {
        Get-MgReportAuthenticationMethodUserRegistrationDetail -Property * -top $top |
        Select-Object Id, DefaultMfaMethod, IsMfaCapable, IsMfaRegistered, IsPasswordlessCapable, IsSsprCapable, IsSsprEnabled, IsSsprRegistered,
        @{ Name = "MethodsRegistered"; Expression = { $_.MethodsRegistered -join “; ” } },
        UserDisplayName, UserPrincipalName, additionalproperties
    }

}