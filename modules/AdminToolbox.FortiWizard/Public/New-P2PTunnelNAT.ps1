#Required by functions
#New-FormTunnel

<#
    .Description
    This is a CLI wizard that generates a new IPSec Tunnel Config and related objects. The source Subnet will be Natted by this policy.

    .Parameter Comments
    Optional parameter for providing comments on the tunnel. Will be recorded in the tunnel interface.

    .Parameter dhgroups
    This is the Diffie-Hellman group or groups used by the Phase 1 and Phase 2 interfaces. If providing multiple values input them in comma delimited format.

    ex: "5", "14"

    *These are the available DH Groups
    32 31 30 29 28 27
    21 20 19 18 17 16
    15 14 5 2 1

    .Parameter Ikev
    Provide the desired ike version 1 or 2

    .Parameter LANInterface
    This is the name of the lan interface/s allowed for the tunnel.

    ex: "phone vlan", "wifi vlan"

    .Parameter LocalAddressCIDRs
    This is the Address Object CIDRs that will be created for the local side of the tunnel. If there is more than one CIDR, it must be ordered in conjunction with the NAT CIDRS. So that each local CIDR in the array matches it's NAT CIDR.

    ex: "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"

    .Parameter NATAddressCIDRS
    This is the Address Object NAT CIDRs that will be created for the local side of the tunnel. If there is more than one CIDR, it must be ordered in conjunction with the Local CIDRS. So that each NAT CIDR in the array matches it's Local CIDR.

    ex: "172.30.30.0/24", "172.30.31.0/24", "172.30.32.0/24"

    .Parameter PeerAddress
    This is the public IP Address for the remote side of the tunnel.

    .Parameter PFS
    Specify if PFS should be enabled on the Phase 2 interface.

    .Parameter Proposal
    This is the encryption proposal or proposals for the Phase 1 and Phase 2 interfaces. Provide in commad delimited format.

    ex: aes256-sha512, aes256-sha1

    *These are the available proposals that can be used.
    des-md5
    des-sha1
    des-sha256
    des-sha384
    des-sha512
    3des-md5
    3des-sha1
    3des-sha256
    3des-sha384
    3des-sha512
    aes128-md5
    aes128-sha1
    aes128-sha256
    aes128-sha384
    aes128-sha512
    aes192-md5
    aes192-sha1
    aes192-sha256
    aes192-sha384
    aes192-sha512
    aes256-md5
    aes256-sha1
    aes256-sha256
    aes256-sha384
    aes256-sha512

    .Parameter PSK
    This is the Private Shared Key for the Phase 1 and Phase 2 interfaces.

    .Parameter RemoteAddressCIDRs
    This is the Address Object CIDRs that will be created for the remote side of the tunnel.

    ex: "192.168.1.0/24", "10.100.0/24"

    .Parameter Services
    Specify the Service or services that will be applied to the Firewall Policy for this tunnel.

    ex: "RDP/3389/TCP", "piov/5060-5061/UDP"

    .Parameter TTL
    This is the Time to Live for the Phase 1 and Phase 2 proposals.

    .Parameter TunnelName
    This is the name for the VPN Tunnel. Maximum 15 Alphanumeric characters.

    .Parameter WANInterface
    This is the name of the WAN interface that the tunnel will be built on.

    .Example
    $params = @{
    dhgroups           = "5", "14"
    LANInterface       = "port1", "port2"
    LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
    NATAddressCIDRS    = "172.30.30.0/24", "172.30.31.0/24", "172.30.32.0/24"
    PeerAddress        = "56.98.75.32"
    Proposal           = "aes256-sha512", "aes256-sha1"
    PSK                = "dfdayb%^4356456"
    RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
    Services           = "RDP/3389/TCP", "DNS/53/UDP"
    TTL                = "28800"
    TunnelName         = "TestTunnel"
    WANInterface       = "wan3"
    ikev               = "1"
    }
    New-P2PTunnelNAT @params

    This example will generate a NAT VPN tunnel config.

    .Example
    New-SSHSession -computername 192.168.0.1
    $params = @{
    dhgroups           = "5", "14"
    LANInterface       = "port1", "port2"
    LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
    NATAddressCIDRS    = "172.30.30.0/24", "172.30.31.0/24", "172.30.32.0/24"
    PeerAddress        = "56.98.75.32"
    Proposal           = "aes256-sha512", "aes256-sha1"
    PSK                = "dfdayb%^4356456"
    RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
    Services           = "RDP/3389/TCP", "DNS/53/UDP"
    TTL                = "28800"
    TunnelName         = "TestTunnel"
    WANInterface       = "wan3"
    ikev               = "1"
    }
    $command = New-P2PTunnelNAT @params
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    This example generates an SSH session and invokes the output of this function against that session.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

