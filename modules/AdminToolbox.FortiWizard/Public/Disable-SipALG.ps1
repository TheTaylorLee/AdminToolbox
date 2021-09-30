<#
    .Description
    Creates a Fortigate Config Script for disabling SIP ALG

    .Parameter LessThanMajor6Minor2
    Specifies if the FortiOS version is lest than version 6.2. In this scenario a different set of commands are used

    .Example
    Disable-SipALG -LessThanMajor6Minor2

    Disables SIP ALG for Versions on FortiOS Versions prior to version 6.2

    .Example
    New-SSHSession -computername 192.168.0.1
    $command = Disable-SipALG -LessThanMajor6Minor2
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $command = Disable-SipALG -LessThanMajor6Minor2
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

Function Disable-SipALG {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)][switch]$LessThanMajor6Minor2
    )

    if ($LessThanMajor6Minor2) {
        Write-Output "
config system settings
    set sip-helper disable
    set sip-nat-trace disable
    set default-voip-alg-mode kernel-helper-based
end

config voip profile
    edit default
        config sip
            set status disable
            set rtp disable
        end
end

config system session-helper
    delete 13
end"
    }

    else {
        Write-Output "
config system settings
    set default-voip-alg-mode kernel-helper-based
    set sip-expectation disable
    set sip-nat-trace disable
end

config voip profile
    edit default
        config sip
            set rtp disable
        end
end

config system session-helper
    delete 13
end"
    }
}