<#
    .DESCRIPTION
    Clears the local arp table

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Clear-Arp {
    #Check For Admin Privleges
    Get-Elevation

    netsh.exe interface ip delete arpcache
}