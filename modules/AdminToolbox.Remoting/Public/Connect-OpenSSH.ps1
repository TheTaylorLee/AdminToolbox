<#
    .DESCRIPTION
    Use this function to connect to an SSH Session

    .Parameter User
    User Account used for SSH Authentication

    .Parameter Server
    SSH Server that is being connected to.

    .EXAMPLE
    Connect-SSH -User "domain\username" -server "Hostname"

    Connect using a domain account and DNS Name

    .EXAMPLE
    Connect-SSH -User "username" -server "192.168.0.1"

    Connect using a local account and ipv4

    .NOTES
    Requires the OpenSSH client feature be installed locally and SSH enabled on the server \
    https://github.com/PowerShell/Win32-OpenSSH

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Connect-OpenSSH {

    [CmdletBinding()]
    [Alias('Connect-SSH')]
    Param (
        [Parameter(Mandatory = $true)]$User,
        [Parameter(Mandatory = $true)]$Server
    )

    ssh.exe $user@$server
}