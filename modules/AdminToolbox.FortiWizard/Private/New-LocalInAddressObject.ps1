#Required By Function
#New-LocalInPolicy

Function New-LocalInAddressObject {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$AddressName,
        [Parameter(Mandatory = $true)]
        [ValidateScript( {
                if ($_ -match '^[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[.]{1}[0-9]{1,3}[/]{1}[0-9]{1,2}$') {
                    $true
                }
                else {
                    throw "$_ is an invalid pattern. You must provide a proper CIDR format. ex: 192.168.0.0/24"
                }
            })]
        $CIDR
    )

    $calc = Invoke-PSipcalc $cidr
    $IPAddress = ($calc).IP
    $SubnetMask = ($calc).SubnetMask

    Write-Output "
config firewall address
    edit ""$AddressName""
        set subnet $IPAddress $SubnetMask
        set allow-routing enable
    next
end"
}