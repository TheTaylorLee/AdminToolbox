<#
    .Description
    Enable Push Notifications for Fortitokenson a Public Interface

    .Parameter UnusedPort
    <1-65535> Specify a port not used on the WAN interface for the given WAN IP.

    .Parameter WanInterfaceName
    Specify the Name of the Wan Interface

    .Parameter WanIP
    WAN IP within the range of the chosen Wan Interface

    .Example
    $Params = @{
        UnusedPort        = "26357"
        WanInterfaceName  = "wan1"
        WanIP             = "1.1.1.1"
    }
    Enable-PushNotifications @params

    This example enables push notifications on wan1 using port 26357

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        UnusedPort        = "26357"
        WanInterfaceName  = "wan1"
        WanIP             = "1.1.1.1"
    }
    $command = Enable-PushNotifications @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        UnusedPort        = "26357"
        WanInterfaceName  = "wan1"
        WanIP             = "1.1.1.1"
    }
    $command = Enable-PushNotifications @params
    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    .Notes
    https://kb.fortinet.com/kb/documentLink.do?externalID=FD48702 \
    https://docs.fortinet.com/document/fortigate/6.2.0/cookbook/183204/ssl-vpn-with-fortitoken-mobile-push-authentication

    * There must be at least one administrator account with no trusted hosts configured:
    * The FortiGate checks trusted host settings before allowing incoming traffic.
    * This also applies to push notification responses.
    * If no administrator without trusted hosts exists, the push response is denied and fails
    * An administrator account with no privileges at all is sufficient to this end.

    * If the FortiGate with push notification enabled is behind a router/other firewall that performs NATing, then a virtual IP/port forwarding must be configured on that unit to allow responses to reach the FortiGate.
    * The FortiGate’s server-ip must be set to the same IP the edge firewall/router allows the inbound traffic on.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

Function Enable-PushNotifications {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]$UnusedPort,
        [Parameter(Mandatory = $True)]$WanInterfaceName,
        [Parameter(Mandatory = $True)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$WanIP
    )

    $pass = Read-Host "Provide a password for an unprivileged admin. This is required for Push Notifications to be enable. One admin account must not have 2fa enabled. (Password)"

    Write-Output "
config system accprofile
    edit no_access
        set system-diagnostics disable
    next
end

edit FTMAdmin
        set accprofile 'no_access'
        set comments 'For Fortitokens Do Not Disable!!!!!! The FortiGate checks trusted host settings before allowing incoming traffic. This also applies to push notification responses. If no administrator without trusted hosts exists, the push response is denied and fails.'
        set password ""$pass""
    next
end

config system ftm-push
    set server-ip $WanIP
    set server-port $UnusedPort
    set status enable
end

config system interface
    edit ""$WanInterfaceName""
        set allowaccess ftm
    next
end"
}