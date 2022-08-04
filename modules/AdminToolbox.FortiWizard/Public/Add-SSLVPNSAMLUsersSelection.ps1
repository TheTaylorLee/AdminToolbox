<#
    .Description
    This functions adds users to the SAML Enterprise APP and Security group based on your selection from Out-Gridview -passthru.

    .Notes
    If you are using this function, then you must have already setup the APP Registration and User Groups for FortiClient SAML Authentication. If that is not the case, check out these links to understand what is required to do so. After that point this and related functions are useful for adding new users to be permitted to login to the SSLVPN.

    https://yura.stryi.com/en/2021-03-05/fortigate-ssl-vpn-azure-mfa/
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/AdminToolbox.FortiWizard/SupportDocs

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

function Add-SSLVPNSAMLUsersAzureDefaultSecurity {

    [CmdletBinding()]
    Param (
    )

    # Test that required modules are install, install if not, and then connect to them.
    Test-SAMLFunctionRequirements

    #SHARED VARIABLES
    ##Get all licensedUsers
    $MSOLUsers = Get-MsolUser -All | Where-Object { $_.IsLicensed -eq 'True' } | Out-GridView -PassThru -Title 'Select the users that are to be added for SSLVPN login'

    #ASSIGN LICENSED USERS TO THE ENTERPRISE APP.
    ##Get the service principal for the app you want to assign the user to
    $servicePrincipal = Get-AzureADServicePrincipal -All $true | Out-GridView -PassThru -Title "Select the Enterprise Application"

    ##Get all users that are already assigned to the application
    $existingUserEnterpriseApp = Get-AzureADServiceAppRoleAssignment -All $true -ObjectId $servicePrincipal.Objectid |
    Select-Object -ExpandProperty PrincipalId

    ##Compare lists
    $newUsersEnterpriseApp = $MSOLUsers |
    Where-Object { $_.ObjectId -notin $existingUserEnterpriseApp }

    ##Assign Rights
    ForEach ($user in $newUsersEnterpriseApp) {
        Try {
            New-AzureADUserAppRoleAssignment -ObjectId $user.ObjectId -PrincipalId $user.ObjectId -ResourceId $servicePrincipal.ObjectId -Id $servicePrincipal.Approles[0].id -ErrorAction Stop
            [PSCustomObject]@{
                UserPrincipalName    = $user.displayname
                AppliciationAssigned = $true
            }
        }
        catch {
            [PSCustomObject]@{
                UserPrincipalName    = $user.displayname
                AppliciationAssigned = $false
            }
        }
    }

    #ASSIGN LICENSED USERS TO AZURE AD USER GROUP
    ##Get the AzureAD group you wish to assign the user to
    $AZADGroup = Get-AzureADGroup -All $true | Select-Object ObjectID, DisplayName, Description | Out-GridView -PassThru -Title "Select the Permitted users group"

    ##Get all users that are already assigned to the group
    $existingUsersAZSecurityGroup = Get-AzureADGroupMember -ObjectId $AZADGroup.ObjectId

    ##Compare lists
    $newUsersAZSecurityGroup = $MSOLUsers |
    Where-Object { $_.ObjectId -notin $existingUsersAZSecurityGroup.ObjectID }

    ##Assign Rights
    ForEach ($user in $newUsersAZSecurityGroup) {
        Try {
            Add-AzureADGroupMember -ObjectId $AZADGroup.ObjectId -RefObjectId $user.ObjectId -ErrorAction Stop
            [PSCustomObject]@{
                UserPrincipalName = $user.displayname
                GroupAssigned     = $true
            }
        }
        catch {
            [PSCustomObject]@{
                UserPrincipalName = $user.displayname
                GroupAssigned     = $false
            }
        }
    }
}