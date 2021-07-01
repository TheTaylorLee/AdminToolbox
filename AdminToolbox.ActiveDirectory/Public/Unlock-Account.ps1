function Unlock-Account {

    <#
    .DESCRIPTION
    Unlocks an Active Directory Account

    .PARAMETER username
    Username of account being unlocked

    .NOTES
    Requires the Active Directory Module.

    .Example
    Use Get-lockedAccounts to quickly obtain the identity to use in the command.

    Get-LockedAccounts
    Unlock-ADAccount -identity JohnD

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$Username
    )

    Import-Module ActiveDirectory

    Unlock-ADAccount -Identity $username

}