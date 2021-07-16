Function New-AddressObject {
    <#
    .Description
    Create a New Address Object

    .Parameter AddressName
    Specify a Unique name for the Address Object

    .Parameter IPAddress
    Specify a IPAddress that will be ranged by the subnet mask

    .Parameter SubnetMask
    Specify a SubnetMask for the IPAddress

    .Example
    $Params = @{
        AddressName   = "ComanyLan_192.168.0.1/26"
        IPAddress     = "192.168.0.1"
        SubnetMask    = "255.255.255.192"
    }

    New-AddressObject @params

    .Example
    This example generates and SSH session and invokes the output of this function against that sessions.

    New-SSHSession -computername 192.168.0.1

    $Params = @{
        AddressName   = "ComanyLan_192.168.0.1/26"
        IPAddress     = "192.168.0.1"
        SubnetMask    = "255.255.255.192"
    }
    $command = New-AddressObject @params

    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    .Example
    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1

    $Params = @{
        AddressName   = "ComanyLan_192.168.0.1/26"
        IPAddress     = "192.168.0.1"
        SubnetMask    = "255.255.255.192"
    }
    $command = New-AddressObject @params

    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$AddressName,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$IPAddress,
        [Parameter(Mandatory = $true)][ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a subnet mask and not a prefix."
                }
            })]$SubnetMask
    )

    Write-Output "
#Create Addresses

config firewall address
    edit ""$AddressName""
        set subnet $IPAddress $SubnetMask
        set allow-routing enable
    next
end
"
}