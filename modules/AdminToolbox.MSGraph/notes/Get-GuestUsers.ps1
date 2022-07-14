<#
    .DESCRIPTION
    This function will provide a list of guest users accounts from Azure AD, and groups they are a member of.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-GuestUsers {

    [CmdletBinding()]
    Param
    (
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'Directory.Read.All'


    #CONSIDER THE USE OF THE PSCUSTOM OBJECTS TO BUILD A STRING ARRAY OF GUEST ACCESSES. eACH ACCESS TYPE SHOULD BE A DIFFERENT CUSTOM OBJECT ENTRY.
    #TEAM MEMBERSHIPS, FILE ACCESSES, AZURE ROLE MEMBERSHIPS, ETC.
    #FUNCTION LIKELY TO TAKE A LONG TIME TO RUN, BUT SHOULD PRODUCE GREAT SECURITY RESULTS.

    <#THIS IS PARTIAL CODE. NEEDS MORE WORK
    # Get all guest users
    get-mguser | Where-Object { $_.usertype -eq 'guest' } | Select-Object DisplayName, enabled, CreatedDateTime, creationtype, id, identities, mail, mailnickname, proxyaddresses, RefreshTokensValidFromDateTime, SignInSessionsValidFromDateTime, UserPrincipalName, usertype


    #GET GUEST USER ACCESS TO DIFFERENT RESOURCES
    $ids = (get-mguser | Where-Object { $_.usertype -eq 'guest' }).id
    ForEach ($id in $ids) {
        Get-MgUserJoinedTeam -userid $id
    }
    #>
}
