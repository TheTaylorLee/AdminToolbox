function Get-Info {

    [CmdletBinding()]
    [Alias("Get-AdminToolbox")]
    param (
    )

    Write-Host " "
    Write-Host "Admintoolbox Functions..."                                                                  -ForegroundColor green
    Write-Host "
Get-All                           ..Gets all module Functions
Get-Full                          ..Gets full help for selected functions
Get-ModuleAliases                 ..Gets aliases for AdminToolbox modules
Invoke-Show                       ..Invokes a grid Gui for implementing show command
Open-AdminMMC                     ..Opens Microsoft Management Console with multiple snap-ins loaded
Start-Application                 ..Start an application from PowerShell with ease
          "                                                                                                 -ForegroundColor cyan
    Write-Host " "

    Write-Host "To Get Functions for Required Modules"                                                      -ForegroundColor green
    Write-Host "
Get-AdminToolbox                  ..Gets functions for this module
Get-ActiveDirectory               ..Gets functions for Active Directory
Get-EndpointManagement            ..Gets functions for Managing Endpoints
Get-Exchange                      ..Gets functions for Exchange
Get-FFTools                       ..Gets functions for FFMpeg utilities
Get-FileManagement                ..Gets functions for File Management
Get-FortiWizard                   ..Gets functions for FortiWizard
Get-Fun                           ..Gets functions for Fun
Get-Networking                    ..Gets functions for Networking
Get-Office365                     ..Gets functions for Office 365
Get-Remoting                      ..Gets functions for Remoting
Get-VMWareAutomate                ..Gets functions for VMWare
    "                                                                                                       -ForegroundColor cyan
    Write-Host " "

    Write-Host "PSReadline"                                                      -ForegroundColor green
    Write-Host "
Alt  + A                          ..Moves the cursor between entered parameter values
Alt  + H                          ..Get's dynamic help for a parameter. Put cursor at end of typed parameter
Ctrl + L                          ..Clears the console
F1                                ..Gets navigable help if at the end of a function
F2                                ..Switch between Prediction view. (Inline, List)
F12                               ..Gets history in a gridview for repeating commands
Tab                               ..Completes function or parameter
"                                                                                                       -ForegroundColor cyan
    Write-Host " "
}