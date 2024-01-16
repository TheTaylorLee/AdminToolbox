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
* **4.9.6** CI Maintenance Release
* **4.9.7** CI Maintenance Release
* **4.9.8** CI Maintenance Release
* **4.9.9** CI Maintenance Release
* **4.9.10** CI Maintenance Release
* **4.9.11** CI Maintenance Release
* **4.9.12** CI Maintenance Release
* **4.9.13** CI Maintenance Release
* **4.9.14** CI Maintenance Release
* **4.9.15** CI Maintenance Release
* **4.9.16** CI Maintenance Release
* **4.9.17** CI Maintenance Release
* **4.9.18** CI Maintenance Release
* **4.9.19** CI Maintenance Release
* **4.9.20** CI Maintenance Release
* **4.9.21** CI Maintenance Release
* **4.9.22** CI Maintenance Release
* **4.9.23** CI Maintenance Release
* **4.9.24** CI Maintenance Release
* **4.9.25** CI Maintenance Release
* **4.9.26** CI Maintenance Release
* **4.9.27** CI Maintenance Release
* **4.9.28** CI Maintenance Release
* **4.9.29** CI Maintenance Release
* **4.9.30** CI Maintenance Release
* **4.9.31** CI Maintenance Release
* **4.9.32** CI Maintenance Release
* **4.9.33** CI Maintenance Release
* **4.9.34** CI Maintenance Release
* **4.9.35** CI Maintenance Release
* **4.9.36** CI Maintenance Release
* **4.9.37** CI Maintenance Release
* **4.9.38** CI Maintenance Release
* **4.9.39** CI Maintenance Release
* **4.9.40** CI Maintenance Release
* **4.9.41** CI Maintenance Release
* **4.9.42** CI Maintenance Release
* **4.9.43** CI Maintenance Release
* **4.9.44** CI Maintenance Release
* **4.9.45** CI Maintenance Release
* **4.9.46** CI Maintenance Release
* **4.9.47** CI Maintenance Release
* **4.9.48** CI Maintenance Release
* **4.9.49** CI Maintenance Release
* **4.9.50** CI Maintenance Release
* **4.9.51** CI Maintenance Release
* **4.9.52** CI Maintenance Release
* **4.9.53** CI Maintenance Release
* **4.9.54** CI Maintenance Release
* **4.9.55** CI Maintenance Release
* **4.9.56** CI Maintenance Release
* **4.9.57** CI Maintenance Release
* **4.9.58** CI Maintenance Release
* **4.9.59** CI Maintenance Release
* **4.9.60** CI Maintenance Release
* **4.9.61** CI Maintenance Release
* **4.9.62** CI Maintenance Release
* **4.9.63** CI Maintenance Release
* **4.9.64** CI Maintenance Release
* **4.9.65** CI Maintenance Release
* **4.9.66** CI Maintenance Release
* **4.9.67** CI Maintenance Release
* **4.9.68** CI Maintenance Release
* **4.9.69** CI Maintenance Release
* **4.9.70** CI Maintenance Release
* **4.9.71** CI Maintenance Release
* **4.9.72** CI Maintenance Release
* **4.9.73** CI Maintenance Release
* **4.9.74** CI Maintenance Release
* **4.9.75** CI Maintenance Release
* **4.9.76** CI Maintenance Release
* **4.9.77** CI Maintenance Release
* **4.9.78** CI Maintenance Release
* **4.9.79** CI Maintenance Release
* **4.9.80** CI Maintenance Release
* **4.9.81** CI Maintenance Release
* **4.9.82** CI Maintenance Release
* **4.9.83** CI Maintenance Release
* **4.9.84** Update Get-PCInfo assettag object label to say label instead
* **4.9.85** CI Maintenance Release
* **4.9.86** CI Maintenance Release
* **4.9.87** CI Maintenance Release
* **4.9.88** CI Maintenance Release
* **4.9.89** CI Maintenance Release
* **4.9.90** CI Maintenance Release
* **4.9.91** CI Maintenance Release
* **4.9.92** CI Maintenance Release
* **4.9.93** CI Maintenance Release
* **4.9.94** CI Maintenance Release
* **4.9.95** CI Maintenance Release
* **4.9.96** CI Maintenance Release
* **4.9.97** CI Maintenance Release
* **4.9.98** CI Maintenance Release
* **4.9.99** CI Maintenance Release
* **4.9.100** CI Maintenance Release
* **4.9.101** CI Maintenance Release
* **4.9.102** CI Maintenance Release
* **4.9.103** CI Maintenance Release
* **4.9.104** CI Maintenance Release
* **4.9.105** CI Maintenance Release
* **4.9.106** CI Maintenance Release
* **4.9.107** CI Maintenance Release
* **4.9.108** CI Maintenance Release
* **4.9.109** CI Maintenance Release
* **4.9.110** CI Maintenance Release
* **4.9.111** CI Maintenance Release
* **4.9.112** CI Maintenance Release
* **4.9.113** CI Maintenance Release
* **4.9.114** CI Maintenance Release
* **4.9.115** CI Maintenance Release
* **4.9.116** CI Maintenance Release
* **4.9.117** CI Maintenance Release
* **4.10.0** Added function get-locallogonhistory
* **4.10.1** Added manifest export for function get-locallogonhistory
* **4.10.2** CI Maintenance Release
* **4.10.3** CI Maintenance Release
* **4.10.4** CI Maintenance Release