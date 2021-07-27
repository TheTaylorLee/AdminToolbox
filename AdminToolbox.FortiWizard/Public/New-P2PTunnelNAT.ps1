<#
$params = @{
    dhgroups           = "5", "14"
    #LANInterface       = "port1"
    LocalAddressCIDRs  = "192.168.10.0/24", "192.168.11.0/24", "192.168.12.0/24"
    PeerAddress        = "56.98.75.32"
    Proposal           = "aes256-sha512"
    PSK                = "dfdayb%^4356456"
    RemoteAddressCIDRs = "10.10.240.0/24", "10.10.241.0/24", "10.10.242.0/24"
    #Services           = "RDP/3389/TCP", "DNS/53/UDP"
    TTL                = "28800"
    TunnelName         = "TestTunnel"
    WANInterface       = "wan3"
    }
    New-P2PTunnelNAT @params
#>

Function New-P2PTunnelNAT {
    <#
    .Description
    This is a CLI wizard that generates a new IPSec Tunnel Config and related objects. The source Subnet will be Natted by this policy.

    .Example
    New-P2PTunnelNAT

    .Example
    This example generates an SSH session and invokes the output of this function against that session.

    New-SSHSession -computername 192.168.0.1
    $command = New-P2PTunnelNAT
    $result = Invoke-SSHCommand -Command $command -SessionId 0
    $result.output

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
        #Create Phase 1 Proposal
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


        #REVIEW EXISTING CONFIG SCRIPT AND CONSIDER HOW BEST TO HANDLE THE FUNCTION FLOW.
        #REVIEW EXISTING CONFIG SCRIPT AND CONSIDER HOW BEST TO HANDLE THE FUNCTION FLOW.
        #REVIEW EXISTING CONFIG SCRIPT AND CONSIDER HOW BEST TO HANDLE THE FUNCTION FLOW.
        #REVIEW EXISTING CONFIG SCRIPT AND CONSIDER HOW BEST TO HANDLE THE FUNCTION FLOW.
        #REVIEW EXISTING CONFIG SCRIPT AND CONSIDER HOW BEST TO HANDLE THE FUNCTION FLOW.

        #
        #        #Create Address Group
        #        Write-Host "Creating Address Groups Config" -ForegroundColor Cyan
        #        $query2 = Read-Host "Do you want to create one or more Address Groups? (yes/no)"
        #        $AddressGroups = while ($query2 -eq 'yes') {
        #            if ($query2 -eq 'yes') {
        #                New-AddressGroup
        #            }
        #            $query2 = Read-Host "Do you want to create more Address Groups? (yes/no)"
        #        }
        #        Write-Host $AddressGroups
        #
        #        #Create IP Pool
        #        Write-Host "Creating IPPool (Source NAT)" -ForegroundColor Cyan
        #        $query7 = 'yes'
        #        $IPPool = while ($query7 -eq 'yes') {
        #            if ($query7 -eq 'yes') {
        #                New-IPPoolFixedRange
        #            }
        #            $query7 = Read-Host "Did you run into an error and still need to add an IPPool? (yes/no)"
        #        }
        #        Write-Host $IPPool
        #
        #        #Create VIPRange
        #        Write-Host "Creating VIPRange (Destination NAT)" -ForegroundColor Cyan
        #        $query7 = 'yes'
        #        $VIPRange = while ($query7 -eq 'yes') {
        #            if ($query7 -eq 'yes') {
        #                New-VIPRange
        #            }
        #            $query7 = Read-Host "Did you run into an error and still need to add a VIP Range? (yes/no)"
        #        }
        #        Write-Host $VIPRange
        #
        #        #Create Phase 2 Interfaces
        #        Write-Host "Creating Phase 2 Interfaces Config" -ForegroundColor Cyan
        #        $query3 = 'yes'
        #        $Phase2 = while ($query3 -eq 'yes') {
        #            if ($query3 -eq 'yes') {
        #                New-P2PPhase2Interface
        #            }
        #            $query3 = Read-Host "Do you want to create more Phase 2 Interfaces? (yes/no)"
        #        }
        #        Write-Host $Phase2
        #
        #        #Create Static Routes
        #        Write-Host "Creating Static Routes Config" -ForegroundColor Cyan
        #        $query4 = 'yes'
        #        $StaticRoute = while ($query4 -eq 'yes') {
        #            if ($query4 -eq 'yes') {
        #                New-StaticRouteTunnel
        #            }
        #            $query4 = Read-Host "Do you want to create more static routes? (yes/no)"
        #        }
        #        Write-Host $StaticRoute
        #
        #        #Create Services
        #        Write-Host "Creating Services Config" -ForegroundColor Cyan
        #        $query5 = Read-Host "Do you need to create new service objects for use with the firewall policies? (yes/no)"
        #        $Service = while ($query5 -eq 'yes') {
        #            if ($query5 -eq 'yes') {
        #                $Protocol = Read-Host "Specify if this is a TCP or UDP Service (TCP/UDP)"
        #
        #                if ($Protocol -eq 'TCP') {
        #                    $Params = @{
        #                        ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
        #                        TCPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
        #                    }
        #                }
        #                if ($Protocol -eq 'UDP') {
        #                    $Params = @{
        #                        ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
        #                        UDPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
        #                    }
        #                }
        #
        #                New-ServiceObject @Params
        #            }
        #            $query5 = Read-Host "Do you want to create more services? (yes/no)"
        #        }
        #        Write-Host $Service
        #
        #        #Create Service Groups
        #        Write-Host "Creating Service Groups Config" -ForegroundColor Cyan
        #        $query6 = Read-Host "Do you need to create a service group for use with Firewall Policies? (yes/no)"
        #        $ServiceGroup = while ($query6 -eq 'yes') {
        #            if ($query6 -eq 'yes') {
        #                New-ServiceGroup
        #            }
        #            $query6 = Read-Host "Do you want to create more service groups? (yes/no)"
        #        }
        #        Write-Host $ServiceGroup
        #
        #        #Create Firewall Policies
        #        Write-Host "Creating Firewall Policy Config" -ForegroundColor Cyan
        #        $FirewallPolicy = New-FirewallPolicyTunnelNAT
        #        Write-Host $FirewallPolicy
    }

    end {
        Write-Host "If there is no text between the Omission lines, then you have redirected the output." -ForegroundColor Green
        Write-Host "----------OMIT THE ABOVE FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        Write-Output $ConfPhase1
        Write-Output $ConfLocalAddressObjects
        Write-Output $ConfRemoteAddressObjects
        # Write-Output $AddressGroups
        # Write-Output $IPPool
        # Write-Output $VIPRange
        # Write-Output $Phase2
        # Write-Output $StaticRoute
        # Write-Output $Service
        # Write-Output $ServiceGroup
        # Write-Output $FirewallPolicy
        Write-Host "----------OMIT THE BELOW FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
        Write-Host "DON'T FORGET TO ADD ANY REQUIRED CORE ROUTES!" -ForegroundColor Yellow

        $ErrorActionPreference = 'continue'
    }
}