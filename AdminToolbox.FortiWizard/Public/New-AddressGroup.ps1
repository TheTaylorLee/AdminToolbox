Function New-AddressGroup {
    <#
    .Description
    Create a New Address Object

    .Parameter AddressNames
    Specify AddressNames that are to be a member of this group. Space delimited and the full string wrapped in only one set of quotes.

    .Parameter GroupName
    The Name of the AddressGroup

    .Example
    $Params = @{
    AddressNames = "vlan10 vlan100 vlan 110 vlan200"
    GroupName    = "Internal_Vlans"
    }

    New-AddressGroup @params

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$GroupName,
        [Parameter(Mandatory = $true)]$AddressNames
    )

    Write-Output "
#Create Address Group

config firewall addrgrp
    edit ""$GroupName""
        set member $AddressNames
        set allow-routing enable
    next
end
"
}