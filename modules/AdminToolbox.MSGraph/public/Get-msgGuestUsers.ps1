<#
    .DESCRIPTION
    This function will provide a list of guest users accounts from Azure AD and any team they are a member of.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-msgGuestUsers {

    [CmdletBinding()]
    Param
    (
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'Directory.Read.All' | Out-Null

    #GET GUEST USER ACCESS TO DIFFERENT RESOURCES
    $ids = (get-mguser | Where-Object { $_.usertype -eq 'guest' }).id
    ForEach ($id in $ids) {
        # Get guest properties
        $mguser = get-mguser -userid $id | Where-Object { $_.usertype -eq 'guest' } | Select-Object DisplayName, accountenabled, CreatedDateTime, creationtype, id, identities, mail, mailnickname, proxyaddresses, RefreshTokensValidFromDateTime, SignInSessionsValidFromDateTime, UserPrincipalName, usertype

        #Get guest user teams memberships
        $teams = get-mguserjoinedteam -UserId $id | Select-Object displayname
        $teams2 = ($teams).displayname
        $teamsarray = $teams2 -join ", "

        #Output guest user custom object
        [pscustomobject]@{
            DisplayName                     = $mguser.DisplayName
            accountenabled                  = $mguser.accountenabled
            CreatedDateTime                 = $mguser.CreatedDateTime
            creationtype                    = $mguser.creationtype
            id                              = $mguser.id
            identities                      = $mguser.identities
            mail                            = $mguser.mail
            mailnickname                    = $mguser.mailnickname
            proxyaddresses                  = $mguser.proxyaddresses
            RefreshTokensValidFromDateTime  = $mguser.RefreshTokensValidFromDateTime
            SignInSessionsValidFromDateTime = $mguser.SignInSessionsValidFromDateTime
            UserPrincipalName               = $mguser.UserPrincipalName
            usertype                        = $mguser.usertype
            accessTeamsGroups               = $teamsarray
        }
    }
}
