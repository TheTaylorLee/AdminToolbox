function Get-PCInfo {

    <#
    .Description
    Returns useful informaion on the local endpoint or another.

    .NOTES
    Requires Powershell 5.1

    .Parameter Computer
    Specify a remote computer to get info for

    .EXAMPLE
    Returns PCinfo for the local computer

    Get-PCinfo

    .EXAMPLE
    Returns PCinfo for a remote computer

    Get-PCinfo -computer PCName

    .Link
    Get-ADInfo
    #>

    [CmdletBinding()]

    #Prompts for Computer Name
    Param (
        [parameter(Mandatory = $false)]$Computer
    )


    #Variables
    $SystemEnclosure = Get-CimInstance win32_systemenclosure -computername $computer
    $OS = Get-CimInstance Win32_OperatingSystem -Computername $Computer


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
    Write-Host "Computer Info" -Foregroundcolor Cyan
    Write-Host "If not run on a Dell machine AssetTag is the Serial Number" -Foregroundcolor Yellow

    #Display Hash Table
    $PCInfo.getenumerator() | Sort-Object -property name | Format-Table -autosize

    #Writing to Host
    Write-Host "Computer Disk Info" -Foregroundcolor Cyan

    #Display Drives
    Get-CimInstance win32_logicaldisk -filter "drivetype=3" -computer $computer |
    Format-Table -Property DeviceID, Volumename, `
    @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
    @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
    @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }

    #Writing to Host
    Write-Host "Network Information" -Foregroundcolor Cyan

    Get-CimInstance win32_networkadapterconfiguration -computer $computer | Where-Object { $null -ne $_.IPAddress } |
    Select-Object IPAddress, DefaultIPGateway, DNSServerSearchOrder, IPSubnet, MACAddress, Caption, DHCPEnabled, DHCPServer, DNSDomainSuffixSearchOrder |
    Format-List

}