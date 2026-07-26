<#
    .DESCRIPTION
    Get multifactor authentication status for Microsoft Azure accounts

    .PARAMETER filter
    Add any filter accepted by the get-mguser function.

    FILTER EXAMPLES:
    Get Enabled Accounts Only:
     "accountEnabled eq true"
    Get Local AD Synced:
     "OnPremisesSyncEnabled eq true"
    Get Guests:
     "UserType eq 'Guest'"
    Get Licensed Members:
     "assignedLicenses/`$count ne 0 and userType eq 'Member'"
    Get Unlicensed Members:
     "assignedLicenses/`$count eq 0 and userType eq 'Member'"

    .EXAMPLE
    Get-msgMFAStatus | export-csv .\nacc-mfastatus.csv -notypeinformation

    .Link
    https://github.com/TheTaylorLee/AdminToolbox

#>

function Get-msgMFAStatus {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string]$filter
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes "User.Read.All", “UserAuthenticationMethod.Read.All” | Out-Null

    #Get all Azure users
    $users = get-mguser -filter $filter -All -ConsistencyLevel eventual -CountVariable Records

    #loop through each user account
    foreach ($user in $users) {

        $myObject = [PSCustomObject]@{
            user                      = $null
            MFAstatus                 = $null
            email                     = $null
            fido2                     = $null
            MicrosoftAuthenticator    = $null
            password                  = $null
            Authenticatorpasswordless = $null
            phone                     = $null
            softwareoath              = $null
            tempaccess                = $null
            hellobusiness             = $null
        }

        $MFAData = Get-MgUserAuthenticationMethod -UserId $user.UserPrincipalName #-ErrorAction SilentlyContinue

        $myobject.user = $user.UserPrincipalName
        #check authentication methods for each user
        ForEach ($method in $MFAData) {

            Switch ($method.AdditionalProperties["@odata.type"]) {
                "#microsoft.graph.emailAuthenticationMethod" {
                    $myObject.email = $true
                    $myObject.MFAstatus = "Enabled"
                }
                "#microsoft.graph.fido2AuthenticationMethod" {
                    $myObject.fido2 = $true
                    $myObject.MFAstatus = "Enabled"
                }
                '#microsoft.graph.passwordlessMicrosoftAuthenticatorAuthenticationMethod' {
                    $myObject.Authenticatorpasswordless = $true
                    $myObject.MFAstatus = "Enabled"
                }
                "#microsoft.graph.microsoftAuthenticatorAuthenticationMethod" {
                    $myObject.MicrosoftAuthenticator = $true
                    $myObject.MFAstatus = "Enabled"
                }
                "#microsoft.graph.passwordAuthenticationMethod" {
                    $myObject.password = $true
                    # When only the password is set, then MFA is disabled.
                    if ($myObject.MFAstatus -ne "Enabled") {
                        $myObject.MFAstatus = "Disabled"
                    }
                }
                "#microsoft.graph.phoneAuthenticationMethod" {
                    $myObject.phone = $true
                    $myObject.MFAstatus = "Enabled"
                }
                "#microsoft.graph.softwareOathAuthenticationMethod" {
                    $myObject.softwareoath = $true
                    $myObject.MFAstatus = "Enabled"
                }
                "#microsoft.graph.temporaryAccessPassAuthenticationMethod" {
                    $myObject.tempaccess = $true
                    $myObject.MFAstatus = "Enabled"
                }
                "#microsoft.graph.windowsHelloForBusinessAuthenticationMethod" {
                    $myObject.hellobusiness = $true
                    $myObject.MFAstatus = "Enabled"
                }
            }
        }

        ##Collecting objects
        $myObject
    }
}