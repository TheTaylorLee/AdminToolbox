#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

<#
    .Description
    Create a new ServiceGroup Object

    .Parameter ServiceGroupName
    Specify a Unique name for the ServiceGroup Object

    .Parameter Members
    Specify the ServiceGroup Members

    .Example
    $Params = @{
        ServiceGroupName   = "ExchangeServers"
        Members       = "Exchange01 Exchange02"
    }
    New-ServiceGroup @params

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        ServiceGroupName   = "ExchangeServers"
        Members       = "Exchange01 Exchange02"
    }
    $command = New-ServiceGroup @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        ServiceGroupName   = "ExchangeServers"
        Members       = "Exchange01 Exchange02"
    }
    $command = New-ServiceGroup @params
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

Function New-ServiceGroup {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$ServiceGroupName,
        [Parameter(Mandatory = $true)]$Members
    )

    Write-Output "
config firewall service group
    edit ""$ServiceGroupName""
        set member $Members
    next
end"
}