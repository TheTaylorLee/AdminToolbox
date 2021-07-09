Function New-P2PTunnelNAT {
    <#
    .Description
    This is a CLI wizard that generates a new IPSec Tunnel Config and related objects. The source Subnet will be Natted by this policy.

    .Example
    New-P2PTunnelNAT

    .Notes
    Capitalization and spacing is very important when running this function. Typos should also be avoided. Any errors resultant from adding spaces, creating typos, or not focusing on persisint casing will lead to errors. The function will fail, or the config script when pushed to the firewall will fail to produce desired results.

    Better parameter validation may be added in future versions of this function.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>
    $ErrorActionPreference = 'inquire'

    Write-Host "Each function called by this VPN wizard will write to host it's config. This is for referencing as other functions are called. When this wizard is complete, the full config will be written as output for manipulation and use." -ForegroundColor Green
    Write-Host ""

    #Create Phase 1 Interface
    Write-Host "Creating Phase 1 Interface Config" -ForegroundColor Cyan
    $Phase1 = New-P2PPhase1Interface
    Write-Host $Phase1

    #Create Address Objects
    Write-Host "Creating Address Objects Config" -ForegroundColor Cyan
    $query = Read-Host "Do you want to create one or more Address Objects? (yes/no)"
    $AddressObjects = while ($query -eq 'yes') {
        if ($query -eq 'yes') {
            New-AddressObject
        }
        $query = Read-Host "Do you want to create more Address Objects? (yes/no)"
    }
    Write-Host $AddressObjects

    #Create Address Group
    Write-Host "Creating Address Groups Config" -ForegroundColor Cyan
    $query2 = Read-Host "Do you want to create one or more Address Groups? (yes/no)"
    $AddressGroups = while ($query2 -eq 'yes') {
        if ($query2 -eq 'yes') {
            New-AddressGroup
        }
        $query2 = Read-Host "Do you want to create more Address Groups? (yes/no)"
    }
    Write-Host $AddressGroups

    #Create IP Pool
    Write-Host "Creating IPPool (Source NAT)" -ForegroundColor Cyan
    $query7 = 'yes'
    $IPPool = while ($query7 -eq 'yes') {
        if ($query7 -eq 'yes') {
            New-IPPoolFixedRange
        }
        $query7 = Read-Host "Did you run into an error and still need to add an IPPool? (yes/no)"
    }
    Write-Host $IPPool

    #Create VIPRange
    Write-Host "Creating VIPRange (Destination NAT)" -ForegroundColor Cyan
    $query7 = 'yes'
    $VIPRange = while ($query7 -eq 'yes') {
        if ($query7 -eq 'yes') {
            New-VIPRange
        }
        $query7 = Read-Host "Did you run into an error and still need to add a VIP Range? (yes/no)"
    }
    Write-Host $VIPRange

    #Create Phase 2 Interfaces
    Write-Host "Creating Phase 2 Interfaces Config" -ForegroundColor Cyan
    $query3 = 'yes'
    $Phase2 = while ($query3 -eq 'yes') {
        if ($query3 -eq 'yes') {
            New-P2PPhase2Interface
        }
        $query3 = Read-Host "Do you want to create more Phase 2 Interfaces? (yes/no)"
    }
    Write-Host $Phase2

    #Create Static Routes
    Write-Host "Creating Static Routes Config" -ForegroundColor Cyan
    $query4 = 'yes'
    $StaticRoute = while ($query4 -eq 'yes') {
        if ($query4 -eq 'yes') {
            New-StaticRouteTunnel
        }
        $query4 = Read-Host "Do you want to create more static routes? (yes/no)"
    }
    Write-Host $StaticRoute

    #Create Services
    Write-Host "Creating Services Config" -ForegroundColor Cyan
    $query5 = Read-Host "Do you need to create new service objects for use with the firewall policies? (yes/no)"
    $Service = while ($query5 -eq 'yes') {
        if ($query5 -eq 'yes') {
            $Protocol = Read-Host "Specify if this is a TCP or UDP Service (TCP/UDP)"

            if ($Protocol -eq 'TCP') {
                $Params = @{
                    ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
                    TCPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
                }
            }
            if ($Protocol -eq 'UDP') {
                $Params = @{
                    ServiceName  = Read-Host "Specify the ServiceName (Service Name)"
                    UDPPortRange = Read-Host "Specify the port or Port range. eg 443 or 443-445 (Port)"
                }
            }

            New-ServiceObject @Params
        }
        $query5 = Read-Host "Do you want to create more services? (yes/no)"
    }
    Write-Host $Service

    #Create Service Groups
    Write-Host "Creating Service Groups Config" -ForegroundColor Cyan
    $query6 = Read-Host "Do you need to create a service group for use with Firewall Policies? (yes/no)"
    $ServiceGroup = while ($query6 -eq 'yes') {
        if ($query6 -eq 'yes') {
            New-ServiceGroup
        }
        $query6 = Read-Host "Do you want to create more service groups? (yes/no)"
    }
    Write-Host $ServiceGroup

    #Create Firewall Policies
    Write-Host "Creating Firewall Policy Config" -ForegroundColor Cyan
    $FirewallPolicy = New-FirewallPolicyTunnelNAT
    Write-Host $FirewallPolicy

    Write-Host "----------OMIT THE ABOVE FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
    Write-Output $Phase1
    Write-Output $AddressObjects
    Write-Output $AddressGroups
    Write-Output $IPPool
    Write-Output $VIPRange
    Write-Output $Phase2
    Write-Output $StaticRoute
    Write-Output $Service
    Write-Output $ServiceGroup
    Write-Output $FirewallPolicy
    Write-Host "----------OMIT THE BELOW FROM USE IN YOUR CONFIG SCRIPT----------" -ForegroundColor Magenta
    Write-Host "If there is no output between the Omission delimiters, that is because you redirected the output elsewhere. Like into a variable." -ForegroundColor Green
    Write-Host "DON'T FORGET TO ADD ANY REQUIRED CORE ROUTES!" -ForegroundColor Yellow

    $ErrorActionPreference = 'continue'
}