<#
    .DESCRIPTION
    This function will get AzureAD roles and their members.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-msgDirectoryRoleMembers {

    [CmdletBinding()]
    Param (
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'Directory.Read.All'

    $drroles = get-mgdirectoryrole | Select-Object id, displayname
    foreach ($drrole in $drroles) {
        $id = $drrole.id
        $members = get-mgdirectoryrolemember -directoryroleid $id | Select-Object *
        foreach ($member in $members) {
            [pscustomobject]@{
                role                            = $drrole.displayName
                datatype                        = $member.AdditionalProperties.'@odata.type'
                displayName                     = $member.AdditionalProperties.displayName
                accountEnabled                  = $member.AdditionalProperties.accountEnabled
                businessPhones                  = $member.additionalproperties.businessPhones
                city                            = $member.additionalproperties.city
                createdDateTime                 = $member.additionalproperties.createdDateTime
                companyName                     = $member.additionalproperties.companyName
                country                         = $member.additionalproperties.country
                department                      = $member.additionalproperties.department
                givenName                       = $member.additionalproperties.givenName
                jobTitle                        = $member.additionalproperties.jobTitle
                mailNickname                    = $member.additionalproperties.mailNickname
                onPremisesDistinguishedName     = $member.additionalproperties.onPremisesDistinguishedName
                onPremisesDomainName            = $member.additionalproperties.onPremisesDomainName
                onPremisesImmutableId           = $member.additionalproperties.onPremisesImmutableId
                onPremisesLastSyncDateTime      = $member.additionalproperties.onPremisesLastSyncDateTime
                onPremisesSecurityIdentifier    = $member.additionalproperties.onPremisesSecurityIdentifier
                onPremisesSamAccountName        = $member.additionalproperties.onPremisesSamAccountName
                onPremisesSyncEnabled           = $member.additionalproperties.onPremisesSyncEnabled
                onPremisesUserPrincipalName     = $member.additionalproperties.onPremisesUserPrincipalName
                otherMails                      = $member.additionalproperties.otherMails
                passwordPolicies                = $member.additionalproperties.passwordPolicies
                postalCode                      = $member.additionalproperties.postalCode
                proxyAddresses                  = $member.additionalproperties.proxyAddresses
                refreshTokensValidFromDateTime  = $member.additionalproperties.refreshTokensValidFromDateTime
                securityIdentifier              = $member.additionalproperties.securityIdentifier
                signInSessionsValidFromDateTime = $member.additionalproperties.signInSessionsValidFromDateTime
                state                           = $member.additionalproperties.state
                streetAddress                   = $member.additionalproperties.streetAddress
                surname                         = $member.additionalproperties.surname
                usageLocation                   = $member.additionalproperties.usageLocation
                userPrincipalName               = $member.additionalproperties.userPrincipalName
                userType                        = $member.additionalproperties.userType
            }
        }
    }
}