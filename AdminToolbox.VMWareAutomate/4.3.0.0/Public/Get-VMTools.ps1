Function Get-VMTools {

    <#
    .DESCRIPTION
    Get Virtual Machines that have outdated VMWare Tools or all Virtual Machine tools versions.

    .PARAMETER AllTools
    Specifies if VMTools Status should be retrieved for all VM's

    .PARAMETER OutDatedTools
    Specifies if VMTools Status should be retrieved for only outdated VM's

    .PARAMETER Unmanaged
    Specifies if VMTools Status should be retrieved for unmanaged VM's

    .EXAMPLE
    Get-VMTools

    .EXAMPLE
    Show tools versions for all VM's

    Get-VMTools -Alltools

    .EXAMPLE
    Only show VM's with Outdated Tools

    Get-VMTools -OutDatedTools

    .EXAMPLE
    Show VM's with Outdated Tools and include unmanaged tools

    Get-VMTools -OutDatedTools -Unmanaged

    .NOTES
    Requires the VMware.PowerCLI Module

    .Link
    Update-VMTools
    #>

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "AllTools")][Switch] $AllTools,
        [Parameter(Mandatory = $true, ParameterSetName = "OutDatedTools")][Switch] $OutDatedTools,
        [Parameter(Mandatory = $false, ParameterSetName = "OutDatedTools")][Switch] $Unmanaged
    )


    if ($AllTools) {
        Get-VM |
        ForEach-Object { Get-View $_.id } |
        Select-Object name, @{Name = 'ToolsVersion'; Expression = { $_.config.tools.toolsversion } }, @{Name = 'ToolStatus'; Expression = { $_.Guest.ToolsVersionStatus } } |
        Sort-Object Name
    }

    if ($OutDatedTools) {
        if ($Unmanaged) {
            Get-VM |
            ForEach-Object { Get-View $_.id } |
            Where-Object { $_.Guest.ToolsVersionStatus -like 'guestToolsNeedUpgrade' -or $_.Guest.ToolsVersionStatus -like 'guestToolsNotInstalled' } |
            Select-Object name, @{Name = 'ToolsVersion'; Expression = { $_.config.tools.toolsversion } }, @{Name = 'ToolStatus'; Expression = { $_.Guest.ToolsVersionStatus } } |
            Sort-Object Name
        }

        else {
            Get-VM |
            ForEach-Object { Get-View $_.id } |
            Where-Object { $_.Guest.ToolsVersionStatus -like 'guestToolsNeedUpgrade' } |
            Select-Object name, @{Name = 'ToolsVersion'; Expression = { $_.config.tools.toolsversion } }, @{Name = 'ToolStatus'; Expression = { $_.Guest.ToolsVersionStatus } } |
            Sort-Object Name
        }
    }
}