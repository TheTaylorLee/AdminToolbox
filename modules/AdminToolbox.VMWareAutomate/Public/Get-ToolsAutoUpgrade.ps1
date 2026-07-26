<#
    .DESCRIPTION
    Filter out 2003 servers and servers that don't have Vmware Tools installed.

    List those that have AutoUpgrade set to manual

    .PARAMETER Unmanaged
    Specifies if VM's that don't have tools installed should be reported

    .EXAMPLE
    Get-ToolsAutoUpgradeState

    .NOTES
    Requires the VMware.PowerCLI Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-ToolsAutoUpgradeState {

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $false)][switch]$Unmanaged
    )

    #Filter Out 2003 Servers
    $No2003VMs = Get-VM | Where-Object { $_.Guest -notlike '*2003*' }

    if ($Unmanaged) {
        #Filter for Tools that have Auto Tool upgrade set to Manual
        $ManualUpdateVMs = Get-VM $No2003VMs.name |
        Get-View |
        Where-Object { $_.Config.Tools.ToolsUpgradePolicy -like "manual" } |
        Select-Object name, @{N = 'ToolsUpgradePolicy'; E = { $_.Config.Tools.ToolsUpgradePolicy } }
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
    }

    $ManualUpdateVMs

}