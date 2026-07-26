<#
    .Description
    Create New Address Objects

    .Parameter AddressName
    Specify a prefix for the Address Object/s. This will prefix the CIDR address as a name for the addresses.

    .Parameter CIDR
    Specify a CIDR address or addresses. ex: 192.168.0.0/24 or 192.168.0.0/24, 10.10.10.5/32

    .Example
    $Params = @{
        AddressName   = "ComanyLan"
        CIDR          = "192.168.0.1/26", "10.10.0.0/24"
    }
    New-AddressObject @params

    Create Multiple Address Objects.

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        AddressName   = "ComanyLan"
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
        AddressName   = "ComanyLan"
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
        [String[]]
        $CIDR
    )

    foreach ($sub in $Cidr) {
    $calc = Invoke-PSipcalc $sub
    $IPAddress = ($calc).IP
    $SubnetMask = ($calc).SubnetMask
    $name = $AddressName + "_" + $sub

    Write-Output "
config firewall address
    edit ""$name""
        set subnet $IPAddress $SubnetMask
        set allow-routing enable
    next
end"
    }
}