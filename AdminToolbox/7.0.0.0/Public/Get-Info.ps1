function Get-Info {

    [CmdletBinding()]
    [Alias("Get-AdminToolbox")]
    param (
    )

    Write-Host " "
    Write-Host "Some other useful Functions..."                                                             -Foregroundcolor green
    Write-Host "
Find-Credential                   ..Finds stored credentials
Get-Credential                    ..Gets a credential for use with a Function
Get-FileName                      ..Gets a gui prompt for a file
Get-FolderName                    ..Gets a gui prompt for a Folder
Set-Credential                    ..Sets a credential that can be called in scripts
    "                                                                                                       -Foregroundcolor cyan

    Write-Host " "
    Write-Host "To Get Functions and Command Help..."                                                       -Foregroundcolor green
    Write-Host "
Get-All                           ..Gets all module Functions
Get-Full                          ..Gets full help for selected module command
Get-ModuleAliases                 ..Gets aliases for AdminToolbox modules
Invoke-Show                       ..Invokes a grid Gui for implementing show command
Start-Application                 ..Start an application from PowerShell with ease
          "                                                                                                 -Foregroundcolor cyan
    Write-Host " "

    Write-Host "To Get Functions for Specific Modules"                                                      -Foregroundcolor green
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