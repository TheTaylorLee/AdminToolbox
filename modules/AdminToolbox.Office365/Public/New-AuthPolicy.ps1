<#
    .DESCRIPTION
    Used to secure Exchange Online Authentication by creating authentication policies

    Use of Modern Authentication Only is important for securing against Password Spray Attacks. New attacks on Basic authentication allow for taking control of an Exchange Online account by simply sending a malicious link to a target.

    Authentication Policies that are created are named...
    "Modern Auth Only"
    "Basic Auth Allowed"

    .EXAMPLE
    Set-AuthPolicy -CreatePolicies

    Creates two Authentication Policies. One Basic and One Modern.

    .NOTES
    Requires the Exchange Online module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function New-AuthPolicy {

    [CmdletBinding()]
    Param (
    )

    #create Authentication Policies
    New-AuthenticationPolicy -Name "Modern Auth Only"
    New-AuthenticationPolicy -Name "Basic Auth Allowed"

    #Allow Basic Auth Policy Parameters
    $Params = @{
        AllowBasicAuthActiveSync           = $true
        AllowBasicAuthAutodiscover         = $true
        AllowBasicAuthImap                 = $true
        AllowBasicAuthMapi                 = $true
        AllowBasicAuthOfflineAddressBook   = $true
        AllowBasicAuthOutlookService       = $true
        AllowBasicAuthPop                  = $true
        AllowBasicAuthPowershell           = $true
        AllowBasicAuthReportingWebServices = $true
        AllowBasicAuthRpc                  = $true
        AllowBasicAuthSmtp                 = $true
        AllowBasicAuthWebServices          = $true
        Identity                           = "Basic Auth Allowed"
    }
    Set-AuthenticationPolicy @Params
}