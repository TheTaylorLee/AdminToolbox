<#
    .Description
    Returns useful informaion on the local endpoint or another.

    .NOTES
    Requires Powershell 5.1

    .Parameter Computer
    Specify a remote computer to get info for

    .EXAMPLE
    Get-PCinfo

    Returns PCinfo for the local computer

    .EXAMPLE
    Get-PCinfo -computer PCName

    Returns PCinfo for a remote computer

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-PCInfo {

    [CmdletBinding()]

    #Prompts for Computer Name
    Param (
        [parameter(Mandatory = $false)]$Computer
    )


    #Variables
    $SystemEnclosure = Get-CimInstance win32_systemenclosure -ComputerName $computer
    $OS = Get-CimInstance Win32_OperatingSystem -ComputerName $Computer


    #Creating Hash table from variables
    $PCInfo = @{
        Manufacturer   = $SystemEnclosure.Manufacturer
        PCName         = $OS.CSName
        OS             = $OS.Caption
        Architecture   = $OS.OSArchitecture
        AssetTag       = $systemenclosure.serialnumber
        OSVersion      = $OS.Version
        InstallDate    = $OS.InstallDate
        LastBootUpTime = $OS.LastBootUpTime
    }

    #Writing to Host
    Write-Host " "
    Write-Host "Computer Info" -ForegroundColor Cyan
    Write-Host "If not run on a Dell machine AssetTag is the Serial Number" -ForegroundColor Yellow

    #Display Hash Table
    $PCInfo.getenumerator() | Sort-Object -Property name | Format-Table -AutoSize

    #Writing to Host
    Write-Host "Computer Disk Info" -ForegroundColor Cyan

    #Display Drives
    Get-CimInstance win32_logicaldisk -Filter "drivetype=3" -computer $computer |
    Format-Table -Property DeviceID, Volumename, `
    @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
    @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
    @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }

    #Writing to Host
    Write-Host "Network Information" -ForegroundColor Cyan

    Get-CimInstance win32_networkadapterconfiguration -computer $computer | Where-Object { $null -ne $_.IPAddress } |
    Select-Object IPAddress, DefaultIPGateway, DNSServerSearchOrder, IPSubnet, MACAddress, Caption, DHCPEnabled, DHCPServer, DNSDomainSuffixSearchOrder |
    Format-List

}