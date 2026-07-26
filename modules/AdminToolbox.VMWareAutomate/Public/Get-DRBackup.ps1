<#
    .DESCRIPTION
    The purpose of this function is to provide records that would simplify bringing back up a large vcenter array in a recovery scenario.

    Get's Hosts, VM's, and details about them.

    .PARAMETER OutPath
    Path to save the output

    .PARAMETER VCenter
    Vcenter Server Host and VM data is pulled from

    .EXAMPLE
    Get-DRRecords -OutPath c:\drbackup -Vcenter vcentername

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-DRBackup {

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $true)]$OutPath,
        [Parameter(Mandatory = $true)]$VCenter
    )

    #Remove backslash from outpath variable to avoid outpath errors
    $Outpath = $Outpath.trimend("\")
    #Path Variables
    $date = Get-Date -Format m
    $datepath = "$OutPath\$date DRBackup.xlsx"

    #connect vcenter
    Connect-VIServer -Server $VCenter

    #Get's vm list
    Get-VM * |
    Select-Object name, vmhost, @{N = "IP Address"; E = { @($_.guest.IPAddress -join '|') } }, NumCpu, CoresPerSocket, MemoryGB, Version, HardwareVersion, Notes |
    Export-Excel -WorksheetName "Virtual Machines" -Path "$datepath" -FreezeTopRow -TableName "Virtual Machines" -AutoSize

    #Get vmhosts
    Get-VMHost |
    Select-Object Name, @{n = "ManagementIP"; e = { Get-VMHostNetworkAdapter -VMHost $_ -VMKernel | Where-Object { $_.ManagementTrafficEnabled } | ForEach-Object { $_.Ip } } }, NumCpu, MemoryTotalGB, ProcessorType, LicenseKey, Version, Build |
    Export-Excel -WorksheetName "VM Hosts" -Path "$datepath" -FreezeTopRow -TableName "VMHosts" -AutoSize

    #Confirm the Function was successful by viewing the files have size to them
    Set-Location $OutPath
    Get-ChildItem | Sort-Object name -Descending | Format-Table
}