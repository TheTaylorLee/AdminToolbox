# **AdminToolbox.Office365**

* **1.0.0.0** Created the Module
* **1.0.1.0** Reduced the module load time using .net methods
* **1.0.2.0** Updated convert-mailboxtoshared to fix issues for adding smtp addresses.
* **1.0.2.1** Fix for Invoke-Unzip
* **1.0.3.0** Added markdown to the changelog
* **1.0.4.0** Spellcheck Everything
* **1.0.5.0** Added get-mfastatus
* **1.0.6.0** Added the Get-Rolemembers function
* **1.0.6.1** Fixed Module Description
* **1.0.6.2** Fix to set-AuthPolicy Parameter Validation
* **1.0.7.0** Sorted output for Get-RoleMembers
* **1.0.8.0** Added Invoke-Sync365 function
* **1.0.8.1** Fixed the Enviroment variable for AzureSyncServer
* **1.1.0.0** Updated for eventual core support
* **1.1.1.0** Updated connect-office365 to use latest version of exchange online module
* **1.1.2.0** Updated connect-office365 to include both exchange online versions
* **1.2.0.0** Added multiple functions and updated get-office365 function
* **1.3.0.0** Added multiple functions and updated get-office365 function
* **1.3.0.1** Fixed errors in the get-office365 function
* **2.0.0.0** Updated Get-Office365 and modified the logical structure of the module
* **2.0.0.1** Applied fix to get-vmdetails
* **2.1.0.0** Added Functions Get-TenantDiagrams and Invoke-EXOSharedSession
* **2.2.0.0** Added function Enable-MailboxAccess
* **2.2.1.0** Updated module dependencies so that the Module AzViz doesn't install Az modules.
* **2.2.2.0** Updates for output made by Enable-MailboxAccess
* **2.3.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **2.3.0.1** Fixed for invalid comment character in function Get-TenantDiagrams
* **2.4.0.0** Added Markdown Documentation and link help
* **2.5.0** Update versioning standard and added LicenseURI.
* **2.6.0** Added Clear-TeamsCache
* **2.6.1** Move comment based help outside function block
* **2.6.2** Fix Clear-TeamsCache by using environment variables for the cache path
* **2.7.0** Add get-msolrolemembers and get-azurerolemembers functions
* **2.7.1** Updated Clear-TeamsCache
* **2.7.2** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)
* **2.8.0** Added the function Invoke-PerUserMFAEnforced
* **2.8.1** Removed get-messagetrace index from get-office365 since the function doesn't exist any longer.

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
2.8.1