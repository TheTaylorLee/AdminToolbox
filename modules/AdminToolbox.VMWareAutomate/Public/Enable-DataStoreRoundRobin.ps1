<#
    .DESCRIPTION
    Get's all datastores in vcenter and enables Datastore Round Robin on them

    .EXAMPLE
    Enable-DataStoreRoundRobin

    .NOTES
    Must have the VMWARE.PowerCLI module loaded

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Enable-DataStoreRoundRobin {

    Get-VMHost |
    Get-ScsiLun -LunType disk |
    Where-Object { $_.MultipathPolicy -notlike "RoundRobin" } |
    Set-ScsiLun -MultiPathPolicy RoundRobin
}