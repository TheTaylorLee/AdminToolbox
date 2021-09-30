<#
    .DESCRIPTION
    Opens an mmc concsole with most commonly used MMC Snap-ins for admin functions

    .EXAMPLE
    Open-AdminMMC

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>
Function Open-AdminMMC {
    Start-Process AdminMMC.msc
}