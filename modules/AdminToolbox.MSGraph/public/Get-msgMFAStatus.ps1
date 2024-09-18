<#
    .DESCRIPTION
    Get multifactor authentication status for Microsoft Azure accounts

    .PARAMETER type
    Filter the results by user type. Options are "all", "licensed", "unlicensed", "guests"

    .EXAMPLE
    Get-msgMFAStatus | export-csv .\nacc-mfastatus.csv -notypeinformation

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-msgMFAStatus {

    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, Mandatory = $false)]
        [ValidateSet("all", "licensed", "unlicensed", "guests")]
        [string]$type = "all"
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes "User.Read.All", “UserAuthenticationMethod.Read.All” | Out-Null


    switch ($type) {
        "all" {
            $users = Get-MgUser -All
        }
        "licensed" {
            $users = Get-MgUser -Filter 'assignedLicenses/$count ne 0' -All
        }
        "unlicensed" {
            $users = Get-MgUser -Filter 'assignedLicenses/$count eq 0' -All
        }
        "guests" {
            $users = Get-MgUser -Filter "userType eq 'Guest'" -All
        }
        default {
            $users = Get-MgUser -All
        }
    }

    #loop through each user account
    foreach ($user in $users) {

        $myObject = [PSCustomObject]@{
            user                                          = $null
            MFAstatus                                     = $null
            email                                         = $null
            fido2                                         = $null
            MicrosoftAuthenticator                        = $null
            password                                      = $null
            Authenticatorpasswordless                     = $null
            phone                                         = $null
            softwareoath                                  = $null
            tempaccess                                    = $null
            hellobusiness                                 = $null
            AdditionalPropertiesemail                     = $null
            AdditionalPropertiesfido2                     = $null
            AdditionalPropertiesMicrosoftAuthenticator    = $null
            AdditionalPropertiespassword                  = $null
            AdditionalPropertiesAuthenticatorpasswordless = $null
            AdditionalPropertiesphone                     = $null
            AdditionalPropertiessoftwareoath              = $null
            AdditionalPropertiestempaccess                = $null
            AdditionalPropertieshellobusiness             = $null
        }

        $MFAData = Get-MgUserAuthenticationMethod -UserId $user.UserPrincipalName #-ErrorAction SilentlyContinue

        $myobject.user = $user.UserPrincipalName
        #check authentication methods for each user
        ForEach ($method in $MFAData) {

            Switch ($method.AdditionalProperties["@odata.type"]) {
                "#microsoft.graph.emailAuthenticationMethod" {
                    $myObject.email = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertiesemail = $MFAData.AdditionalProperties["emailAddress"]
                }
                "#microsoft.graph.fido2AuthenticationMethod" {
                    $myObject.fido2 = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertiesfido2 = $MFAData.AdditionalProperties["model"]
                }
                '#microsoft.graph.passwordlessMicrosoftAuthenticatorAuthenticationMethod' {
                    $myObject.Authenticatorpasswordless = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertiesAuthenticatorpasswordless = $MFAData.AdditionalProperties["displayName"]
                }
                "#microsoft.graph.microsoftAuthenticatorAuthenticationMethod" {
                    $myObject.MicrosoftAuthenticator = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertiesMicrosoftAuthenticator = $MFAData.AdditionalProperties["displayName"]
                }
                "#microsoft.graph.passwordAuthenticationMethod" {
                    $myObject.password = $true
                    # When only the password is set, then MFA is disabled.
                    if ($myObject.MFAstatus -ne "Enabled") {
                        $myObject.MFAstatus = "Disabled"
                    }
                    $myObject.AdditionalPropertiespassword = $MFAData.AdditionalProperties["displayName"]
                }
                "#microsoft.graph.phoneAuthenticationMethod" {
                    $myObject.phone = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertiesphone = $MFAData.AdditionalProperties["phoneType", "phoneNumber"] -join ' '
                }
                "#microsoft.graph.softwareOathAuthenticationMethod" {
                    $myObject.softwareoath = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertiessoftwareoath = $MFAData.AdditionalProperties["displayName"]
                }
                "#microsoft.graph.temporaryAccessPassAuthenticationMethod" {
                    $myObject.tempaccess = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertiestempaccess = 'TapLifetime:' + $MFAData.AdditionalProperties["lifetimeInMinutes"] + 'm - Status:' + $MFAData.AdditionalProperties["methodUsabilityReason"]
                }
                "#microsoft.graph.windowsHelloForBusinessAuthenticationMethod" {
                    $myObject.hellobusiness = $true
                    $myObject.MFAstatus = "Enabled"
                    $myObject.AdditionalPropertieshellobusiness = $MFAData.AdditionalProperties["displayName"]
                }
            }
        }

        ##Collecting objects
        $myObject
    }
}