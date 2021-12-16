#Required by functions
#New-P2PTunnel
#New-P2PTunnelNAT
#New-DialUPTunnelDynamic
#New-DialUPTunnelStatic

<#
    .Description
    Create a New Address Object

    .Parameter AddressName
    Specify a Unique name for the Address Object

    .Parameter CIDR
    Specify a CIDR address. ex: 192.168.0.0/24

    .Example
    $Params = @{
        AddressName   = "ComanyLan_192.168.0.1/26"
        CIDR          = "192.168.0.1/26"
    }
    New-AddressObject @params

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        AddressName   = "ComanyLan_192.168.0.1/26"
        CIDR          = "192.168.0.1/26"
    }
    $command = New-AddressObject @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        AddressName   = "ComanyLan_192.168.0.1/26"
        CIDR          = "192.168.0.1/26"
    }
    $command = New-AddressObject @params
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

Function New-AddressObject {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$AddressName,
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $CIDR
    )

    $calc = Invoke-PSipcalc $cidr
    $IPAddress = ($calc).IP
    $SubnetMask = ($calc).SubnetMask

    Write-Output "
config firewall address
    edit ""$AddressName""
        set subnet $IPAddress $SubnetMask
        set allow-routing enable
    next
end"
}