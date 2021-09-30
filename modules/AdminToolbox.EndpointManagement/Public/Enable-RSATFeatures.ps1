<#
    .DESCRIPTION
    Enables Remote Server Administration Tools On Windows 10 PC's.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Enable-RSATFeatures {

    #Check for Admin Privleges
    Get-Elevation

    #Install RSAT Features
    Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

    #Update the help after
    Update-Help
}