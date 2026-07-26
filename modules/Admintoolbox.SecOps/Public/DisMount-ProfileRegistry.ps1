<#
    .DESCRIPTION
    Loads any local users registry hive into the registry as a friendly name. Useful for modifying a users registry without the need of them being logged in locally.

    .PARAMETER userprofile
    Specify the previouslymounted userprofile to unmount.

    .EXAMPLE
    DisMount-ProfileRegistry -userprofile johns

    DisMounts the Mounted ProfileRegistry

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function DisMount-ProfileRegistry {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$userprofile
    )

    #DisMount registry key for user
    reg.exe unload HKU\$userprofile
}