<#
    .Description
    Gets the size of connected monitors

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-MonitorSizes {

    Get-WmiObject -Namespace root\wmi -Class WmiMonitorBasicDisplayParams |
    Select-Object @{ N = "Computer"; E = { $_.__SERVER } },
    InstanceName, @{ N = "Horizonal"; E = { [System.Math]::Round(($_.MaxHorizontalImageSize / 2.54), 2) } },
    @{ N = "Vertical"; E = { [System.Math]::Round(($_.MaxVerticalImageSize / 2.54), 2) } },
    @{N = "Size"; E = { [System.Math]::Round(([System.Math]::Sqrt([System.Math]::Pow($_.MaxHorizontalImageSize, 2) + [System.Math]::Pow($_.MaxVerticalImageSize, 2)) / 2.54), 2) } },
    @{N = "Ratio"; E = { [System.Math]::Round(($_.MaxHorizontalImageSize) / ($_.MaxVerticalImageSize), 2) } }
}