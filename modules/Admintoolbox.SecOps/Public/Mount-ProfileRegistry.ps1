<#
    .DESCRIPTION
    Loads any local users registry hive into the registry as a friendly name at HKU\userprofile.

    .PARAMETER userprofile
    Specify the user profile folder located at $env:systemdrive\users. The profile parameter should specify the folder name and not necessarily the username.

    .EXAMPLE
    Mount-ProfileRegistry -Profile johns

    Loads the user profile folder located at $env:systemdrive\users\johns. The profile parameter should specify the folder name and not necessarily the username.

    .NOTES
    Use Dismount-ProfileRegistry when done to unmount the user hive.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Mount-ProfileRegistry {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$userprofile
    )

    #Mount registry key for user
    reg.exe load HKU\$userprofile $userprofile\ntuser.dat
}