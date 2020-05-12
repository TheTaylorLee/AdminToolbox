function Get-Networking {

    Get-IntroNet

    Write-Host "DNS Management"                                                                              -Foregroundcolor green
    Write-Host "Clear-DNSClientCache       ..Clears the DNS Cache"                                           -Foregroundcolor cyan
    Write-Host "Get-DNSClientCache         ..Gets the DNS Cache"                                             -Foregroundcolor cyan
    Write-Host "Resolve-DNSName            ..Resolves DNS and filter for record type"                        -Foregroundcolor cyan
    Write-Host " "

    Write-Host "Networking Functions"                                                                        -Foregroundcolor green
    Write-Host "Get-MacVendor              ..Gets Mac OUIs, Mac Addresses, IP Addresses, and Hostnames "     -Foregroundcolor cyan
    Write-Host "Get-NetworkStatistics      ..Gets active connections and associated processes"               -Foregroundcolor cyan
    Write-Host "Get-PublicIP               ..Gets Public IP info and Geolocation"                            -ForegroundColor cyan
    Write-Host "Get-Whois                  ..Gets whois information for an IP address or DNS Name"           -ForegroundColor cyan
    Write-Host "Invoke-Monitor             ..Invokes a service Monitor for tracking when it comes online"    -ForegroundColor cyan
    Write-Host "Invoke-NetworkScan         ..Invoke a network scan for Hostnames, IPv4, MAC, OUI, and Ports" -ForegroundColor cyan
    Write-Host "Invoke-PSNmap              ..Invoke nmap scan on targets"                                    -ForegroundColor cyan
    Write-Host "Invoke-PSipcalc            ..Invoke CIDR IP Calculator"                                      -ForegroundColor cyan
    Write-Host "Reset-NetworkAdapter       ..Reset Network Adapters"                                         -Foregroundcolor cyan
    Write-Host "Reset-NetworkStack         ..Reset TCP/IP and Winsock"                                       -Foregroundcolor cyan
    Write-Host "Start-Iperf                ..Starts an Iperf client or host bandwidth test"                  -Foregroundcolor cyan
    Write-Host "Start-Speedtest            ..Starts a wan speed test"                                        -ForegroundColor cyan
    Write-Host "Test-Netconnection         ..Tests Ping, Traceroute, Route Diagnosing, and Port Testing"     -Foregroundcolor cyan
    Write-Host " "

    Write-Host "Route Management"                                                                            -Foregroundcolor green
    Write-Host "Get-NetRoute               ..Gets the IP route table"                                        -Foregroundcolor cyan
    Write-Host "New-NetRoute               ..New Address for the IP route table"                             -Foregroundcolor cyan
    Write-Host "Remove-NetNeighbor         ..Removes the local arp Cache"                                    -Foregroundcolor cyan
    Write-Host "Remove-NetRoute            ..Remove IP address from the IP route table"                      -Foregroundcolor cyan
    Write-Host "Set-NetRoute               ..Sets/Updates and IP route"                                      -Foregroundcolor cyan
    Write-Host " "
}
