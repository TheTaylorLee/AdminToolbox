<#
    .DESCRIPTION
    Get an audit log of authentication attempts

    .PARAMETER all
    Specifiy to return all logs

    .PARAMETER top
    Specify a number of logs to return.

    .EXAMPLE
    Get-msgSignIns -top 100

    Get only the top 100 or other specified number of available sign in logs.

    .EXAMPLE
    Get-msgSignIns -all

    Get all available sign in logs. Depending on retention this can take a very long time or never end.

    .NOTES
    Requires Azure AD licensing

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-msgSignIns {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "all")][switch]$all,
        [Parameter(Mandatory = $true, ParameterSetName = "top")][int]$top
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'AuditLog.Read.All', 'Directory.Read.All' | Out-Null

    #Output sign in logs
    if ($all) {
        Get-MgAuditLogSignIn -All -Property * |
        Select-Object UserDisplayName, UserId, UserPrincipalName, UserType, AppDisplayName, AppId, AppliedConditionalAccessPolicies, AuthenticationContextClassReferences, AuthenticationDetails,
        @{ Name = "AuthenticationMethodsUsed"; Expression = { $_.AuthenticationMethodsUsed -join “; ” } },
        @{ Name = "AuthenticationProcessingDetails"; Expression = { $_.AuthenticationProcessingDetails -join “; ” } },
        AuthenticationProtocol, AuthenticationRequirement,
        @{ Name = "AuthenticationRequirementPolicies"; Expression = { $_.AuthenticationRequirementPolicies -join “; ” } },
        AutonomousSystemNumber, AzureResourceId, ClientAppUsed, ClientCredentialType, ConditionalAccessStatus, CorrelationId, CreatedDateTime, CrossTenantAccessType, DeviceDetail, FederatedCredentialId, FlaggedForReview, HomeTenantId, HomeTenantName, IPAddress, IPAddressFromResourceProvider, Id, IncomingTokenType, IsInteractive, IsTenantRestricted, Location, MfaDetail,
        @{ Name = "NetworklocationDetails"; Expression = { $_.NetworklocationDetails -join “; ” } },
        OriginalRequestId, PrivateLinkDetails, ProcessingTimeInMilliseconds, ResourceDisplayName, ResourceId, ResourceServicePrincipalId, ResourceTenantId, RiskDetail,
        @{ Name = "RiskEventTypesV2"; Expression = { $_.RiskEventTypesV2 -join “; ” } },
        RiskLevelAggregated, RiskLevelDuringSignIn, RiskState, ServicePrincipalCredentialKeyId, ServicePrincipalCredentialThumbprint, ServicePrincipalId, ServicePrincipalName,
        @{ Name = "sessionlifetimepolicies"; Expression = { $_.sessionlifetimepolicies -join “; ” } },
        @{ Name = "SignInEventTypes"; Expression = { $_.SignInEventTypes -join “; ” } },
        SignInIdentifier, SignInIdentifierType, Status, TokenIssuerName, TokenIssuerType, UniqueTokenIdentifier, UserAgent,
        AdditionalProperties
    }

    if ($top) {
        Get-MgAuditLogSignIn -top $top -Property * |
        Select-Object UserDisplayName, UserId, UserPrincipalName, UserType, AppDisplayName, AppId, AppliedConditionalAccessPolicies, AuthenticationContextClassReferences, AuthenticationDetails,
        @{ Name = "AuthenticationMethodsUsed"; Expression = { $_.AuthenticationMethodsUsed -join “; ” } },
        @{ Name = "AuthenticationProcessingDetails"; Expression = { $_.AuthenticationProcessingDetails -join “; ” } },
        AuthenticationProtocol, AuthenticationRequirement,
        @{ Name = "AuthenticationRequirementPolicies"; Expression = { $_.AuthenticationRequirementPolicies -join “; ” } },
        AutonomousSystemNumber, AzureResourceId, ClientAppUsed, ClientCredentialType, ConditionalAccessStatus, CorrelationId, CreatedDateTime, CrossTenantAccessType, DeviceDetail, FederatedCredentialId, FlaggedForReview, HomeTenantId, HomeTenantName, IPAddress, IPAddressFromResourceProvider, Id, IncomingTokenType, IsInteractive, IsTenantRestricted, Location, MfaDetail,
        @{ Name = "NetworklocationDetails"; Expression = { $_.NetworklocationDetails -join “; ” } },
        OriginalRequestId, PrivateLinkDetails, ProcessingTimeInMilliseconds, ResourceDisplayName, ResourceId, ResourceServicePrincipalId, ResourceTenantId, RiskDetail,
        @{ Name = "RiskEventTypesV2"; Expression = { $_.RiskEventTypesV2 -join “; ” } },
        RiskLevelAggregated, RiskLevelDuringSignIn, RiskState, ServicePrincipalCredentialKeyId, ServicePrincipalCredentialThumbprint, ServicePrincipalId, ServicePrincipalName,
        @{ Name = "sessionlifetimepolicies"; Expression = { $_.sessionlifetimepolicies -join “; ” } },
        @{ Name = "SignInEventTypes"; Expression = { $_.SignInEventTypes -join “; ” } },
        SignInIdentifier, SignInIdentifierType, Status, TokenIssuerName, TokenIssuerType, UniqueTokenIdentifier, UserAgent,
        AdditionalProperties
    }
}
