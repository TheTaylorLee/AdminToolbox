# **AdminToolbox.ActiveDirectory**

* **1.0.0.0** Created the Module
* **1.0.1.0** Reduced the module load time using .net methods
* **1.0.1.1** Fix for Invoke-Unzip
* **1.0.2.0** Added markdown to the changelog
* **1.0.3.0** SpellCheck Everything
* **1.0.4.0** Added Aliases
* **1.0.5.0** Added two reporting functions
* **1.1.5.0** fix for Get-GroupMemberships  and Get-GroupMembers function parameters
* **1.1.6.0** Added account status for Get-GroupMembers functions
* **1.1.6.1** Updated start-replication to provide progress info
* **1.2.0.0** Tested and marked Core compatbile
* **1.3.0.0** Added function import-activedirectory
* **1.3.1.0** Updates for output made to Get-UserReport
* **1.3.2.0** Renamed function get-dclockoutevents2 to just be Get-DCLockoutEvents
* **1.3.2.1** Fix for Renamed function not being exported
* **1.4.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **1.5.0.0** Added Markdown Documentation and link help
* **1.6.0** Update versioning standard and added LicenseURI
* **1.6.1** Move comment based help outside function block
* **1.6.2** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)
* **1.6.3** Fixed example for Get-UserReport

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
1.6.3