function Clear-Arp {
    <#
    .DESCRIPTION
    Clears the local arp table

    .Link
    Clear-DNSClientCache
    Get-DNSClientCache
    Get-NetIPConfiguration
    Get-NetworkStatistics
    Get-PublicIP
    Resolve-DNSName
    Test-Netconnection
    #>

    #Check For Admin Privleges
    Get-Elevation

    netsh.exe interface ip delete arpcache
}