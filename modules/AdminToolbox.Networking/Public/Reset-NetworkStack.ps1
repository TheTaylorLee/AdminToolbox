<#
    .DESCRIPTION
    Resets the TCP/IP and Winsock Stacks

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Reset-NetworkStack {

    [CmdletBinding()]
    param (
    )

    #Check For Admin Privleges
    Get-Elevation

    netsh.exe winsock reset
    netsh.exe int ip reset
    netsh.exe int ipv4 reset reset.log
    netsh.exe int ipv6 reset reset.log
    Write-Host "You need to restart the computer now"  -ForegroundColor yellow
}