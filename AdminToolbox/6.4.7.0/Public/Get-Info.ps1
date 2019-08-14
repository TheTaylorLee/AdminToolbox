function Get-Info {

    [CmdletBinding()]
    [Alias("Get-AdminToolbox")]
    param (
    )

    Write-Host " "
    Write-Host "To Get all Commands and more..."                                                                    -Foregroundcolor green
    Write-Host " "
    Write-Host "Get-All                           ..Gets all module commands"                              -Foregroundcolor cyan
    Write-Host "Get-Full                          ..Gets full help for selected module command"            -Foregroundcolor cyan
    Write-Host "Start-Application                 ..Start an application from powerhsell with ease"        -Foregroundcolor cyan
    Write-Host " "

    Write-Host "To Get Commands for Specific Modules"                                                      -Foregroundcolor green
    Write-Host "
Get-AdminToolbox                  ..Gets functions for this module
Get-ActiveDirectory               ..Gets functions for Active Directory
Get-EndpointManagement            ..Gets functions for Managing Endpoints
Get-Exchange                      ..Gets functions for Exchange
Get-FFTools                       ..Gets functions for FFMpeg utilities
Get-FileManagement                ..Gets functions for File Management
Get-Fun                           ..Gets functions for Fun
Get-Networking                    ..Gets functions for Networking
Get-Office365                     ..Gets functions for Office 365
Get-Remoting                      ..Gets functions for Remoting
Get-VMWareAutomate                ..Gets functions for VMWare
    "                                                                                                       -Foregroundcolor cyan
    Write-Host " "
}