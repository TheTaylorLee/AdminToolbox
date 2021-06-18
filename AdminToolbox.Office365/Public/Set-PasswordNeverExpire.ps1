Function Set-PasswordNeverExpire {
    <#
    .DESCRIPTION
    Set a office 365 account password to never expire.

    .PARAMETER user
    Specify a user id or UPN

    .EXAMPLE
    Set-PasswordNeverExpire -user joe.smith@company.com

    .NOTES
    Requires the AzureAD module be installed, imported, and Connected.

    .LINK
    Set-AzureADUser
    Get-AzureADUser
    #>

    [Cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true)][String]$user
    )

    Set-AzureADUser -ObjectId $user -PasswordPolicies DisablePasswordExpiration

}