<#
    .DESCRIPTION
    Use to alter VM Power states and reboot VM's.

    .PARAMETER PowerCycleVM
    Specifies the VM should be Power Cycled

    .PARAMETER RestartGuest
    Specifies the VM guest should be restarted

    .PARAMETER PowerOffGuest
    Specifies the VM guest should be Powered off

    .PARAMETER PowerOffVM
    Specifies the VM should be Powered off

    .PARAMETER PowerOnVM
    Specifies the VM should be Powered on

    .PARAMETER VM
    Specifies the VM Name

    .EXAMPLE
    Invoke-Power -restartguest -VM vmname

    Gracefully Restart the Guest

    .EXAMPLE
    Invoke-Power -poweroffguest -VM vmname

    Gracefully shutdown the Guest

    .EXAMPLE
    Invoke-Power -powercycle -VM vmname

    Hard Power Cycle VM

    .EXAMPLE
    Invoke-Power -poweroff -VM vmname

    Hard Power Off Vm

    .EXAMPLE
    Invoke-Power -poweron -VM vmname

    Hard power on VM

    .NOTES
    Requires the VMware.PowerCLI Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-Power {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Power Cycle VM')][switch]$powercyclevm,
        [Parameter(Mandatory = $true, ParameterSetName = 'Restart Guest')][switch]$restartguest,
        [Parameter(Mandatory = $true, ParameterSetName = 'Power Off Guest')][switch]$poweroffguest,
        [Parameter(Mandatory = $true, ParameterSetName = 'Power Off VM')][switch]$poweroffvm,
        [Parameter(Mandatory = $true, ParameterSetName = 'Power On VM')][switch]$poweronvm,
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Power Cycle VM')]
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Restart Guest')]
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Power Off Guest')]
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Power Off VM')]
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Power On VM')]
        $VM
    )

    if ($powercyclevm) {
        Restart-VM -VM $VM -RunAsync -Confirm:$true
    }

    if ($restartguest) {
        Restart-VMGuest -VM $VM -Confirm:$false
    }

    if ($poweroffguest) {
        Shutdown-VMGuest -VM $VM -Confirm:$false
    }

    if ($poweroffvm) {
        Stop-VM -VM $vm -RunAsync -Confirm:$true
    }

    if ($poweronvm) {
        Start-VM -VM $VM -RunAsync -Confirm:$false
    }
}