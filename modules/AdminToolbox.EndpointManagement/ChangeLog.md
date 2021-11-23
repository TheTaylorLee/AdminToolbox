# **AdminToolbox.EndpointManagement**

* **1.0.0** Created the Module
* **1.0.1** Corrected parameter for Disable-Standby
* **1.1.1** Added Functions
* **1.1.2** Function improvements
* **1.1.3** Updated Remove-Shortcuts
* **1.1.4** Updated Disable-Standby
* **1.1.5** Updated the Module Intro
* **1.1.6** Updated the Module Intro
* **1.2.7** Added Enable-RSATFeatures functions
* **1.2.9** Added Powerbutton and Lid Actions to Disable-Standby
* **1.3.9** Added Disable-PasswordPeek
* **1.3.10** Added A Change Log
* **1.3.11** Exported Functions to the Manifest
* **1.4.11** Consolidated UAC functions into a single function
* **2.4.11** Restructured Functions into separate files
* **2.4.12** Added Get-Elevation private function
* **2.4.13** Added parameter help information and added Elevation warnings
* **2.4.14** Added Tags and Links
* **2.4.15** Updated Get-IntroPCS
* **2.4.16** Fixed function typo
* **2.4.18** Setup Github and updated Manifest PSData
* **2.4.19** Added Command Aliases
* **3.1.1.1** Moving to proper version control
* **3.2.1.1** Updated Remove-Shortcuts with option to only remove logged in users desktop shortcuts. Updated Function Links. Updated Disable-Standby to create a new powerscheme.
* **4.0.0.0** Converted from a standalone module to a dependency module of admintoolbox. Added a bunch of commands.
* **4.0.1.0** Updated Disable-Standby to support the new module structure. Added import for support files.
* **4.0.2.0** Reduced the module load time using .net methods
* **4.0.2.1** Fix for Uninstall-Applications being exported with a plural noun causing it to not work.
* **4.0.2.2** Fix for Invoke-Unzip
* **4.0.3.0** Added markdown to the changelog
* **4.0.4.0** Spellcheck Everything
* **4.0.5.0** Updated Get-EndpointManagement and added printer functions
* **4.0.6.0** Removed invoke-printerserverrenew
* **4.0.6.1** Added missing function in Admintoolbox.EndpointManagement module
* **4.0.7.0** Added function Get-PowerShell7
* **4.0.8.0** Added function Reset-EndpointPassword
* **4.1.0.0** Tested and marked Core compatbile
* **4.2.0.0** Added Repair-DomainJoin, Disable-Cortana, and Get-MonitorSizes functions
* **4.3.0.0** Added Get-RemoteDesktopLogins and Get-RebootEvents
* **4.4.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **4.5.0.0** Removed get-powershell7 in favor of the PSPortable functions
* **4.5.1.0** Bug fix for Disable-Standby
* **4.6.0.0** Added Markdown Documentation and link help
* **4.7.1** Update versioning standard and added LicenseURI.
* **4.7.2** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
4.7.2