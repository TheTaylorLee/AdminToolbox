<#
    .DESCRIPTION
    Modify the powerstate of one or more VMs at once. This command can also be used to discover the statuses.

    .PARAMETER Force
    Used to force the shutdown of VMs. Not recommended unless you are aware of the risks involved.

    .PARAMETER Restart
    Specifies Restarting the VM or VMs

    .PARAMETER Shutdown
    Specifies Shutting Down the VM or VMs

    .PARAMETER Start
    Specifies Starting the VM or VMs

    .PARAMETER Status
    Specifies showing the status of the VM or VMs

    .EXAMPLE
    Invoke-Powerstate -Shutdown -Force

    Specifies the selected VM's will be shutdown forcefully

    .EXAMPLE
    Invoke-Powerstate -Restart

    Specifies the selected VM's will be restarted

    .EXAMPLE
    Invoke-Powerstate -Start

    Specifies the selected VM's will be Started

    .EXAMPLE
    Invoke-Powerstate -status

    Specifies the discover of VM statuses

    .NOTES
    Requires the AZ module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Invoke-PowerState {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false, ParameterSetName = 'Shutdown')]
        [switch]$Force,
        [Parameter(Mandatory = $True, ParameterSetName = 'Restart')]
        [switch]$Restart,
        [Parameter(Mandatory = $True, ParameterSetName = 'Shutdown')]
        [switch]$Shutdown,
        [Parameter(Mandatory = $True, ParameterSetName = 'Start')]
        [switch]$Start,
        [Parameter(Mandatory = $True, ParameterSetName = 'Status')]
        [switch]$Status
    )

    #Set the subscription - Set-AzContext
    Write-Host "Select the subscription containing the VM's" -ForegroundColor Green
    Set-Subscription

    #Set the Resourcegroup name being worked in
    Write-Host "Select the Resource Group containing the VM's" -ForegroundColor Green
    $RG = Get-AzResourceGroup | Out-GridView -PassThru -Title 'Select the resource group containing the VMs'
    Write-Host "Resource group set to $RG"

    #Invoke specified power state
    if ($Shutdown) {
        #Select VM's having their power state changed
        Write-Host "Select the VM's that are having their power state changed" -ForegroundColor Green
        $VMs = Get-AzVM -Status -ResourceGroupName $RG.ResourceGroupName | Out-GridView -PassThru -Title 'Select the VM or VMs that will have their power state changed'

        if ($Force) {
            #Forcefully shutdown the VMs
            $VMs | Stop-AzVM -ResourceGroupName $RG.ResourceGroupName -Force -NoWait
        }
        else {
            #Shutdown the VMs
            $VMs | Stop-AzVM -ResourceGroupName $RG.ResourceGroupName -NoWait
        }
    }

    if ($Start) {
        #Select VM's having their power state changed
        Write-Host "Select the VM's that are having their power state changed" -ForegroundColor Green
        $VMs = Get-AzVM -Status -ResourceGroupName $RG.ResourceGroupName | Out-GridView -PassThru -Title 'Select the VM or VMs that will have their power state changed'

        #Start the VMs
        $VMs | Start-AzVM -ResourceGroupName $RG.ResourceGroupName -NoWait
    }

    if ($Status) {
        Get-AzVM -Status -ResourceGroupName $RG.ResourceGroupName | Select-Object Name, Powerstate | Out-GridView
    }

    if ($restart) {
        #Select VM's having their power state changed
        Write-Host "Select the VM's that are having their power state changed" -ForegroundColor Green
        $VMs = Get-AzVM -Status -ResourceGroupName $RG.ResourceGroupName | Out-GridView -PassThru -Title 'Select the VM or VMs that will have their power state changed'

        #Restart the VMs
        $VMs | Restart-AzVM -ResourceGroupName $RG.ResourceGroupName -NoWait
    }
}