Function New-P2PTunnelNAT {

    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide the DH Group or Groups in space delimeted format for the Phase 1 and Phase 2 proposals.")]
        [string[]]$dhgroups,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the desired ike version")]
        [ValidateSet('1', '2')]
        $ikev,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Lan Interface Name")]
        [string[]]$LANInterface,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR Addresses that will be used by this Tunnel. ex: ""192.168.1.0/24"", ""10.100.12.0/24""")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$LocalAddressCIDRs,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR Addresses that are to be the NAT CIDRS for the Local CIDRS. ex: ""192.168.1.0/24"", ""10.100.12.0/24""")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$NATAddressCIDRS,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Public IP for the Tunnel Peer")]
        $PeerAddress,
        [Parameter(Mandatory = $true, HelpMessage = "Specify if PFS should be enabled")]
        [ValidateSet('yes', 'no')]
        $PFS,
        [Parameter(Mandatory = $true)][string[]]$Proposal,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Private Key for the Tunnel")]
        $PSK,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR Addresses that will be used by this Tunnel. ex: ""192.168.1.0/24"", ""10.100.12.0/24""")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$RemoteAddressCIDRs,
        [Parameter(Mandatory = $false, HelpMessage = "Specify services in the following format. ex: ""RDP/3389/TCP"", ""piov/5060-5061/UDP""")]
        [string[]]$Services,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Phase 1 and Phase 2 Time to Live.")]
        $TTL,
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.")]
        [ValidateLength(1, 15)]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the name of the public interface for this tunnel.")]
        $WANInterface,
        [Parameter(Mandatory = $false, HelpMessage = "Provide a description for the tunnel")]
        $Comments
    )

    begin {
        $ErrorActionPreference = 'Stop'
        #Processing array parameters to single line entries for their respective config lines
        #DHGroups
        $dhgroups = $dhgroups -join " "
        #Proposals
        $Proposal = $Proposal -join " "
        #LanInterfaces
        $IntQuotes = foreach ($int in $LANInterface) {
            """$int"""
        }
        $LANInterface = $IntQuotes -join " "
    }


    process {
        #Create Phase 1 Proposal
        if ($Comments) {
            $params = @{
                TunnelName  = $TunnelName
                Interface   = $WanInterface
                Proposal    = $Proposal
                dhgroups    = $dhgroups
                PeerAddress = $PeerAddress
                PSK         = $PSK
                TTL         = $TTL
                ikev        = $ikev
                comments    = $Comments
            }
        }
        else {
            $params = @{
                TunnelName  = $TunnelName
                Interface   = $WanInterface
                Proposal    = $Proposal
                dhgroups    = $dhgroups
                PeerAddress = $PeerAddress
                PSK         = $PSK
                TTL         = $TTL
                ikev        = $ikev
            }
        }
        $ConfPhase1 = New-P2PPhase1Interface @params

        #Create Local Address Objects
        [int]$max = $LocalAddressCIDRs.Count
        $script:LocalAddressObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                Name = "VPN_" + $TunnelName + "_Local_" + $i
                CIDR = $LocalAddressCIDRs[$i]
            }
        }

        $ConfLocalAddressObjects = Foreach ($AddressObject in $script:LocalAddressObjects) {
            New-AddressObject -AddressName $AddressObject.Name -CIDR $AddressObject.CIDR
        }

        #Create Remote Address Objects
        [int]$max = $RemoteAddressCIDRs.Count
        $script:RemoteAddressObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                Name = "VPN_" + $TunnelName + "_Remote_" + $i
                CIDR = $RemoteAddressCIDRs[$i]
            }
        }

        $ConfRemoteAddressObjects = Foreach ($AddressObject in $script:RemoteAddressObjects) {
            New-AddressObject -AddressName $AddressObject.Name -CIDR $AddressObject.CIDR
        }

        #Create NAT Address Objects
        [int]$max = $NATAddressCIDRS.Count
        $script:NATAddressObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                Name = "VPN_" + $TunnelName + "_NAT_" + $i
                CIDR = $NATAddressCIDRS[$i]
            }
        }

        $ConfNATAddressObjects = Foreach ($AddressObject in $script:NATAddressObjects) {
            New-AddressObject -AddressName $AddressObject.Name -CIDR $AddressObject.CIDR
        }

        #Create Local Address Group
        $LocNames = ($script:LocalAddressObjects).name -join " "
        $LocalGroupName = "vpn_" + "$TunnelName" + "_Local"
        $ConfLocalAddressGroups = New-AddressGroup -AddressNames $LocNames -GroupName $LocalGroupName

        #Create Remote Address Group
        $RemNames = ($script:RemoteAddressObjects).name -join " "
        $RemoteGroupName = "vpn_" + "$TunnelName" + "_Remote"
        $ConfRemoteAddressGroups = New-AddressGroup -AddressNames $RemNames -GroupName $RemoteGroupName

        #Create IP Pool
        [int]$max = $LocalAddressCIDRs.Count
        $IPPoolObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                IPPoolName   = "vpn_" + $TunnelName + "_" + $i
                ExternalCIDR = $NATAddressCIDRS[$i]
                InternalCIDR = $LocalAddressCIDRs[$i]
            }
        }

        $IPPool = Foreach ($IPPoolObject in $IPPoolObjects) {
            New-IPPoolFixedRange -IPPoolName $IPPoolObject.IPPoolName -ExternalCIDR $IPPoolObject.ExternalCIDR -InternalCIDR $IPPoolObject.InternalCIDR
        }

        #Create VIPRange
        [int]$max = $LocalAddressCIDRs.Count
        $VIPObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                VIPName      = "vpn_" + $TunnelName + "_" + $i
                TunnelName   = $TunnelName
                ExternalCIDR = $NATAddressCIDRS[$i]
                InternalCIDR = $LocalAddressCIDRs[$i]
            }
        }

        $VIPRange = Foreach ($VIPObject in $VIPObjects) {
            New-VIPRange -VIPName $VIPObject.VIPName -ExternalCIDR $VIPObject.ExternalCIDR -InternalCIDR $VIPObject.InternalCIDR -Interface $VIPObject.TunnelName
        }

        #Create Phase 2 Interfaces
        [int]$localcount = $script:NATAddressObjects.count
        [int]$remotecount = $script:RemoteAddressObjects.count
        [int]$Script:PhaseCount = 0

        $Phase2 = for ($i = 0; $i -lt $localcount; $i++) {
            [string[]]$locals = ($script:NATAddressObjects).name
            [string[]]$sourceaddressname = $locals[$i]
            for ($ii = 0; $ii -lt $remotecount; $ii++) {
                [string[]]$remotes = ($script:RemoteAddressObjects).name
                $params = @{
                    DestinationAddressName = [string[]]$remotes[$ii]
                    dhgroups               = $dhgroups
                    PFS                    = $PFS
                    PhaseName              = $TunnelName + " P2 " + $Script:PhaseCount
                    Proposal               = $Proposal
                    SourceAddressName      = $sourceaddressname
                    TTL                    = $TTL
                    TunnelName             = $TunnelName
                }
                New-P2PPhase2Interface @params
                $Script:phasecount++
            }
        }

        #Create Static Routes
        $StaticRoute = New-StaticRouteTunnel -TunnelName $TunnelName -DestinationAddressName $RemoteGroupName

        #Create Services
        $Service = if ($services) {

            foreach ($service in $services) {
                $split = $service -split "/"

                if ($split[2] -eq 'TCP') {
                    $Params = @{
                        ServiceName  = [string]"vpn_" + $tunnelname + [string]"_" + $split[0]
                        TCPPortRange = $split[1]
                    }
                }

                if ($split[2] -eq 'UDP') {
                    $Params = @{
                        ServiceName  = [string]"vpn_" + $tunnelname + [string]"_" + $split[0]
                        UDPPortRange = $split[1]
                    }
                }
                New-ServiceObject @Params
            }
        }

        #Create Service Groups
        $ServiceGroup = if ($services) {
            $proc = $services -split "/"
            [int]$count = $proc.count
            $svcs = for ($i = 0; $i -lt $count) {
                [string]"vpn_" + $tunnelname + [string]"_" + $proc[$i]
                $i = $i + [int]3
            }
            $svcresult = $svcs -join " "
            $svcgroupname = "vpn_" + $tunnelname
            New-ServiceGroup -ServiceGroupName $svcgroupname -Members $svcresult
        }

        #Create Firewall Policies
        if ($null -eq $svcresult) {
            $svcgroupname = [string]"ALL"
        }

        [int]$max = $LocalAddressCIDRs.Count
        $FirewallPolicy = for ($i = 0; $i -lt $max; $i++) {
            $params = @{
                TunnelName          = $TunnelName + " $i"
                SourceInterfaceName = $LANInterface
                SourceAddress       = $script:LocalAddressObjects.name[$i]
                DestinationAddress  = $RemoteGroupName
                service             = $svcgroupname
                IPPoolName          = $IPPoolObjects.IPPoolName[$i]
                Vipname             = $VIPObjects.VIPName[$i]
            }
            New-FirewallPolicyTunnelNAT @params
        }
    }

    end {
        $mv = (Get-Module admintoolbox.fortiwizard).version
        $mv1 = $mv.major
        $mv2 = $mv.Minor
        $mv3 = $mv.build
        $modversion = [string]$mv1 + [string]"." + [string]$mv2 + [string]"." + [string]$mv3
        Write-Output "#####################################################################################"
        Write-Output "# Tunnel config generated using Admintoolbox.FortiWizard module by TheTaylorLee"
        Write-Output "# https://www.powershellgallery.com/profiles/TaylorLee"
        Write-Output "# https://github.com/TheTaylorLee/AdminToolbox"
        Write-Output "# Created using module version $ModVersion"
        Write-Output "#####################################################################################"
        Write-Output $ConfPhase1
        Write-Output $ConfLocalAddressObjects
        Write-Output $ConfRemoteAddressObjects
        Write-Output $ConfNATAddressObjects
        Write-Output $ConfLocalAddressGroups
        Write-Output $ConfRemoteAddressGroups
        Write-Output $IPPool
        Write-Output $VIPRange
        Write-Output $Phase2
        Write-Output $StaticRoute
        Write-Output $Service
        Write-Output $ServiceGroup
        Write-Output $FirewallPolicy

        $ErrorActionPreference = 'continue'
    }
}