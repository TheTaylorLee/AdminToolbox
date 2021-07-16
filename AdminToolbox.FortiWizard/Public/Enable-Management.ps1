Function Enable-Management {

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

    .Parameter ConfigFilePath
    Location to save the outputted config file to. The output will append an existing file if the path matches

    .Parameter TrustedHost1
    Set the first Trusted subnet allowed to access the Fortigate

    .Parameter TrustedHost2
    Set the second Trusted subnet allowed to access the Fortigate

    .Parameter TrustedHost3
    Set the third Trusted subnet allowed to access the Fortigate

    .Parameter TrustedHost4
    Set the fourth Trusted subnet allowed to access the Fortigate

    .Parameter TrustedHost5
    Set the fifth Trusted subnet allowed to access the Fortigate

    .Parameter TrustedHost6
    Set the sixth Trusted subnet allowed to access the Fortigate

    .Parameter WANInterfaceName
    Name of the Wan Interface

    .Example
    This example allows management from all Private Class ranges and one public IP

    $Params = @{
    AdminUsername    = "admin"
    AllowAccess      = "ping https ssh ftm fgfm"
    TrustedHost1     = "192.168.0.0 255.255.0.0"
    TrustedHost2     = "10.0.0.0 255.0.0.0"
    TrustedHost3     = "172.16.0.0 255.240.0.0"
    TrustedHost4     = "8.8.8.8 255.255.255.255"
    WANInterfaceName = "port1"
    }

    Enable-Management @Params

    .Example
    This example allows management from a single /24 subnet and a single public range. It also limits access to HTTPS

    $Params = @{
        AdminUsername    = "admin"
        AllowAccess      = "https"
        TrustedHost1     = "192.168.0.0 255.255.255.0"
        TrustedHost2     = "8.8.8.8 255.255.255.255"
        WANInterfaceName = "port1"
    }

    Enable-Management @Params

    .Example
    This example generates and SSH session and invokes the output of this function against that sessions.

    New-SSHSession -computername 192.168.0.1

    $Params = @{
        AdminUsername    = "admin"
        AllowAccess      = "ping https ssh ftm fgfm"
        TrustedHost1     = "192.168.0.0 255.255.0.0"
        TrustedHost2     = "10.0.0.0 255.0.0.0"
        TrustedHost3     = "172.16.0.0 255.240.0.0"
        TrustedHost4     = "8.8.8.8 255.255.255.255"
        WANInterfaceName = "port1"
    }
    $command = Enable-Management @Params

    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    .Example
    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1

    $Params = @{
        AdminUsername    = "admin"
        AllowAccess      = "ping https ssh ftm fgfm"
        TrustedHost1     = "192.168.0.0 255.255.0.0"
        TrustedHost2     = "10.0.0.0 255.0.0.0"
        TrustedHost3     = "172.16.0.0 255.240.0.0"
        TrustedHost4     = "8.8.8.8 255.255.255.255"
        WANInterfaceName = "port1"
    }
    $command = Enable-Management @Params

    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    .Notes
    This function currently supports up to 6 Trusted Host subnets

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        [string]$AdminUsername,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        [string]$AllowAccess = "ping https ssh ftm fgfm",
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        $WANInterfaceName,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost1')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        $TrustedHost1,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost2')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        $TrustedHost2,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost3')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        $TrustedHost3,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost4')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        $TrustedHost4,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost5')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        $TrustedHost5,
        [Parameter(Mandatory = $true, ParameterSetName = 'TrustedHost6')]
        $TrustedHost6
    )

    if ($TrustedHost1) {
        $t1 = "set trusthost1 $TrustedHost1"
        $t2 = $null
        $t3 = $null
        $t4 = $null
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedHost2) {
        $t2 = "set trusthost2 $TrustedHost2"
        $t3 = $null
        $t4 = $null
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedHost3) {
        $t3 = "set trusthost3 $TrustedHost3"
        $t4 = $null
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedHost4) {
        $t4 = "set trusthost4 $TrustedHost4"
        $t5 = $null
        $t6 = $null
    }
    if ($TrustedHost5) {
        $t5 = "set trusthost5 $TrustedHost5"
        $t6 = $null
    }
    if ($TrustedHost6) {
        $t6 = "set trusthost6 $TrustedHost6"
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