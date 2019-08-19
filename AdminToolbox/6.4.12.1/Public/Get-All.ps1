function Get-All {
    <#
.Description
Gets function for all AdminToolbox Modules
#>

    Get-Command -module AdminToolbox, AdminToolbox.ActiveDirectory, AdminToolbox.EndpointManagement, AdminToolbox.Exchange, AdminToolbox.fftools, AdminToolbox.FileManagement, AdminToolbox.Fun, AdminToolbox.Networking, AdminToolbox.Office365, AdminToolbox.Remoting, AdminToolbox.Vmwareautomate

}