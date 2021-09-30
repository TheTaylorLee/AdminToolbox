<#
    .DESCRIPTION
    Collects multiple VM details across several functions and produces that info using PSCustomObject. Set the context of this command prior to running it. That can be done by using Set-Subscription function. That function is part of the Admintoolbox.office365 module.

    .EXAMPLE
    Get-VMdetails

    .NOTES
    Requires the AZ and Admintoolbox.Office365 module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-VMDetails {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)][switch]$SetSubscription
    )

    if ($SetSubscription) {
        #Set the subscription - Set-AzContext
        Write-Host "Select the subscription containing the VM's" -ForegroundColor Green
        Set-Subscription
    }

    #Will produce IP info and hostname. Expand on this command to include more details
    $results = foreach ( $azVM in Get-AzVM | Select-Object * ) {
        try {
            $networkProfile = $azVm.NetworkProfile.NetworkInterfaces.id.Split("/") | Select-Object -Last 1
            $IPconfig = Get-AzNetworkInterface -Name $networkProfile
            $nsg = ($IPConfig).NetworkSecurityGroup.id

            [pscustomobject]@{
                VMName               = $azVm.Name
                ipaddress            = ($IPconfig).IpConfigurations.PrivateIpAddress
                DNS                  = ($IPconfig).DnsSettings.AppliedDnsServers
                MacAddress           = ($IPconfig).MacAddress
                NetworkSecurityGroup = $nsg.split("/") | Select-Object -Last 1
                ResourceGroup        = $azVM.ResourceGroupName
                Location             = $azVM.Location
                Tags                 = $azVM.Tags
                Vmsize               = ($azVm | Select-Object hardwareprofile).HardwareProfile.vmsize
                Type                 = $azVM.Type
            }
        }
        catch {
            $_
        }

    }

    $results
}