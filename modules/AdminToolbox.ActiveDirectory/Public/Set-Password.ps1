<#
    .DESCRIPTION
    Sets a Active Directory Password and provides an option to require a password change on login

    .NOTES
    Requires the Active Directory Module

    .PARAMETER Username
    Username of account for having a password specified

    .PARAMETER Password
    Password that is being set for the account

    .EXAMPLE
    Set-Password -username domain\username

    Specifies the username being set and then prompts for a password.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-Password {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { if ($_ -notlike "*\*") { throw "Username must be in the following format Domain\Username" } else { $true } })]
        $Username,
        [Parameter(Mandatory = $true)][SecureString]$Password
    )

    Import-Module ActiveDirectory

    Set-ADAccountPassword -Identity $username -Reset -NewPassword $Password

    $Prompt = Read-Host "Require a Password Change? Type Yes or No."

    if ($Prompt -eq 'Yes') {
        Set-ADUser -Identity $Username -ChangePasswordAtLogon $true
    }
    else {
        Write-Host "You specified no" -ForegroundColor Yellow
    }
}