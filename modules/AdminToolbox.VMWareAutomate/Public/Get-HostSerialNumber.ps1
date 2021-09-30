<#
    .DESCRIPTION
    Get serial numbers for VM Hosts

    .PARAMETER Host
    Host the Serial Number is bering retrieved from

    .EXAMPLE
    Get-HostSerialNumber

    .NOTES
    Requires the VMware.PowerCLI Module \

    Connect to Host or Vcenter First

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-HostSerialNumber {

    Param (
        [Parameter(Mandatory = $false)]$Host
    )

    New-VIProperty -ObjectType VMHost -Name SerialNumber -Value { (Get-EsxCli -VMHost $Args[0]).hardware.platform.get().SerialNumber }
    Get-VMHost $Host | Select-Object Name, SerialNumber | Format-Table
}