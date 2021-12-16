# New-LocalInPolicyTrusthosts Private function is called to set trusthosts for listed admins. Max integer loops are used to count up for all trusthosts and apply for all admins comma delimited. figure out a way to handle the variable amount of trust hosts that can be added.
# Trusted Hosts generate firewall objects and each of those are added to a object group.
# Service parameter takes x number of services, creates service objects, and puts them in a service group
## Create local-in allow policy
## Create local-in block policy

<#
    .Description
    The purpose of this function is to write a configuration script. The purpose of that configuration script will be to implement a localin restriction policy. A use case being to allow managing the firewall from a public interface, but only from permitted IP addresses. If you fully understand the config output you can leverage this for additional purposes related to localin policies.

    .Parameter Administrators
    Provide and array administrators that should be able to access the firewall by the services to be specified in another parameter.

    .Parameter PolicyName
    This is a string that will be used in parts of the config to avoid overwriting existing configurations. This must be unique.

    .Parameter Services
    Specify the Service or services that the local-in policy applies to.

    ex: "RDP/3389/TCP", "piov/5060-5061/UDP"

    .Parameter TrustedHosts
    Provide an array of CIDR addresses that should be able to acccess the firewall management interfaces using the services to be provided later.

    .Example
    $params = @{
        Administrators      = "AdminAccount01", "AdminAccount02"
        PolicyName          = "RemoteAccess"
        Services           = "HTTPS/443/TCP", "SSH/22/TCP"
        TrustedHosts        = "192.168.0.0/16", "172.16.0.0/12", "10.0.0.0/8"
    }
    New-LocalinPolicy @params

    This example will generate a VPN tunnel config.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
#>

function New-LocalinPolicy {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide and array administrators that should be able to login.")]
        [string[]]$administrators,
        [Parameter(Mandatory = $true, HelpMessage = "This PolicyName will be used to avoid overwriting existing address objects")]
        [string]$policyname,
        [Parameter(Mandatory = $false, HelpMessage = "Specify services in the following format. ex: ""RDP/3389/TCP"", ""piov/5060-5061/UDP""")]
        [string[]]$Services,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR addresses that should be able to acccess the firewall management interfaces.")]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        [string[]]$trustedhosts
    )

    #configure Trusted hosts
    New-LocalInPolicyTrustHosts -administrators $administrators -trustedhosts $trustedhosts

    #Create Address Objects for the Policy
    [int]$max = $trustedhosts.Count
    $addresses = for ($i = 0; $i -lt $max; $i++) {
        [PSCustomObject]@{
            Name = "LocalIn" + "_" + $PolicyName + "_" + $trustedhosts[$i]
            CIDR = $trustedhosts[$i]
        }
    }

    Foreach ($Address in $Addresses) {
        New-AddressObject -AddressName $Address.Name -CIDR $Address.CIDR
    }

    #Create Address Objects for the policy
    $LocNames = ($Addresses).name -join " "
    $LocalGroupName = "LocalIn_$policyname"
    New-AddressGroup -AddressNames $LocNames -GroupName $LocalGroupName

    #Create Services
    foreach ($service in $services) {
        $split = $service -split "/"

        if ($split[2] -eq 'TCP') {
            $Params = @{
                ServiceName  = "LocalIn_" + $PolicyName + "_" + $split[0]
                TCPPortRange = $split[1]
            }
        }

        if ($split[2] -eq 'UDP') {
            $Params = @{
                ServiceName  = "LocalIn_" + $PolicyName + "_" + $split[0]
                UDPPortRange = $split[1]
            }
        }
        New-ServiceObject @Params
    }

    #Create Service Groups
    $proc = $services -split "/"
    [int]$count = $proc.count
    $svcs = for ($i = 0; $i -lt $count) {
        "LocalIn_" + $PolicyName + "_" + $proc[$i]
        $i = $i + [int]3
    }
    $svcresult = $svcs -join " "
    $svcgroupname = "LocalIn_" + $PolicyName
    New-ServiceGroup -ServiceGroupName $svcgroupname -Members $svcresult
}