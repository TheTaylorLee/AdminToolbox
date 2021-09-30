<#
    .DESCRIPTION
    Modify Hotadd settings for a single or all VM's

    .PARAMETER DisableMem
    Specify disabling Memory Hotadd

    .PARAMETER DisableCPU
    Specify disabling CPU Hotadd

    .PARAMETER EnableMem

    Specify enabling Memory Hotadd

    .PARAMETER EnableCPU
    Specify enabling CPU Hotadd

    .PARAMETER VMName
    Specify a specific VM to change HotAdd settings for

    .EXAMPLE
    Invoke-HotAdd -DisableMem

    Disable Memory HotAdd on all VM's

    .EXAMPLE
    Invoke-HotAdd -DisableMem -VMName ExchangeServer

    Disable Memory HotAdd on a single vm

    .NOTES
    Requires the VMware.PowerCLI Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Invoke-HotAdd {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Disable Mem Hotadd')][switch]$DisableMem,
        [Parameter(Mandatory = $true, ParameterSetName = 'Disable CPU Hotadd')][switch]$DisableCPU,
        [Parameter(Mandatory = $true, ParameterSetName = 'Enable Mem Hotadd')][switch]$EnableMem,
        [Parameter(Mandatory = $true, ParameterSetName = 'Enable CPU Hotadd')][switch]$EnableCpu,
        [Parameter(Mandatory = $false, ParameterSetName = 'Disable Mem Hotadd')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Disable CPU Hotadd')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Enable Mem Hotadd')]
        [Parameter(Mandatory = $false, ParameterSetName = 'Enable CPU Hotadd')]
        $VMName
    )

    if ($DisableMem) {
        if ($VMName) {
            Write-Host "Configuring $VMName" -ForegroundColor Yellow
            $vmview = Get-VM $VMName | Get-View
            $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $extra = New-Object VMware.Vim.optionvalue
            $extra.Key = "mem.hotadd"
            $extra.Value = "false"
            $vmConfigSpec.extraconfig += $extra
            $vmview.ReconfigVM($vmConfigSpec)
        }

        else {
            $vms = Get-VM | Get-View

            foreach ($vm in $vms) {
                Write-Host "Configuring hotadd on: " -ForegroundColor Yellow -NoNewline
                Write-Host $vm.name -ForegroundColor Cyan

                $vmview = Get-VM $vm.name | Get-View
                $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
                $extra = New-Object VMware.Vim.optionvalue
                $extra.Key = "mem.hotadd"
                $extra.Value = "false"
                $vmConfigSpec.extraconfig += $extra
                $vmview.ReconfigVM($vmConfigSpec)
            }
        }
    }

    if ($DisableCPU) {
        if ($VMName) {
            Write-Host "Configuring $VMName" -ForegroundColor Yellow
            $vmview = Get-VM $VMName | Get-View
            $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $extra = New-Object VMware.Vim.optionvalue
            $extra.Key = "vcpu.hotadd"
            $extra.Value = "false"
            $vmConfigSpec.extraconfig += $extra
            $vmview.ReconfigVM($vmConfigSpec)
        }

        else {
            $vms = Get-VM | Get-View

            foreach ($vm in $vms) {
                Write-Host "Configuring hotadd on: " -ForegroundColor Yellow -NoNewline
                Write-Host $vm.name -ForegroundColor Cyan

                $vmview = Get-VM $vm.name | Get-View
                $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
                $extra = New-Object VMware.Vim.optionvalue
                $extra.Key = "vcpu.hotadd"
                $extra.Value = "false"
                $vmConfigSpec.extraconfig += $extra
                $vmview.ReconfigVM($vmConfigSpec)
            }
        }
    }

    if ($EnableMem) {
        if ($VMName) {
            Write-Host "Configuring $VMName" -ForegroundColor Yellow
            $vmview = Get-VM $VMName | Get-View
            $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $extra = New-Object VMware.Vim.optionvalue
            $extra.Key = "mem.hotadd"
            $extra.Value = "true"
            $vmConfigSpec.extraconfig += $extra
            $vmview.ReconfigVM($vmConfigSpec)
        }

        else {
            $vms = Get-VM | Get-View

            foreach ($vm in $vms) {
                Write-Host "Configuring hotadd on: " -ForegroundColor Yellow -NoNewline
                Write-Host $vm.name -ForegroundColor Cyan

                $vmview = Get-VM $vm.name | Get-View
                $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
                $extra = New-Object VMware.Vim.optionvalue
                $extra.Key = "mem.hotadd"
                $extra.Value = "true"
                $vmConfigSpec.extraconfig += $extra
                $vmview.ReconfigVM($vmConfigSpec)
            }
        }
    }

    if ($EnableCpu) {
        Write-Host "Enabling CPU Hotadd will disable vNUMA and effect VM Performance" -ForegroundColor Yellow
        $prompt = Read-Host "Do you wish to continue? (yes/no)"

        if ($prompt -eq 'yes') {
            if ($VMName) {
                Write-Host "Configuring $VMName" -ForegroundColor Yellow
                $vmview = Get-VM $VMName | Get-View
                $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
                $extra = New-Object VMware.Vim.optionvalue
                $extra.Key = "vcpu.hotadd"
                $extra.Value = "true"
                $vmConfigSpec.extraconfig += $extra
                $vmview.ReconfigVM($vmConfigSpec)
            }

            else {
                $vms = Get-VM | Get-View

                foreach ($vm in $vms) {
                    Write-Host "Configuring hotadd on: " -ForegroundColor Yellow -NoNewline
                    Write-Host $vm.name -ForegroundColor Cyan

                    $vmview = Get-VM $vm.name | Get-View
                    $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
                    $extra = New-Object VMware.Vim.optionvalue
                    $extra.Key = "vcpu.hotadd"
                    $extra.Value = "true"
                    $vmConfigSpec.extraconfig += $extra
                    $vmview.ReconfigVM($vmConfigSpec)
                }
            }
        }

        else {
            Write-Host "Enable CPU Hotadd Canceled" -ForegroundColor Yellow
        }
    }
}