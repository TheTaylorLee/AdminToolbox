<#
    .DESCRIPTION
    This function will return Network Interface configuration information. Including DNS Over HTTPS Information!

    .Example
    Get-NICConfig | where-object {$_.status -eq 'up'}

    Returns Details only for online interfaces

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>


function Get-NICConfig {

    [CmdletBinding()]
    Param (
    )

    $interfaces = Get-NetAdapter | Select-Object InterfaceAlias, InterfaceGuid, Status, Linkspeed, MediaConnectionState, mediatype, ifDesc, ifindex
    foreach ($interface in $interfaces) {
        $iguid = ($interface).interfaceguid

        $cimdetails = Get-CimInstance win32_networkadapterconfiguration |
        Where-Object { $_.SettingID -eq $iguid } |
        Select-Object IPAddress, DefaultIPGateway, DNSServerSearchOrder, IPSubnet, MACAddress, DHCPEnabled, DHCPServer, DNSDomainSuffixSearchOrder

        $DOHServers = (Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\$iguid\DohinterfaceSettings\doh\" -ErrorAction SilentlyContinue).pschildname

        if ($null -ne $DOHServers) {
            foreach ($DOHServer in $DOHServers) {
                if ((Get-ItemProperty -Path "Registry::HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\$iguid\DohinterfaceSettings\doh\$DOHServer" -Name DohFlags).dohflags -eq '1') {
                    [pscustomobject]@{
                        Index                      = $interface.ifindex
                        Interface                  = $interface.InterfaceAlias
                        Status                     = $interface.Status
                        MediaConnectionState       = $interface.MediaConnectionState
                        LinkSpeed                  = $interface.LinkSpeed
                        MediaType                  = $interface.MediaType
                        Description                = $interface.ifDesc
                        DoHEnabled                 = 'true'
                        DoHServer                  = $DOHServer
                        DoHTemplate                = (Get-ItemProperty -Path "Registry::HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\$iguid\DohinterfaceSettings\doh\$DOHServer" -Name DohTemplate).DohTemplate
                        MACAddress                 = $cimdetails.MACAddress
                        IPAddress                  = $cimdetails.IPAddress
                        Subnet                     = $cimdetails.IPSubnet
                        Gateway                    = $cimdetails.DefaultIPGateway
                        DNSServerSearchOrder       = $cimdetails.DNSServerSearchOrder
                        DNSDomainSuffixSearchOrder = $cimdetails.DNSDomainSuffixSearchOrder
                        DHCPEnabled                = $cimdetails.DHCPEnabled
                        DHCPServer                 = $cimdetails.DHCPServer
                    }
                }
                else {
                    [pscustomobject]@{
                        Index                      = $interface.ifindex
                        Interface                  = $interface.InterfaceAlias
                        Status                     = $interface.Status
                        MediaConnectionState       = $interface.MediaConnectionState
                        LinkSpeed                  = $interface.LinkSpeed
                        MediaType                  = $interface.MediaType
                        Description                = $interface.ifDesc
                        DoHEnabled                 = 'false'
                        DoHServer                  = $null
                        DoHTemplate                = $null
                        MACAddress                 = $cimdetails.MACAddress
                        IPAddress                  = $cimdetails.IPAddress
                        Subnet                     = $cimdetails.IPSubnet
                        Gateway                    = $cimdetails.DefaultIPGateway
                        DNSServerSearchOrder       = $cimdetails.DNSServerSearchOrder
                        DNSDomainSuffixSearchOrder = $cimdetails.DNSDomainSuffixSearchOrder
                        DHCPEnabled                = $cimdetails.DHCPEnabled
                        DHCPServer                 = $cimdetails.DHCPServer
                    }
                }
            }
        }
        else {
            [pscustomobject]@{
                Index                      = $interface.ifindex
                Interface                  = $interface.InterfaceAlias
                Status                     = $interface.Status
                MediaConnectionState       = $interface.MediaConnectionState
                LinkSpeed                  = $interface.LinkSpeed
                MediaType                  = $interface.MediaType
                Description                = $interface.ifDesc
                DoHEnabled                 = 'false'
                DoHServer                  = $null
                DoHTemplate                = $null
                MACAddress                 = $cimdetails.MACAddress
                IPAddress                  = $cimdetails.IPAddress
                Subnet                     = $cimdetails.IPSubnet
                Gateway                    = $cimdetails.DefaultIPGateway
                DNSServerSearchOrder       = $cimdetails.DNSServerSearchOrder
                DNSDomainSuffixSearchOrder = $cimdetails.DNSDomainSuffixSearchOrder
                DHCPEnabled                = $cimdetails.DHCPEnabled
                DHCPServer                 = $cimdetails.DHCPServer
            }
        }
    }
}