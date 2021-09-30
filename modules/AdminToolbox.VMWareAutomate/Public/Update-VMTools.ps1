<#
    .DESCRIPTION
    Filter out 2003 servers and upgrade VMwaretools on all servers that are not up to date. Does not reboot the VM's.

    .PARAMETER Unmanaged
    Specifies if vmtools should be installd on VM's that don't have them installed.

    .EXAMPLE
    Update-VMTools

    Upgrades only tools that are installed an require it. Specify a path for a log file.

    .EXAMPLE
    Update-VMTools -Unmanaged

    Include unmanaged VM's

    .NOTES
    Requires the VMware.PowerCLI Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Update-VMTools {

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $false)][switch]$Unmanaged
    )

    #Set Error Action to ignore errors
    $ErrorActionPreference = 'SilentlyContinue'

    #Filter Out 2003 Servers
    $No2003VMs = Get-VM | Where-Object { $_.Guest -notlike '*2003*' }

    #Disclaimer
    Write-Host "Some VMs will fail to upgrade. Use Get-VMTools to see which VM's fail" -ForegroundColor Yellow
    Write-Host " "

    if ($Unmanaged) {
        #Get VM's that require tools upgrades
        $OutofDateVMs = Get-VM $No2003VMs |
        ForEach-Object { Get-View $_.id } |
        Where-Object { $_.Guest.ToolsVersionStatus -like 'guestToolsNeedUpgrade' -or $_.Guest.ToolsVersionStatus -like 'guestToolsNotInstalled' } |
        Select-Object name, @{Name = 'ToolsVersion'; Expression = { $_.config.tools.toolsversion } }, @{Name = 'ToolStatus'; Expression = { $_.Guest.ToolsVersionStatus } }

        #Update Tools with no Reboot
        ForEach ($VM in $OutOfDateVMs) {
            Write-Host "Upgrading VMWareTools On: " -ForegroundColor Yellow -NoNewline
            Write-Host $VM.name -ForegroundColor Cyan
            Update-Tools -NoReboot -VM $VM.Name
        }
    }

    else {
        #Get VM's that require tools upgrades and filter unmanaged VM's
        $OutofDateVMs = Get-VM $No2003VMs |
        ForEach-Object { Get-View $_.id } |
        Where-Object { $_.Guest.ToolsVersionStatus -like 'guestToolsNeedUpgrade' } |
        Select-Object name, @{Name = 'ToolsVersion'; Expression = { $_.config.tools.toolsversion } }, @{Name = 'ToolStatus'; Expression = { $_.Guest.ToolsVersionStatus } }

        #Update Tools with no Reboot
        ForEach ($VM in $OutOfDateVMs) {
            Write-Host "Upgrading VMWareTools On: " -ForegroundColor Yellow -NoNewline
            Write-Host $VM.name -ForegroundColor Cyan
            Update-Tools -NoReboot -VM $VM.Name
        }
    }

}