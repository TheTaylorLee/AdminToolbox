function Get-Networking {

    Get-IntroNet

    Write-Host "DNS Management"                                                                              -ForegroundColor green
    Write-Host "Clear-DNSClientCache       ..Clears the DNS Cache"                                           -ForegroundColor cyan
    Write-Host "Get-DNSClientCache         ..Gets the DNS Cache"                                             -ForegroundColor cyan
    Write-Host "Resolve-DNSName            ..Resolves DNS and filter for record type"                        -ForegroundColor cyan
    Write-Host " "

    Write-Host "Networking Functions"                                                                        -ForegroundColor green
    Write-Host "Get-MacVendor              ..Gets Mac OUIs, Mac Addresses, IP Addresses, and Hostnames "     -ForegroundColor cyan
    Write-Host "Get-NetworkStatistics      ..Gets active connections and associated processes"               -ForegroundColor cyan
    Write-Host "Get-PublicIP               ..Gets Public IP info and Geolocation"                            -ForegroundColor cyan
    Write-Host "Get-Whois                  ..Gets whois information for an IP address or DNS Name"           -ForegroundColor cyan
    Write-Host "Invoke-Ethr                ..Invoke crescendo wrapped function for Microsoft Ethr"           -ForegroundColor cyan
    Write-Host "Invoke-Iperf               ..Invoke crescendo wrapped function for Iperf3"                   -ForegroundColor cyan
    Write-Host "Invoke-Monitor             ..Invokes a service Monitor for tracking when it comes online"    -ForegroundColor cyan
    Write-Host "Invoke-NetworkScan         ..Invoke a network scan for Hostnames, IPv4, MAC, OUI, and Ports" -ForegroundColor cyan
    Write-Host "Invoke-PSipcalc            ..Invoke CIDR IP Calculator"                                      -ForegroundColor cyan
    Write-Host "Reset-NetworkAdapter       ..Reset Network Adapters"                                         -ForegroundColor cyan
    Write-Host "Reset-NetworkStack         ..Reset TCP/IP and Winsock"                                       -ForegroundColor cyan
    Write-Host "Show-IpInfo                ..Shows Address Spaces and a CIDR Table"                          -ForegroundColor cyan
    Write-Host "Start-Speedtest            ..Starts a wan speed test"                                        -ForegroundColor cyan
    Write-Host "Start-TraceNG              ..Starts a trace route tool"                                      -ForegroundColor cyan
    Write-Host "Test-Netconnection         ..Tests Ping, Traceroute, Route Diagnosing, and Port Testing"     -ForegroundColor cyan
    Write-Host " "

    Write-Host "Route Management"                                                                            -ForegroundColor green
    Write-Host "Get-NetRoute               ..Gets the IP route table"                                        -ForegroundColor cyan
    Write-Host "New-NetRoute               ..New Address for the IP route table"                             -ForegroundColor cyan
    Write-Host "Remove-NetNeighbor         ..Removes the local arp Cache"                                    -ForegroundColor cyan
    Write-Host "Remove-NetRoute            ..Remove IP address from the IP route table"                      -ForegroundColor cyan
    Write-Host "Set-NetRoute               ..Sets/Updates and IP route"                                      -ForegroundColor cyan
    Write-Host " "
}
