function Invoke-Power {
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
    Gracefully Restart the Guest

    Invoke-Power -restartguest -VM vmname

    .EXAMPLE
    Gracefully shutdown the Guest

    Invoke-Power -poweroffguest -VM vmname

    .EXAMPLE
    Hard Power Cycle VM

    Invoke-Power -powercycle -VM vmname

    .EXAMPLE
    Hard Power Off Vm

    Invoke-Power -poweroff -VM vmname

    .EXAMPLE
    Hard power on VM

    Invoke-Power -poweron -VM vmname

    .NOTES
    Requires the VMware.PowerCLI Module
    #>

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