<#
    .DESCRIPTION
    Used to secure Exchange Online Authentication by applying authentication policies

    Use of Modern Authentication Only is important for securing against Password Spray Attacks. New attacks on Basic authentication allow for taking control of an Exchange Online account by simply sending a malicious link to a target.

    .Parameter ApplyAllModern
    Apply Modern Auth Policy to all

    .Parameter ApplyAllBasic
    Apply Basic Auth Policy to all

    .Parameter ApplyPolicySingle
    Apply a specified policy to a single account

    .Parameter DisplayNameLike
    Full or partial displayname of account a policy is to be applied to

    .Parameter Policy
    Specify a policy for the Null or Single account Parameter Sets

    .Parameter ApplyToNull
    Apply policy to accounts with a null policy

    .EXAMPLE
    Set-AuthPolicy -ApplyAllModern

    Apply "Modern Auth Only" To all Exchange Online Mailboxes

    .EXAMPLE
    Set-AuthPolicy -ApplyPolicySingle -DisplayNameLike "John Smith" -Policy "Modern Auth Only"

    Apply "Modern Auth Only" Policy to a single Mailbox or multiple that have a Display Name Like "John Smith".

    .EXAMPLE
    Set-AuthPolicy -ApplytoNull -Policy "Modern Auth Only"

    Apply "Modern Auth Only" Policy to all mailboxes with a $null policy

    .NOTES
    Requires the Exchange Online module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-AuthPolicy {

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $True, ParameterSetName = 'Apply All Modern')]
        [switch]$ApplyAllModern,
        [Parameter(Mandatory = $True, ParameterSetName = 'Apply All Basic')]
        [switch]$ApplyAllBasic,
        [Parameter(Mandatory = $True, ParameterSetName = 'Apply Policy Single Account')]
        [switch]$ApplyPolicySingle,
        [Parameter(Mandatory = $True, ParameterSetName = 'Apply Policy Single Account')]
        $DisplayNameLike,
        [Parameter(Mandatory = $True, ParameterSetName = 'Apply Policy Single Account')]
        [Parameter(Mandatory = $True, ParameterSetName = 'Apply Policy for Null')]
        [ValidateSet ('Modern Auth Only', 'Basic Auth Allowed')]
        $Policy,
        [Parameter(Mandatory = $True, ParameterSetName = 'Apply Policy for Null')]
        [switch]$ApplyToNull
    )

    if ($ApplyAllModern) {
        #Apply Modern Authentication Policy
        $v1 = Get-User -ResultSize unlimited -Filter *
        $v2 = $v1.MicrosoftOnlineServicesID
        $v2 | ForEach-Object { Set-User -Identity $_ -AuthenticationPolicy "Modern Auth Only" } -Verbose

        #Apply Authentication Policy immediately
        $v2 | ForEach-Object { Set-User -Identity $_ -STSRefreshTokensValidFrom $([System.DateTime]::UtcNow) } -Verbose
    }

    if ($ApplyAllBasic) {
        #Apply Modern Authentication Policy
        $v1 = Get-User -ResultSize unlimited -Filter *
        $v2 = $v1.MicrosoftOnlineServicesID
        $v2 | ForEach-Object { Set-User -Identity $_ -AuthenticationPolicy "Basic Auth Only" } -Verbose

        #Apply Authentication Policy immediately
        $v2 | ForEach-Object { Set-User -Identity $_ -STSRefreshTokensValidFrom $([System.DateTime]::UtcNow) } -Verbose
    }

    if ($ApplyPolicySingle) {
        #Apply Policy to a single Account
        $v1 = Get-User -ResultSize unlimited -Filter "DisplayName -like '$DisplayNameLike*'"
        $v2 = $v1.MicrosoftOnlineServicesID
        $v2 | ForEach-Object { Set-User -Identity $_ -AuthenticationPolicy "$Policy" }

        #Apply Authentication Policy immediately
        $v2 | ForEach-Object { Set-User -Identity $_ -STSRefreshTokensValidFrom $([System.DateTime]::UtcNow) } -Verbose
    }

    if ($ApplyToNull) {
        #Apply Policy to accounts with No Policy
        $v1 = Get-Recipient -RecipientTypeDetails UserMailbox -ResultSize Unlimited | get-user | Where-Object { $null -eq $_.AuthenticationPolicy }
        $v2 = $v1.MicrosoftOnlineServicesID
        $v2 | ForEach-Object { Set-User -Identity $_ -AuthenticationPolicy "$Policy" }

        #Apply Authentication Policy immediately
        $v2 | ForEach-Object { Set-User -Identity $_ -STSRefreshTokensValidFrom $([System.DateTime]::UtcNow) } -Verbose
    }
}