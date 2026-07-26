<#
    .DESCRIPTION
    This function adds a local admin to the computer or server it is run from.

    .PARAMETER User
    The user that is to be added as a local admin

    .NOTES
    Azure AD Joined machines will require the user to first login to a computer with their domain account before adding their domain account as a local admin. \
    The user logging in registers their SID so that the command is successful.

    .EXAMPLE
    Add-LocalAdmin -user domain\user

    Adds specified domain user to the local administrators group

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Add-LocalAdmin {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$user
    )

    #Check For Admin Privleges
    Get-Elevation

    net.exe Localgroup Administrators $user /add

}