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
* **2.8.2** Update Icon URI in Manifest
* **2.8.3** Increment Manifest to resolve missing manifest version in github timeline
* **2.9.0** Push any small changes
* **2.10.0** Remove start-Azuresync
* **2.10.1** Push any small changes
* **2.10.2** Push any small changes
* **2.10.3** Maintenance Release
* **2.10.4** Maintenance Release
* **2.10.5** Maintenance Release
* **2.10.6** fix: missing manifest from workflow writeback
* **2.11.0** Add get-distributiongroupmembers
* **2.11.1** Maintenance Release
* **2.11.2** Maintenance Release
* **2.11.3** Workflow Fix
* **2.11.4** Workflow Fix
* **2.11.5** Workflow Fix
* **2.11.6** CI Maintenance Release
* **2.11.7** CI Maintenance Release
* **2.11.8** CI Maintenance Release
* **2.11.9** CI Maintenance Release
* **2.11.10** CI Maintenance Release
* **2.11.11** CI Maintenance Release
* **2.11.12** CI Maintenance Release
* **2.11.13** CI Maintenance Release
* **3.0.0** Removing functions that require MSOnline and Azure AD in preperation of of those modules being deprecated.
* **3.0.1** CI Maintenance Release
* **3.0.2** CI Maintenance Release
* **3.0.3** CI Maintenance Release
* **3.0.4** CI Maintenance Release
* **3.0.5** CI Maintenance Release
* **3.0.6** CI Maintenance Release
* **3.0.7** CI Maintenance Release
* **3.0.8** CI Maintenance Release
* **3.0.9** CI Maintenance Release
* **3.0.10** CI Maintenance Release
* **3.0.11** CI Maintenance Release
* **3.0.12** CI Maintenance Release
* **3.0.13** CI Maintenance Release
* **3.0.14** CI Maintenance Release
* **3.0.15** CI Maintenance Release
* **3.0.16** CI Maintenance Release
* **3.0.17** CI Maintenance Release
* **3.0.18** CI Maintenance Release
* **3.0.19** CI Maintenance Release
* **3.0.20** CI Maintenance Release
* **3.0.21** CI Maintenance Release
* **3.0.22** CI Maintenance Release
* **3.0.23** CI Maintenance Release
* **3.0.24** CI Maintenance Release
* **3.0.25** CI Maintenance Release
* **3.0.26** CI Maintenance Release
* **3.0.27** CI Maintenance Release
* **3.0.28** CI Maintenance Release
* **3.0.29** CI Maintenance Release
* **3.0.30** CI Maintenance Release
* **3.1.0** Remove deprecated Auth Policy Functions for basic authentication
* **3.1.1** CI Maintenance Release
* **3.1.2** CI Maintenance Release
* **3.1.3** CI Maintenance Release
* **3.1.4** CI Maintenance Release
* **3.1.5** CI Maintenance Release
* **3.1.6** CI Maintenance Release
* **3.1.7** CI Maintenance Release
* **3.1.8** CI Maintenance Release
* **3.1.9** CI Maintenance Release
* **3.1.10** CI Maintenance Release
* **3.1.11** CI Maintenance Release
* **3.1.12** CI Maintenance Release
* **3.1.13** CI Maintenance Release
* **3.1.14** CI Maintenance Release
* **3.1.15** CI Maintenance Release
* **3.1.16** CI Maintenance Release
* **3.1.17** CI Maintenance Release
* **3.1.18** CI Maintenance Release
* **3.1.19** CI Maintenance Release
* **3.1.20** CI Maintenance Release
* **3.1.21** CI Maintenance Release
* **3.1.22** CI Maintenance Release
* **3.1.23** CI Maintenance Release
* **3.1.24** CI Maintenance Release
* **3.1.25** CI Maintenance Release
* **3.1.26** CI Maintenance Release
* **3.1.27** CI Maintenance Release
* **3.1.28** CI Maintenance Release
* **3.1.29** CI Maintenance Release
* **3.1.30** CI Maintenance Release
* **3.1.31** CI Maintenance Release
* **3.1.32** CI Maintenance Release
* **3.1.33** CI Maintenance Release
* **3.1.34** CI Maintenance Release
* **3.1.35** CI Maintenance Release
* **3.1.36** CI Maintenance Release
* **3.1.37** CI Maintenance Release
* **3.1.38** CI Maintenance Release
* **3.1.39** CI Maintenance Release
* **3.1.40** CI Maintenance Release
* **3.1.41** CI Maintenance Release
* **3.1.42** CI Maintenance Release
* **3.1.43** CI Maintenance Release
* **3.1.44** CI Maintenance Release
* **3.1.45** CI Maintenance Release
* **3.1.46** CI Maintenance Release
* **3.1.47** CI Maintenance Release
* **3.1.48** CI Maintenance Release
* **3.1.49** CI Maintenance Release
* **3.1.50** CI Maintenance Release
* **3.1.51** CI Maintenance Release
* **3.1.52** CI Maintenance Release
* **3.1.53** CI Maintenance Release
* **3.1.54** CI Maintenance Release
* **3.1.55** CI Maintenance Release
* **3.1.56** CI Maintenance Release
* **3.1.57** CI Maintenance Release
* **3.1.58** CI Maintenance Release
* **3.1.59** CI Maintenance Release
* **3.1.60** CI Maintenance Release
* **3.1.61** CI Maintenance Release
* **3.1.62** CI Maintenance Release
* **3.1.63** CI Maintenance Release
* **3.1.64** CI Maintenance Release
* **3.1.65** CI Maintenance Release
* **3.1.66** CI Maintenance Release
* **3.1.67** CI Maintenance Release
* **3.1.68** CI Maintenance Release
* **3.1.69** CI Maintenance Release
* **3.1.70** CI Maintenance Release
* **3.1.71** CI Maintenance Release
* **3.1.72** CI Maintenance Release
* **3.1.73** CI Maintenance Release
* **3.1.74** CI Maintenance Release
* **3.1.75** CI Maintenance Release
* **3.1.76** CI Maintenance Release
* **3.1.77** CI Maintenance Release
* **3.1.78** CI Maintenance Release
* **3.1.79** CI Maintenance Release
* **3.1.80** CI Maintenance Release
* **3.1.81** CI Maintenance Release
* **3.1.82** CI Maintenance Release
* **3.1.83** CI Maintenance Release
* **3.1.84** CI Maintenance Release
* **3.1.85** CI Maintenance Release
* **3.1.86** CI Maintenance Release
* **3.1.87** CI Maintenance Release
* **3.1.88** CI Maintenance Release
* **3.1.89** CI Maintenance Release
* **3.1.90** CI Maintenance Release
* **3.1.91** CI Maintenance Release
* **3.1.92** CI Maintenance Release
* **4.0.0** Added four Sharepoint functions to help with managing storage quotas. The purpose is to get a better control on existing file versions and free up space.
* **4.0.1** CI Maintenance Release
* **4.0.2** Update get-versionhistoryreport parameters to be consistent with other sharepoint functions.
* **4.0.3** Fix Set-SharepointVersionLimits variable
* **4.0.4** CI Maintenance Release
* **4.0.5** CI Maintenance Release
* **4.0.6** CI Maintenance Release
* **4.0.7** CI Maintenance Release
* **4.0.8** CI Maintenance Release
* **4.0.9** CI Maintenance Release
* **4.0.10** CI Maintenance Release
* **4.0.11** CI Maintenance Release
* **4.0.12** CI Maintenance Release
* **4.0.13** CI Maintenance Release
* **4.0.14** CI Maintenance Release
* **4.0.15** CI Maintenance Release
* **4.0.16** CI Maintenance Release
* **4.0.17** CI Maintenance Release
* **4.0.18** CI Maintenance Release
* **4.0.19** CI Maintenance Release
* **4.0.20** CI Maintenance Release
* **4.0.21** CI Maintenance Release
* **4.0.22** CI Maintenance Release
* **4.0.23** CI Maintenance Release
* **4.0.24** CI Maintenance Release
* **4.0.25** CI Maintenance Release
* **4.0.26** CI Maintenance Release
* **4.0.27** CI Maintenance Release
* **4.0.28** CI Maintenance Release
* **4.0.29** CI Maintenance Release
* **4.0.30** CI Maintenance Release
* **4.0.31** CI Maintenance Release
* **4.0.32** CI Maintenance Release
* **4.0.33** CI Maintenance Release
* **4.1.0** Update pnp module functions to login using the new app registration method.
* **4.1.1** CI Maintenance Release
* **4.1.2** Add size unit descriptors to pscustomobject File Size results
* **4.2.0.0** Add workflow versioning
* **4.2.0.1** CI Maintenance Release
* **4.3.0.0** Add confirm parameter to Remove-VersionhistoryOlderThan
* **4.3.0.1** CI Maintenance Release
* **4.3.0.2** CI Maintenance Release
* **4.3.0.3** CI Maintenance Release
* **4.3.0.4** CI Maintenance Release
* **4.3.0.5** CI Maintenance Release
* **4.3.0.6** CI Maintenance Release
* **4.3.0.7** CI Maintenance Release
* **4.3.0.8** CI Maintenance Release
* **4.3.0.9** CI Maintenance Release
* **4.3.0.10** CI Maintenance Release
* **4.3.0.11** CI Maintenance Release
* **4.3.0.12** CI Maintenance Release
* **4.3.0.13** CI Maintenance Release
* **4.3.0.14** CI Maintenance Release
* **4.3.0.15** CI Maintenance Release
* **4.3.0.16** CI Maintenance Release
* **4.3.0.17** CI Maintenance Release
* **4.3.0.18** CI Maintenance Release
* **4.3.0.19** CI Maintenance Release
* **4.3.0.20** CI Maintenance Release
* **4.3.0.21** CI Maintenance Release
* **4.3.0.22** CI Maintenance Release
* **4.3.0.23** CI Maintenance Release
* **4.3.0.24** CI Maintenance Release
* **4.3.0.25** CI Maintenance Release
* **4.3.0.26** CI Maintenance Release
* **4.3.0.27** CI Maintenance Release
* **4.3.0.28** CI Maintenance Release
* **4.3.0.29** CI Maintenance Release
* **4.3.0.30** CI Maintenance Release