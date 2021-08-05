function Clear-Arp {
    <#
    .DESCRIPTION
    Clears the local arp table

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    #Check For Admin Privleges
    Get-Elevation

    netsh.exe interface ip delete arpcache
}