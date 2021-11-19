<#
    .DESCRIPTION
    This function will Enable and Enforce per user MFA in Azure and Office 365

    .NOTES
    ***https://docs.microsoft.com/en-us/azure/active-directory/roles/permissions-reference#authentication-administrator
    One of the following roles are required
    Role	                                  | Manage user's auth methods	         | Manage per-user MFA	           | Manage MFA settings | Manage auth method policy | Manage password protection policy
    Authentication Administrator             | Yes for some users (see above)       | Yes for some users (see above)  |	No	                |  No	                    | No
    Privileged Authentication Administrator	| Yes for all users	                   | Yes for all users               |No	               | No	                       | No
    Authentication Policy Administrator    | No                                   |	No                              | Yes                 | Yes	                      | Yes

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-PerUserMFAEnforced {

    [CmdletBinding()]
    Param (
    )

    $upns = get-msoluser | Out-GridView -PassThru -Title "Select the users who you are Enforcing MFA for."

    $mf = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
    $mf.RelyingParty = "*"
    $mf.State = "Enforced"
    $mfa = @($mf)

    foreach ($upn in $upns) {
        Set-MsolUser -UserPrincipalName $upn.UserPrincipalName -StrongAuthenticationRequirements $mfa
    }
}
