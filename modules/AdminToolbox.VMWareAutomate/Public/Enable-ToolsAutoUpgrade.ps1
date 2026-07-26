<#
    .DESCRIPTION
    Filter out 2003 servers and servers that don't have Vmware Tools installed.

    All remaining servers will have their tools set to upgrade automatically.

    .PARAMETER Unmanaged
    Specifies VM's without tools installed that should have AutoUpgrade enabled.

    .EXAMPLE
    Enable-ToolsAutoUpgrade

    .EXAMPLE
    Enable-ToolsAutoUpgrade -Unmanaged

    Include VM's Without Guest Tools Installed

    .NOTES
    Requires the VMware.PowerCLI Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Enable-ToolsAutoUpgrade {

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $false)][switch]$Unmanaged
    )

    #Set Error Action to ignore error for Null value VM's
    $ErrorActionPreference = 'SilentlyContinue'

    #Disclaimer
    Write-Host "Servers with a null value for UpgradeAtPowercycle Will be skipped." -ForegroundColor Yellow
    Write-Host "2003 Servers will be Skipped for Compatibility issues" -ForegroundColor Yellow
    Write-Host " "

    #Filter Out 2003 Servers
    $No2003VMs = Get-VM | Where-Object { $_.Guest -notlike '*2003*' }

    if ($Unmanaged) {
        #Filter for Tools that have Auto Tool upgrade set to Manual
        $ManualUpdateVMs = Get-VM $No2003VMs.name |
        Get-View |
        Where-Object { $_.Config.Tools.ToolsUpgradePolicy -like "manual" } |
        Select-Object name, @{N = 'ToolsUpgradePolicy'; E = { $_.Config.Tools.ToolsUpgradePolicy } }

        #Set Tools to upgrade at Power Cycle
        Foreach ($VM in ($ManualUpdateVMs)) {
            Write-Host "Configuring UpgradeAtPowerCycle on: " -ForegroundColor Yellow -NoNewline
            Write-Host $VM.name -ForegroundColor Cyan
            $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $vmConfigSpec.Tools = New-Object VMware.Vim.ToolsConfigInfo
            $vmConfigSpec.Tools.ToolsUpgradePolicy = "UpgradeAtPowerCycle"
            $VMConfig.ReconfigVM($vmConfigSpec)
        }
    }

    else {
        #Get VM's that have tools installed
        $VMsForAutoUpgrade = Get-VM $No2003VMs |
        ForEach-Object { Get-View $_.id } |
        Where-Object { $_.Guest.ToolsVersionStatus -notlike "guestToolsNotInstalled" -or $_.Guest.ToolsVersionStatus -notlike "guestToolsUnmanaged" } |
        Select-Object name, @{Name = 'ToolsVersion'; Expression = { $_.config.tools.toolsversion } }, @{Name = 'ToolStatus'; Expression = { $_.Guest.ToolsVersionStatus } }

        #Filter for Tools that have Auto Tool upgrade set to Manual
        $ManualUpdateVMs = Get-VM $VMsForAutoUpgrade.name |
        Get-View |
        Where-Object { $_.Config.Tools.ToolsUpgradePolicy -like "manual" } |
        Select-Object name, @{N = 'ToolsUpgradePolicy'; E = { $_.Config.Tools.ToolsUpgradePolicy } }

        #Set Tools to upgrade at Power Cycle
        Foreach ($VM in ($ManualUpdateVMs)) {
            Write-Host "Configuring UpgradeAtPowerCycle on: " -ForegroundColor Yellow -NoNewline
            Write-Host $VM.name -ForegroundColor Cyan
            $vmConfigSpec = New-Object VMware.Vim.VirtualMachineConfigSpec
            $vmConfigSpec.Tools = New-Object VMware.Vim.ToolsConfigInfo
            $vmConfigSpec.Tools.ToolsUpgradePolicy = "UpgradeAtPowerCycle"
            $VMConfig.ReconfigVM($vmConfigSpec)
        }
    }
}