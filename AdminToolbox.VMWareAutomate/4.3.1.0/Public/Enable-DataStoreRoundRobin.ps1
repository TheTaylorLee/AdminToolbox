Function Enable-DataStoreRoundRobin {
    <#
    .DESCRIPTION
    Get's all datastores in vcenter and enables Datastore Round Robin on them

    .EXAMPLE
    Enable-DataStoreRoundRobin

    .NOTES
    Must have the VMWARE.PowerCLI module loaded
    #>

    Get-VMHost |
    Get-ScsiLun -LunType disk |
    Where-Object { $_.MultipathPolicy -notlike "RoundRobin" } |
    Set-ScsiLun -MultiPathPolicy RoundRobin
}