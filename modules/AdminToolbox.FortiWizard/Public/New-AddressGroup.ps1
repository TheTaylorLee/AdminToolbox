#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

<#
    .Description
    Create a New Address Object

    .Parameter AddressNames
    Specify AddressNames that are to be a member of this group. Space delimited and the full string wrapped in only one set of quotes.

    .Parameter GroupName
    The Name of the AddressGroup

    .Example
    $Params = @{
        AddressNames = "vlan10 vlan100 vlan 110 vlan200"
        GroupName    = "Internal_Vlans"
    }
    New-AddressGroup @params

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        AddressNames = "vlan10 vlan100 vlan 110 vlan200"
        GroupName    = "Internal_Vlans"
    }
    $command = New-AddressGroup @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        AddressNames = "vlan10 vlan100 vlan 110 vlan200"
        GroupName    = "Internal_Vlans"
    }
    $command = New-AddressGroup @params
    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

Function New-AddressGroup {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$GroupName,
        [Parameter(Mandatory = $true)]$AddressNames
    )

    Write-Output "
config firewall addrgrp
    edit ""$GroupName""
        set member $AddressNames
        set allow-routing enable
    next
end"
}