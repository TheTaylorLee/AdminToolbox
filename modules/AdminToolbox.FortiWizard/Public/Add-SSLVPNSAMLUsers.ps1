<#
    .Description
    This functions adds users to the SAML Enterprise APP and Security group based on your selection from Out-Gridview -passthru. Uses the get-mguser filter options to limit the number of queried accounts, then presents a selection grid for selecting returned results, and finally adds the selected users to the Enterprise App and Security Group.

    .PARAMETER filter
    Add any filter accepted by the get-mguser function of the Microsoft.Graph.Users module.

    FILTER EXAMPLES:
    Get All
     *
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
    Add-SSLVPNSAMLUsers -filter "assignedLicenses/`$count ne 0 and userType eq 'Member'"

    .Notes
    If you are using this function, then you must have already setup the APP Registration and User Groups for FortiClient SAML Authentication. If that is not the case, check out these links to understand what is required to do so. After that point this and related functions are useful for adding new users to be permitted to login to the SSLVPN.

    https://yura.stryi.com/en/2021-03-05/fortigate-ssl-vpn-azure-mfa/
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/AdminToolbox.FortiWizard/SupportDocs

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

function Add-SSLVPNSAMLUsers {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string]$filter
    )

    # Test that required modules are install, install if not, and then connect to them.
    Test-SAMLFunctionRequirements -Scopes "Directory.ReadWrite.All", "User.Read.All", “UserAuthenticationMethod.Read.All”, "GroupMember.ReadWrite.All", "AppRoleAssignment.ReadWrite.All", "Application.ReadWrite.All"

    #SHARED VARIABLES
    ##Get user list with mfa properties for selection to add to the Enterprise App and Security Group
    ##Get all Azure users
    Write-Warning "Getting users from entra ID can take awhile depending on the filter used. Be prepared to wait for the next step."
    $users = get-mguser -filter $filter -All -ConsistencyLevel eventual -CountVariable Records
    $usermfastatus = foreach ($user in $users) {

        $myObject = [PSCustomObject]@{
            user                      = $null
            id                        = $null
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
        $myobject.id = $user.Id
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
    $updateuseraccess = $usermfastatus | Out-GridView -PassThru -Title 'Select the users that are to be added for SSLVPN login'

    #ASSIGN USERS TO THE ENTERPRISE APP.
    ##Get the service principal for the app you want to assign the user to
    $servicePrincipal = Get-MgServicePrincipal -All
    $servicePrincipal = $servicePrincipal | Out-GridView -PassThru -Title "Select the Enterprise Application"

    ##Get all users that are already assigned to the application
    $existingUserEnterpriseApp = Get-MgServicePrincipalAppRoleAssignedTo -ServicePrincipalId $servicePrincipal.Id |
        Select-Object -ExpandProperty PrincipalId

    ##Compare lists
    $newUsersEnterpriseApp = $updateuseraccess |
        Where-Object { $_.Id -notin $existingUserEnterpriseApp }

    ##Assign Rights
    ForEach ($user in $newUsersEnterpriseApp) {
        Try {
            New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $servicePrincipal.Id -PrincipalId $user.Id -ResourceId $servicePrincipal.Id -AppRoleId $servicePrincipal.AppRoles[0].Id -ErrorAction Stop | Out-Null
            [PSCustomObject]@{
                UserPrincipalName   = $user.User
                ApplicationAssigned = $true
            }
        }
        catch {
            [PSCustomObject]@{
                UserPrincipalName   = $user.User
                ApplicationAssigned = $false
            }
        }
    }

    #ASSIGN LICENSED USERS TO AZURE AD USER GROUP
    ##Get the Azure AD group you wish to assign the user to
    $AZADGroup = Get-MgGroup -All | Select-Object Id, DisplayName, Description | Out-GridView -PassThru -Title "Select the Permitted user group"

    ##Get all users that are already assigned to the group
    $existingUsersAZSecurityGroup = Get-MgGroupMember -GroupId $AZADGroup.Id -All | Select-Object -ExpandProperty Id

    ##Compare lists
    $newUsersAZSecurityGroup = $updateuseraccess |
        Where-Object { $_.Id -notin $existingUsersAZSecurityGroup }

    ##Assign Rights
    ForEach ($user in $newUsersAZSecurityGroup) {
        Try {
            New-MgGroupMember -GroupId $AZADGroup.Id -DirectoryObjectId $user.Id -ErrorAction Stop
        }
        catch {
            $_
        }
    }
}