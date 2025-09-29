<#
    .DESCRIPTION
    Opens the Windows hosts file in Notepad.

    .EXAMPLE
    Open-HostFile

    Opens c:/windows/System32/drivers/etc/hosts in Notepad. If launched from an elevated PowerShell session, Notepad will also run with elevated privileges, allowing you to save changes to the hosts file.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Open-HostsFile {
    [CmdletBinding()]
    [Alias('hostfile', 'hostsfile')]
    param()

    notepad c:/windows/System32/drivers/etc/hosts
}