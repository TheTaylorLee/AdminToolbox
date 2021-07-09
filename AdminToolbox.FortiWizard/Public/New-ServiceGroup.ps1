Function New-ServiceGroup {
    <#
    .Description
    Create a new ServiceGroup Object

    .Parameter ServiceGroupName
    Specify a Unique name for the ServiceGroup Object

    .Parameter Members
    Specify the ServiceGroup Members

    .Example
    $Params = @{
    ServiceGroupName   = "ExchangeServers"
    TCPPortRange       = "Exchange01 Exchange02"
    }

    New-ServiceGroup @params

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$ServiceGroupName,
        [Parameter(Mandatory = $true)]$Members
    )

    Write-Output "
config firewall service group
    edit ""$ServiceGroupName""
        set member $Members
    next
end
"
}