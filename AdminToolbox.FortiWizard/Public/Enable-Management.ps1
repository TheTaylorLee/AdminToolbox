Function Enable-Management {

    <#
    .Description
    Configures trusted hosts that the admin account may connect from and enables management from the WAN interface!

    .Parameter ConfigFilePath
    Location to save the outputted config file to. The output will append an existing file if the path matches

    .Parameter WANInterfaceName
    Name of the Wan Interface

    .Example
    $Params = @{
    AdminUsername    = "admin"
    WANInterfaceName = "port1"
    }

    Enable-Management @Params

    .Link
    https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)][string]$AdminUsername = "admin",
        [Parameter(Mandatory = $true)]$WANInterfaceName
    )


    Write-Output "
#Enable Management from Interface ($WANInterfaceName) and configure trusted hosts for the admin account ($AdminUsername)

config system admin
    edit ""$AdminUsername""
        set trusthost1 10.0.0.0 255.0.0.0
        set trusthost2 192.168.0.0 255.255.0.0
        set trusthost3 172.16.0.0 255.240.0.0
    next
end

config system interface
    edit ""$WANInterfaceName""
        set allowaccess ping https ssh ftm
    next
end"
}