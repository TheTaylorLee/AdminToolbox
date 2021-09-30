<#
    .Description
    Configures trusted hosts that the admin account may connect from and enables management from the WAN interface. Don't forget to include your internal and management subnets if you still want to be able to manage the firewall from them!

    .Parameter AdminUsername
    Specify the admin username who management access is being enabled for

    .Parameter AllowAccess
    Specify the Administrative Access preferences that should be allowed. Should be provided in a space delimited string format. Options below
    ping              PING access.
    https             HTTPS access.
    ssh               SSH access.
    snmp              SNMP access.
    http              HTTP access.
    telnet            TELNET access.
    fgfm              FortiManager access.
    radius-acct       RADIUS accounting access.
    probe-response    Probe access.
    fabric            Security Fabric access.
    ftm               FTM access.

    .Parameter TrustedCIDR1
    Set the first Trusted CIDR address allowed to access the Fortigate. ex: 192.168.0.0/24

    .Parameter TrustedCIDR2
    Set the second Trusted CIDR address allowed to access the Fortigate. ex: 192.168.0.0/24

    .Parameter TrustedCIDR3
    Set the third Trusted CIDR address allowed to access the Fortigate. ex: 192.168.0.0/24

    .Parameter TrustedCIDR4
    Set the fourth Trusted CIDR address allowed to access the Fortigate. ex: 192.168.0.0/24

    .Parameter TrustedCIDR5
    Set the fifth Trusted CIDR address allowed to access the Fortigate. ex: 192.168.0.0/24

    .Parameter TrustedCIDR6
    Set the sixth Trusted CIDR address allowed to access the Fortigate. ex: 192.168.0.0/24

    .Parameter WANInterfaceName
    Name of the Wan Interface

    .Example
    $Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "ping https ssh ftm fgfm"
    TrustedCIDR1     = "192.168.0.0/16"
    TrustedCIDR2     = "10.0.0.0/8"
    TrustedCIDR3     = "172.16.0.0/12"
    TrustedCIDR4     = "8.8.8.8/32"
    WANInterfaceName = "port1"
    }
    Enable-Management @Params

    This example allows management from all Private Class ranges and one public IP

    .Example
    $Params = @{
        AdminUsername    = "admin"
        AllowAccess      = "https"
        TrustedCIDR1     = "192.168.0.0/24"
        TrustedCIDR2     = "8.8.8.8/32"
        WANInterfaceName = "port1"
    }
    Enable-Management @Params

    This example allows management from a single /24 subnet and a single public range. It also limits access to HTTPS

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        AdminUsername    = "admin"
        AllowAccess      = "ping https ssh ftm fgfm"
        TrustedCIDR1     = "192.168.0.0/16"
        TrustedCIDR2     = "10.0.0.0/8"
        TrustedCIDR3     = "172.16.0.0/12"
        TrustedCIDR4     = "8.8.8.8/32"
        WANInterfaceName = "port1"
    }
    $command = Enable-Management @Params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        AdminUsername    = "admin"
        AllowAccess      = "ping https ssh ftm fgfm"
        TrustedCIDR1     = "192.168.0.0/16"
        TrustedCIDR2     = "10.0.0.0/8"
        TrustedCIDR3     = "172.16.0.0/12"
        TrustedCIDR4     = "8.8.8.8/32"
        WANInterfaceName = "port1"
    }
    $command = Enable-Management @Params
    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    .Notes
    This function currently supports up to 6 Trusted Host subnets. Open a Github issue to request more added.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

Function Enable-Management {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [string]$AdminUsername,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [string]$AllowAccess = "ping https ssh ftm fgfm",
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        $WANInterfaceName,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $TrustedCIDR1,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $TrustedCIDR2,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $TrustedCIDR3,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $TrustedCIDR4,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $TrustedCIDR5,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedCIDR6')]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $TrustedCIDR6
    )

    if ($TrustedCIDR1) {
        $calc = Invoke-PSipcalc $TrustedCIDR1
        $IPAddress = ($calc).IP
        $SubnetMask = ($calc).SubnetMask

        $t1 = "set trusthost1 $IPAddress $SubnetMask"
        $t2 = $null
        $t3 = $null
        $t4 = $null
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedCIDR2) {
        $calc = Invoke-PSipcalc $TrustedCIDR2
        $IPAddress = ($calc).IP
        $SubnetMask = ($calc).SubnetMask

        $t2 = "set trusthost2 $IPAddress $SubnetMask"
        $t3 = $null
        $t4 = $null
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedCIDR3) {
        $calc = Invoke-PSipcalc $TrustedCIDR3
        $IPAddress = ($calc).IP
        $SubnetMask = ($calc).SubnetMask

        $t3 = "set trusthost3 $IPAddress $SubnetMask"
        $t4 = $null
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedCIDR4) {
        $calc = Invoke-PSipcalc $TrustedCIDR4
        $IPAddress = ($calc).IP
        $SubnetMask = ($calc).SubnetMask

        $t4 = "set trusthost4 $IPAddress $SubnetMask"
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedCIDR5) {
        $calc = Invoke-PSipcalc $TrustedCIDR5
        $IPAddress = ($calc).IP
        $SubnetMask = ($calc).SubnetMask

        $t5 = "set trusthost5 $IPAddress $SubnetMask"
        $t6 = $null
    }
    if ($TrustedCIDR6) {
        $calc = Invoke-PSipcalc $TrustedCIDR6
        $IPAddress = ($calc).IP
        $SubnetMask = ($calc).SubnetMask

        $t6 = "set trusthost6 $IPAddress $SubnetMask"
    }

    if ($t6) {
        Write-Output "
config system admin
    edit ""$AdminUsername""
        $t1
        $t2
        $t3
        $t4
        $t5
        $t6
    next
end

config system interface
    edit ""$WANInterfaceName""
        set allowaccess ping https ssh ftm
    next
end"
    }
    elseif ($t5) {
        Write-Output "
config system admin
    edit ""$AdminUsername""
        $t1
        $t2
        $t3
        $t4
        $t5
    next
end

config system interface
    edit ""$WANInterfaceName""
        set allowaccess ping https ssh ftm
    next
end"
    }
    elseif ($t4) {
        Write-Output "
config system admin
    edit ""$AdminUsername""
        $t1
        $t2
        $t3
        $t4
    next
end

config system interface
    edit ""$WANInterfaceName""
        set allowaccess ping https ssh ftm
    next
end"
    }
    elseif ($t3) {
        Write-Output "
config system admin
    edit ""$AdminUsername""
        $t1
        $t2
        $t3
    next
end

config system interface
    edit ""$WANInterfaceName""
        set allowaccess ping https ssh ftm
    next
end"
    }
    elseif ($t2) {
        Write-Output "
config system admin
    edit ""$AdminUsername""
        $t1
        $t2
    next
end

config system interface
    edit ""$WANInterfaceName""
        set allowaccess ping https ssh ftm
    next
end"
    }
    else {
        Write-Output "
config system admin
    edit ""$AdminUsername""
        $t1
    next
end

config system interface
    edit ""$WANInterfaceName""
        set allowaccess $AllowAccess
    next
end"

    }
}