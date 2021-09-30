<#
    .DESCRIPTION
    Loads any local users registry hive into the registry as a friendly name. Useful for modifying a users registry without the need of them being logged in locally.

    .PARAMETER SamAccountName
    SamAccountName of the domain account that you are mounting the local registry for.

    .PARAMETER DomainController
    Domain Controller that has Powershell Remoting enabled on it. For importing a session with the Active directory Module.

    .EXAMPLE
    DisMount-ProfileRegistry -SamAccountName JohnS

    DisMounts the Mounted ProfileRegistry

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function DisMount-ProfileRegistry {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$SamAccountName
    )

    #DisMount registry key for user
    reg.exe unload HKU\$SamAccountName
}