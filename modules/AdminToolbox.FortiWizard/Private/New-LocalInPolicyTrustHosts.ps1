#Required By Function
#New-LocalInPolicy

function New-LocalInPolicyTrustHosts {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "Provide and array administrators that should be able to login.")]
        [string[]]$administrators,
        [Parameter(Mandatory = $true, HelpMessage = "Provide an array of CIDR addresses that should be able to acccess the firewall management interfaces")]
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

    #For loop to handle config for each administrators
    $countadmin = ($administrators).count
    for ($i = 0; $i -lt $countadmin; $i++) {

        #Write trusted host output to variable
        $count = ($trustedhosts).count
        $hosts = for ($ii = 0; $ii -lt $count; $ii++) {
            #Subnet Math Calculation
            $cidr = $trustedhosts[$ii]
            $calc = Invoke-PSipcalc $cidr
            $IPAddress = ($calc).IP
            $SubnetMask = ($calc).SubnetMask

            #Calculate Trusted Host Integer
            $hostcalc = $ii + 1

            Write-Output "        set trusthost$hostcalc $IPAddress $SubnetMask"
        }

        # Write Config Output
        $adminname = $administrators[$i]
        Write-Output "config system admin
    edit $adminname"
        $hosts
        Write-Output "    next
end"
    }
}