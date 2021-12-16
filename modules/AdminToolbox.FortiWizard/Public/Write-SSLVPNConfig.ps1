<#
    .Description
    Creates a Fortigate Config Script for a simple SSL Client VPN implementation.

    .Parameter CommaSeperatedDNSSuffixes
    DNS Suffixes for Split DNS

    .Parameter DNofParentOU
    Distinguished Name of the Top Level OU for the authenticating Domain

    .Parameter DNSServerIP
    IPv4 address of the DNS server used by the SSLVPN clients

    .Parameter InternalCIDR
    CIDR Address for the allowed LAN subnet

    .Parameter SSLClientCIDR
    CIDR Address for the subnet being handed out to SSLVPN Clients

    .Parameter LanInterfaceName
    Name of the LAN interface containing the to be accessed Subnet

    .Parameter LDAPServerFriendlyName
    Friendly Name for referencing the LDAP authentication server

    .Parameter ServiceAccountPassword
    Password of the Authenticating service account

    .Parameter ServiceAccountsAMAccountName
    sAMAccountName for the service account that will authenticate to the LDAP server. The Service account should have domain adming privleges and be denied logon locally

    .Parameter WanInterfaceName
    Name of the WAN interface where the incoming sslvpn Connections should originate.

    .Example
    $Params = @{
        CommaSeperatedDNSSuffixes    = "domain.com,domain2.com"
        DNofParentOU                 = "DC=domain,DC=COM"
        DNSServerIP                  = "192.168.0.1"
        InternalCIDR                 = "192.168.56.0/24"
        SSLClientCIDR                = "10.212.134.0/24"
        LanInterfaceName             = "port2"
        LDAPSERVERFriendlyName       = "DomainLdap"
        ServiceAccountPassword       = "Password"
        ServiceAccountsAMAccountName = "fortigate"
        WanInterfaceName             = "port1"
    }
    Write-SSLVPNConfig @Params

    .Example
    New-SSHSession -computername 192.168.0.1
    $Params = @{
        CommaSeperatedDNSSuffixes    = "domain.com,domain2.com"
        DNofParentOU                 = "DC=domain,DC=COM"
        DNSServerIP                  = "192.168.0.1"
        InternalCIDR                 = "192.168.56.0/24"
        SSLClientCIDR                = "10.212.134.0/24"
        LanInterfaceName             = "port2"
        LDAPSERVERFriendlyName       = "DomainLdap"
        ServiceAccountPassword       = "Password"
        ServiceAccountsAMAccountName = "fortigate"
        WanInterfaceName             = "port1"
    }
    $command = Write-SSLVPNConfig @Params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Example
    New-SSHSession -computername 192.168.0.1
    New-SSHSession -computername 192.168.1.1
    $Params = @{
        CommaSeperatedDNSSuffixes    = "domain.com,domain2.com"
        DNofParentOU                 = "DC=domain,DC=COM"
        DNSServerIP                  = "192.168.0.1"
        InternalCIDR                 = "192.168.56.0/24"
        SSLClientCIDR                = "10.212.134.0/24"
        LanInterfaceName             = "port2"
        LDAPSERVERFriendlyName       = "DomainLdap"
        ServiceAccountPassword       = "Password"
        ServiceAccountsAMAccountName = "fortigate"
        WanInterfaceName             = "port1"
    }
    $command = Write-SSLVPNConfig @Params
    $sessions = Get-SSHSession
    foreach ($session in $sessions) {
        Write-Output "Invoking Command against $session.host"
        $result = Invoke-SSHCommand -Command $command -SessionId $session.sessionID
        $result.output
    }

    This example generates multiple SSH sessions and invokes the output of this function against all active sessions.

    .Link
    https://github.com/TheTaylorLee/FortiWizard/tree/main/docs
#>

Function Write-SSLVPNConfig {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$CommaSeperatedDNSSuffixes,
        [Parameter(Mandatory = $true)]$DNofParentOU,
        [Parameter(Mandatory = $true)][ValidatePattern('^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}$')]$DNSServerIP,
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $InternalCIDR,
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $SSLClientCIDR,
        [Parameter(Mandatory = $true)]$LanInterfaceName,
        [Parameter(Mandatory = $true)]$LDAPServerFriendlyName,
        [Parameter(Mandatory = $true)]$ServiceAccountPassword,
        [Parameter(Mandatory = $true)]$ServiceAccountsAMAccountName,
        [Parameter(Mandatory = $true)]$WanInterfaceName
    )

    #Calculate for Internal CIDR
    $calc = Invoke-PSipcalc $InternalCIDR
    $IPAddress = ($calc).IP
    $SubnetMask = ($calc).SubnetMask

    #Calculate for SSL Client CIDR
    $SSLClientcalc = Invoke-PSipcalc $SSLClientCIDR
    $SSLClientStartIP = ($SSLClientcalc).HostMin
    $SSLClientEndIP = ($SSLClientcalc).HostMax


    Write-Output "
config user ldap
    edit ""$LDAPSERVERFriendlyName""
        set server $DNSServerIP
        set cnid sAMAccountName
        set dn ""$DNofParentOU""
        set type regular
        set username ""$ServiceAccountsAMAccountName""
        set password $ServiceAccountPassword
    next
end

config user group
    edit SSLVPNUsers
        set member ""$LDAPSERVERFriendlyName""
    next
end

config firewall address
    edit ""SSLVPN_TUNNEL_$SSLClientCIDR""
        set type iprange
        set associated-interface ssl.root
        set start-ip $SSLClientStartIP
        set end-ip $SSLClientEndIP
    next
end

config firewall address
    edit ""SSLVPN_Internal_$InternalCIDR""
        set visibility disable
        set subnet $IPAddress $SubnetMask
    next
end

config vpn ssl web portal
    delete full-access
    delete web-access
    edit tunnel-access
        set tunnel-mode enable
        set ip-pools ""SSLVPN_TUNNEL_$SSLClientCIDR""
        set ipv6-tunnel-mode disable
        config split-dns
        edit 1
            set domains ""$CommaSeperatedDNSSuffixes""
            set dns-server1 $DNSServerIP
        next
        end
    next
    edit no-access
        set forticlient-download disable
    next
end

config vpn ssl settings
    set ssl-min-proto-ver tls1-0
    set idle-timeout 43200
    set auth-timeout 43200
    set tunnel-ip-pools ""SSLVPN_TUNNEL_$SSLClientCIDR""
    set dns-server1 $DNSServerIP
    set source-interface ""$WanInterfaceName""
    set source-address all
    set source-address6 all
    set default-portal no-access
    set port 10443
    config authentication-rule
        edit 1
            set groups SSLVPNUsers
            set portal tunnel-access
        next
    end
end

config firewall policy
    edit 0
        set name SSLVPN
        set srcintf ssl.root
        set dstintf ""$LanInterfaceName""
        set srcaddr all
        set dstaddr ""SSLVPN_Internal_$InternalCIDR""
        set action accept
        set schedule always
        set service ALL
        set utm-status enable
        set ssl-ssh-profile certificate-inspection
        set ips-sensor default
        set nat enable
        set groups SSLVPNUsers
    next
end"
}