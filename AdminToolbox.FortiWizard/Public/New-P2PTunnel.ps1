<#example
$params = @{
    dhgroups           = "5", "14"
    LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
    LocalAddressNames  = "local1", "local2", "local3"
    PeerAddress        = "56.98.75.32"
    Proposal           = "aes256-sha512"
    PSK                = "dfdayb%^4356456"
    RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
    RemoteAddressNames = "remote1", "remote2", "remote3"
    TTL                = "28800"
    TunnelName         = "TestTunnel"
    WANInterface       = "wan3"
}

New-P2PTunnel @params
#>

Function New-P2PTunnel {
    <#
    .Description
    This is a CLI wizard that generates a new IPSec Tunnel Config and related objects.

    .Parameter dhgroups
    This is the Diffie-Hellman group or groups used by the Phase 1 and Phase 2 interfaces. If providing multiple values input them in comma delimited format.

    ex: "5", "14"

    *These are the available DH Groups
    32 31 30 29 28 27
    21 20 19 18 17 16
    15 14 5 2 1

    .Parameter LocalAddressCIDRs
    This is the Address Object CIDRs that will be created for the local side of the tunnel. This parameter matches up with the AddressObjectNames parameter for generating the Address Objects. Be sure that your order the items in the arrays to match up.

    ex: "192.168.1.0/24", "10.100.0/24"

    .Parameter LocalAddressNames
    This is the Address Object Names that will be created for the local side of the tunnel. This parameter matches up with the AddressObjectCIDRs parameter for generating the Address Objects. Be sure that your order the items in the arrays to match up.

    ex: "Local_192.168.1.0/24", "Remote_10.100.0/24"

    .Parameter PeerAddress
    This is the public IP Address for the remote side of the tunnel.

    .Parameter Proposal
    This is the encryption proposal or proposals for the Phase 1 and Phase 2 interfaces. Provide in space delimited format.

    ex: aes256-sha512 aes256-sha1

    *These are the available proposals that can be used.
    des-md5          des-md5
    des-sha1         des-sha1
    des-sha256       des-sha256
    des-sha384       des-sha384
    des-sha512       des-sha512
    3des-md5         3des-md5
    3des-sha1        3des-sha1
    3des-sha256      3des-sha256
    3des-sha384      3des-sha384
    3des-sha512      3des-sha512
    aes128-md5       aes128-md5
    aes128-sha1      aes128-sha1
    aes128-sha256    aes128-sha256
    aes128-sha384    aes128-sha384
    aes128-sha512    aes128-sha512
    aes192-md5       aes192-md5
    aes192-sha1      aes192-sha1
    aes192-sha256    aes192-sha256
    aes192-sha384    aes192-sha384
    aes192-sha512    aes192-sha512
    aes256-md5       aes256-md5
    aes256-sha1      aes256-sha1
    aes256-sha256    aes256-sha256
    aes256-sha384    aes256-sha384
    aes256-sha512    aes256-sha512

    .Parameter PSK
    This is the Private Shared Key for the Phase 1 and Phase 2 interfaces.

    .Parameter RemoteAddressCIDRs
    This is the Address Object CIDRs that will be created for the remote side of the tunnel. This parameter matches up with the AddressObjectNames parameter for generating the Address Objects. Be sure that your order the items in the arrays to match up.

    ex: "192.168.1.0/24", "10.100.0/24"

    .Parameter RemoteAddressNames
    This is the Address Object Names that will be created for the remote side of the tunnel. This parameter matches up with the AddressObjectCIDRs parameter for generating the Address Objects. Be sure that your order the items in the arrays to match up.

    ex: "Local_192.168.1.0/24", "Remote_10.100.0/24"

    .Parameter TunnelName
    This is the name for the VPN Tunnel. Maximum 15 Alphanumeric characters.

    .Parameter TTL
    This is the Time to Live for the Phase 1 and Phase 2 proposals.

    .Parameter WANInterface
    This is the name of the WAN interface that the tunnel will be built on.

    .Example
    New-P2PTunnel

    .Example
    This example generates an SSH session and invokes the output of this function against that session.

    New-SSHSession -computername 192.168.0.1
    $command = New-P2PTunnel
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

    .Notes
    Capitalization and spacing is very important when running this function. Typos should also be avoided. Any errors resultant from adding spaces, creating typos, or not focusing on persisint casing will lead to errors. The function will fail, or the config script when pushed to the firewall will fail to produce desired results.

    Better parameter validation may be added in future versions of this function.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide the DH Group or Groups in space delimeted format for the Phase 1 and Phase 2 proposals.")]
        [string[]]$dhgroups,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR Addresses that will be used by this Tunnel. ex: ""192.168.1.0/24"", ""10.100.12.0/24""")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$LocalAddressCIDRs,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of Address Objects that will be used by this Tunnel. ex: ""LanSubnet"", ""PartnerSubnet""")]
        [string[]]$LocalAddressNames,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Public IP for the Tunnel Peer")]
        $PeerAddress,
        [Parameter(Mandatory = $true, HelpMessage = "
des-md5          des-md5
des-sha1         des-sha1
des-sha256       des-sha256
des-sha384       des-sha384
des-sha512       des-sha512
3des-md5         3des-md5
3des-sha1        3des-sha1
3des-sha256      3des-sha256
3des-sha384      3des-sha384
3des-sha512      3des-sha512
aes128-md5       aes128-md5
aes128-sha1      aes128-sha1
aes128-sha256    aes128-sha256
aes128-sha384    aes128-sha384
aes128-sha512    aes128-sha512
aes192-md5       aes192-md5
aes192-sha1      aes192-sha1
aes192-sha256    aes192-sha256
aes192-sha384    aes192-sha384
aes192-sha512    aes192-sha512
aes256-md5       aes256-md5
aes256-sha1      aes256-sha1
aes256-sha256    aes256-sha256
aes256-sha384    aes256-sha384
aes256-sha512    aes256-sha512

Type in the encryption selection to use for the Phase 1 and Phase 2 Proposals in a space delimited format.
")]
        $Proposal,
        [Parameter(Mandatory = $true, HelpMessage = "Specify the Private Key for the Tunnel")]
        $PSK,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR Addresses that will be used by this Tunnel. ex: ""192.168.1.0/24"", ""10.100.12.0/24""")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$RemoteAddressCIDRs,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of Address Objects that will be used by this Tunnel. ex: ""LanSubnet"", ""PartnerSubnet""")]
        [string[]]$RemoteAddressNames,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the Phase 1 and Phase 2 Time to Live.")]
        $TTL,
        [Parameter(Mandatory = $true, HelpMessage = "Provide a VPN Tunnel Name with a maximum 15 AlphaNumeric characters.")]
        [ValidateLength(1, 15)]
        $TunnelName,
        [Parameter(Mandatory = $true, HelpMessage = "Provide the name of the public interface for this tunnel.")]
        $WANInterface
    )

    begin {
        $ErrorActionPreference = 'Stop'
        $dhgroups = $dhgroups -join " "
    }

    process {
        #Create Local Address Objects
        [int]$max = $LocalAddressNames.Count
        $LocalAddressObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                Name = $LocalAddressNames[$i]
                CIDR = $LocalAddressCIDRs[$i]
            }
        }

        $ConfLocalAddressObjects = Foreach ($AddressObject in $LocalAddressObjects) {
            New-AddressObject -AddressName $AddressObject.Name -CIDR $AddressObject.CIDR
        }

        #Create Remote Address Objects
        [int]$max = $RemoteAddressNames.Count
        $RemoteAddressObjects = for ($i = 0; $i -lt $max; $i++) {
            [PSCustomObject]@{
                Name = $RemoteAddressNames[$i]
                CIDR = $RemoteAddressCIDRs[$i]
            }
        }

        $ConfRemoteAddressObjects = Foreach ($AddressObject in $RemoteAddressObjects) {
            New-AddressObject -AddressName $AddressObject.Name -CIDR $AddressObject.CIDR
        }

        #Create Local Address Group
        $LocNames = $localaddressnames -join " "
        $LocalGroupName = "vpn_" + "$TunnelName" + "_Local"
        $ConfLocalAddressGroups = New-AddressGroup -AddressNames $LocNames -GroupName $LocalGroupName

        #Create Remote Address Group
        $RemNames = $Remoteaddressnames -join " "
        $RemoteGroupName = "vpn_" + "$TunnelName" + "_Remote"
        $ConfRemoteAddressGroups = New-AddressGroup -AddressNames $RemNames -GroupName $RemoteGroupName

        #Create Phase 1 Proposals
        $params = @{
            TunnelName  = $TunnelName
            Interface   = $WanInterface
            Proposal    = $Proposal
            dhgroups    = $dhgroups
            PeerAddress = $PeerAddress
            PSK         = $PSK
            TTL         = $TTL
        }
        $ConfPhase1 = New-P2PPhase1Interface @params

        #Create Phase 2 Proposals
        [int]$Locals = $LocalAddressNames.count
        [int]$Remotes = $RemoteAddressNames.count

        if ($locals -gt $remotes) {
            $ProcessCount = $locals
        }
        elseif ($remotes -gt $locals) {
            $ProcessCount = $remotes
        }
        else {
            $ProcessCount = $locals
        }

        [int]$Script:PhaseCount = 1

        if ($remote -gt $locals) {
            $ConfPhase2 = for ($i = 0; $i -lt $ProcessCount; $i++) {
                #[int]$loopcount = $i
                $remaddname = $LocalAddressNames[$i]

                for ($ii = 0; $ii -lt $local; $ii++) {
                    #$phasecount = $loopcount + $ii
                    $params = @{
                        DestinationAddressName = $RemoteAddressNames[$ii]
                        dhgroups               = $dhgroups
                        PhaseName              = $TunnelName + " P2 " + $Script:PhaseCount
                        Proposal               = $Proposal
                        SourceAddressName      = $remaddname
                        TTL                    = $TTL
                        TunnelName             = $TunnelName
                    }
                    New-P2PPhase2Interface @params
                    $Script:phasecount++
                }
            }
        }

        else {
            $ConfPhase2 = for ($i = 0; $i -lt $ProcessCount; $i++) {
                #[int]$loopcount = $i
                $locaddname = $LocalAddressNames[$i]

                for ($ii = 0; $ii -lt $remotes; $ii++) {
                    #$phasecount = $i + $ii
                    $params = @{
                        DestinationAddressName = $RemoteAddressNames[$ii]
                        dhgroups               = $dhgroups
                        PhaseName              = $TunnelName + " P2 " + $Script:PhaseCount
                        Proposal               = $Proposal
                        SourceAddressName      = $locaddname
                        TTL                    = $TTL
                        TunnelName             = $TunnelName
                    }
                    New-P2PPhase2Interface @params
                    $Script:phasecount++
                }
            }
        }

        #    #Create Static Routes
        #    $query4 = 'yes'
        #    $ConfStaticRoute = while ($query4 -eq 'yes') {
        #        if ($query4 -eq 'yes') {
        #            New-StaticRouteTunnel
        #        }
        #        $query4 = Read-Host "Do you want to create more static routes? (yes/no)"
        #    }
        #
        #    #Create Services
        #    $query5 = Read-Host "Do you need to create new service objects for use with the firewall policies? (yes/no)"
        #    $ConfService = while ($query5 -eq 'yes') {
        #        if ($query5 -eq 'yes') {
        #            $Protocol = Read-Host "Specify if this is a TCP or UDP Service (TCP/UDP)"
        #
        #            if ($Protocol -eq 'TCP') {
        #                $Params = @{
        #                    ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
        #                    TCPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
        #                }
        #            }
        #            if ($Protocol -eq 'UDP') {
        #                $Params = @{
        #                    ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
        #                    UDPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
        #                }
        #            }
        #
        #            New-ServiceObject @Params
        #        }
        #        $query5 = Read-Host "Do you want to create more services? (yes/no)"
        #    }
        #
        #    #Create Service Groups
        #    $query6 = Read-Host "Do you need to create a service group for use with Firewall Policies? (yes/no)"
        #    $ConfServiceGroup = while ($query6 -eq 'yes') {
        #        if ($query6 -eq 'yes') {
        #            New-ServiceGroup
        #        }
        #        $query6 = Read-Host "Do you want to create more service groups? (yes/no)"
        #    }
        #
        #    #Create Firewall Policies
        #    $ConfFirewallPolicy = New-FirewallPolicyTunnel
        #
    }

    end {
        Write-Host "----------OMIT THE ABOVE FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        Write-Output $ConfLocalAddressObjects
        Write-Output $ConfRemoteAddressObjects
        Write-Output $ConfLocalAddressGroups
        Write-Output $ConfRemoteAddressGroups
        Write-Output $ConfPhase1
        Write-Output $ConfPhase2
        #    Write-Output $ConfStaticRoute
        #    Write-Output $ConfService
        #    Write-Output $ConfServiceGroup
        #    Write-Output $ConfFirewallPolicy
        Write-Host "----------OMIT THE BELOW FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        Write-Host "DON'T FORGET TO ADD ANY REQUIRED CORE ROUTES!" -ForegroundColor Yellow

        $ErrorActionPreference = 'continue'
    }
}