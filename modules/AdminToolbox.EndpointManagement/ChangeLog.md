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
* **4.7.3** Update Icon URI in Manifest
* **4.7.4** Increment Manifest to resolve missing manifest version in github timeline
* **4.8.0** Push any small changes
* **4.8.1** Push any small changes
* **4.8.2** Push any small changes
* **4.8.3** Maintenance Release
* **4.8.4** Maintenance Release
* **4.8.5** Maintenance Release
* **4.8.6** fix: missing manifest from workflow writeback
* **4.8.7** Maintenance Release
* **4.8.8** Maintenance Release
* **4.9.0** Update Get-RemoteDesktopLogins
* **4.9.1** Maintenance Release
* **4.9.2** Workflow Fix
* **4.9.3** Workflow Fix
* **4.9.4** Workflow Fix
* **4.9.5** CI Maintenance Release
* **4.9.83** CI Maintenance Release
* **4.9.84** Update Get-PCInfo assettag object label to say label instead
* **4.9.85** CI Maintenance Release
* **4.9.117** CI Maintenance Release
* **4.10.0** Added function get-locallogonhistory
* **4.10.1** Added manifest export for function get-locallogonhistory
* **4.10.2** CI Maintenance Release
* **4.10.17** CI Maintenance Release
* **4.10.18** Fix Get-Chocoinstalls called chocolatey parameters to support 2.0 and newer versions.
* **4.10.19** CI Maintenance Release
* **4.10.52** CI Maintenance Release
* **4.11.0.0** Add workflow versioning
* **4.11.0.1** CI Maintenance Release
* **4.11.0.20** CI Maintenance Release
* **4.12.0.0** Reworked Remove-Storeapps to be more flexible.
* **4.12.0.1** CI Maintenance Release
* **4.12.0.30** CI Maintenance Release
* **4.13.0.0** Moved set-uac to the admintoolbox.secops module
* **4.13.0.1** CI Maintenance Release
* **4.13.0.4** CI Maintenance Release
* **4.14.0.0** Moved registry functions into the secops module.
* **4.14.0.1** CI Maintenance Release
* **4.14.0.7** CI Maintenance Release
* **4.14.0.8** CI Maintenance Release
* **4.14.0.9** CI Maintenance Release
* **4.14.0.10** CI Maintenance Release
* **4.14.0.11** CI Maintenance Release
* **4.14.0.12** CI Maintenance Release
* **4.14.0.13** CI Maintenance Release
* **4.14.0.14** CI Maintenance Release
* **4.14.0.15** CI Maintenance Release
* **4.15.0.0** Removed disabled-standby function
* **4.15.0.1** CI Maintenance Release
* **4.15.0.2** CI Maintenance Release
* **4.15.0.3** CI Maintenance Release
* **4.15.0.4** CI Maintenance Release
* **4.15.0.5** CI Maintenance Release
* **4.15.1.0** Add get-windowsprofiles function and removed a couple legacy functions.
* **4.15.1.1** Replace usage of an automatic variable with a unique variable
* **4.15.1.2** CI Maintenance Release
* **4.15.1.3** CI Maintenance Release
* **4.15.1.4** CI Maintenance Release
* **4.15.1.5** CI Maintenance Release
* **4.15.1.6** CI Maintenance Release
* **4.15.1.7** CI Maintenance Release
* **4.15.1.8** CI Maintenance Release
* **4.15.1.9** CI Maintenance Release
* **4.15.1.10** CI Maintenance Release
* **4.15.1.11** CI Maintenance Release
* **4.15.1.12** CI Maintenance Release
* **4.15.1.13** CI Maintenance Release
* **4.15.1.14** CI Maintenance Release
* **4.15.1.15** CI Maintenance Release
* **4.15.1.16** CI Maintenance Release
* **4.15.1.17** CI Maintenance Release
* **4.15.1.18** CI Maintenance Release
* **4.15.1.19** CI Maintenance Release
* **4.15.1.20** CI Maintenance Release
* **4.15.1.21** CI Maintenance Release
* **4.15.1.22** CI Maintenance Release
* **4.15.1.23** CI Maintenance Release
* **4.15.1.24** CI Maintenance Release
* **4.15.1.25** CI Maintenance Release
* **4.15.1.26** CI Maintenance Release
* **4.15.1.27** CI Maintenance Release
* **4.15.1.28** CI Maintenance Release
* **4.15.1.29** CI Maintenance Release