<#
    .DESCRIPTION
    Adds a list of routes to an Azure route table, all with the same route type and nexthopipaddress if applicable.

    .Parameter CIDRs
    String Array of routes to be added.

    .Parameter NextHopType
    The type of Azure next hop (e.g., VirtualAppliance, Internet, VnetLocal, None).

    .Parameter NextHopIpAddress
    The IP address of the next hop (required if NextHopType is VirtualAppliance).

    .EXAMPLE
    Connect-AzAccount

    $context = Get-AzSubscription | Out-GridView -PassThru -Title "Pick the subscription being worked on"
    Set-AzContext $context.id
    $rg = Get-AzResourceGroup | Out-GridView -PassThru -Title "Set the resource group that you'll be working in"
    Set-AzDefault -ResourceGroupName $rg.Resourcegroupname

    Add-AzRoutesToRouteTable -NextHopType "VirtualAppliance" -NextHopIpAddress "9.9.9.9" -CIDRs "1.1.1.1/32", "8.8.8.8/24"

    Disconnect-AzAccount

    Connect to Azure, set the subscription and resourcegroup, select the routetable, add the routes, then disconnect.

    .NOTES
    https://github.com/thetaylorlee/admintoolbox
#>

function Add-AzRoutesToRouteTable {
    param(
        [Parameter(Mandatory)]
        [string[]]$CIDRs,
        [Parameter(Mandatory)]
        [ValidateSet("VirtualAppliance", "Internet", "VnetLocal", "None")]
        [string]$NextHopType,
        [string]$NextHopIpAddress
    )

    $routeTable = Get-AzRouteTable | Out-GridView -PassThru -Title "Pick the route table for adding routes to"

    foreach ($cidr in $cidrs) {
        $routeName = $cidr.Replace("/", "-").Replace(".", "-")
        $routeParams = @{
            Name          = $routeName
            AddressPrefix = $cidr
            NextHopType   = $NextHopType
        }
        if ($NextHopType -eq "VirtualAppliance" -and $NextHopIpAddress) {
            $routeParams["NextHopIpAddress"] = $NextHopIpAddress
        }
        $routeTable = Add-AzRouteConfig -RouteTable $routeTable @routeParams
    }

    # List the routes
    Get-AzRouteConfig -RouteTable $routeTable | Format-Table

    # Apply the routes
    Set-AzRouteTable -RouteTable $routeTable
}