<#
    .DESCRIPTION
    Edit a file interactively from powershell. Requires that Windows subsystem for linux is already enabled.

    .Parameter filepath
    Path to the file to be edited.

    .EXAMPLE
    nano /mnt/c/windows/System32/drivers/etc/hosts

    Edit hosts file

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Use-WSLnano {

    [CmdletBinding()]
    [Alias('nano')]
    Param (
        [Parameter(Position = 0, Mandatory = $true)]$filepath
    )

    try {
        wsl.exe nano $filepath
    }
    catch {
        Write-Warning "If you do not have Windows Subsystem for Linux installed you must first handle that requirement. ex: wsl --install"
        $_
    }

}