# **AdminToolbox**

* **1.0.0** Created the Module
* **1.0.1** Updated Get-Intro
* **1.0.2** First Powershell Gallery Publish Test
* **1.1.3** Modified Module structure for Repository compatibility
* **2.1.3** Updated functions to better follow best practices and improve performance
* **2.2.3** Get-Location alias added and Added Free space tracking to remove-all
* **2.3.3** Updated Remove-All and Added Get-Weather
* **2.3.4** Small Fixes
* **2.3.6** Updated Connect-Office365 to import Exchange Online Module
* **2.3.7** Removed get-command from connect-Office365 function and Updated get-intro
* **2.3.8** Updated get-info
* **2.3.9** Connect-Office365 improvements
* **2.4.0** Added Clear-Arp Function
* **3.4.0** Added functions for openssh administration and Added Support files to the module
* **3.4.1** Added service handling to delete cbs logs
* **3.4.2** Added Azure AD v1 switch to connect-365
* **3.4.3** Updated get-intro
* **3.4.3** Updated get-info
* **3.4.4** Small Fixes
* **3.4.5** Small Fixes
* **3.4.6** Updated Remove-All
* **3.4.7** Updated Remove-All and Disable-Standby
* **3.4.8** Removed forced formating for get-printers
* **3.4.9** Updated module intro
* **3.5.9** Added Invoke-ServiceRecovery Function
* **3.5.10** Optimized Invoke-ServiceRecovery Function
* **3.5.12** Added Powerbutton and Lid Actions to Disable-Standby
* **3.6.12** Added Start-Iperf function
* **3.7.12** Nested the PSnmap module
* **3.8.13** Greatly Improved Get-Applications and Added Parameter Validation to some functions
* **3.9.13** Added Gui uninstaller for all applications
* **3.9.14** Math fix for Restart-Endpoint
* **3.10.14** Added Cmdlet Explorer
* **3.11.14** Updated get-virtualdirectories and added set-virtualdirectories
* **3.11.15** Added Change Log
* **3.11.16** Exported functions to the manifest test
* **3.11.17** Exported functions to the manifest test
* **3.11.18** Exported functions to the manifest fix
* **3.12.18** Consolidated UAC Functions into a single function
* **3.12.19** Modified Get-MailLog
* **3.12.20** Add Related Links for better command Discoverability
* **3.13.20** Added Functions for Managing Exchange Online Authentication Policies
* **3.13.21** Small fixes to last commit
* **3.13.22** Changes to functions names added in commit 3.13.20 to avoid clobber
* **3.13.23** Style change to Set-AuthPolicy Output
* **3.13.24** Update Get-Info
* **4.13.24** Modified Module to work with private functions. Updated Install-SSH to allow for installing from Github
* **4.14.24** Removed Duplicate call in the Module. Added Private assemblies to allowing unzipping a file in older versions of powershell and to download ssh from Github.
* **4.14.25** Add winssh file to path after running the install-ssh function.
* **4.15.25** Added Convert-MailboxToShared
* **4.16.25** Structured Functions into separate files
* **4.17.25** Small function modifications to remove few code warnings. Expanded Function help to provide more detail, Added Invoke-Robocopy.
* **4.17.26** Updated Convert-MailboxtoShared for improved SMTP handling
* **4.17.27** Updated Convert-MailboxtoShared to make the code easier to follow and to allow for consistent menu options.
* **4.17.28** Added set primary SMTP address to Convert-MailboxtoShared
* **4.18.28** Added Get-ReplicationStatus and Start-Replication
* **4.18.29** Updated get-info
* **4.18.30** Added Tags and Links
* **4.18.31** Updated Get-Intro
* **4.18.32** Fixed function typo
* **4.18.34** Setup Github and updated Manifest PSData
* **4.18.35** Updated Set-Virtualdirectories to accept characters that would otherwise cause the function to break
* **5.1.1.1** Moving to a proper version control
* **5.2.1.1** Added Mount-ProfileRegistry and Dismount-ProfileRegistry
* **5.2.2.1** Updated Disable-Standby to create a new powerscheme
* **5.2.2.2** Fixed Disable-Standby
* **5.2.3.1** Updated get-modules
* **5.2.4.1** Added invoke-unzip methods for full compatibility down to powershell v2
* **6.0.0.0** Converted to a Master Module with dependent modules. Added many functions
* **6.0.0.1** Updated to resolve clobber issue for .remoting module
* **6.0.0.2** Fix for non-exported command in module .remoting
* **6.1.0.0** Added Get-Full and changed Get-Info
* **6.1.0.2** Exported Functions
* **6.1.0.3** Fixed import to path, path to resolve ffmpeg functions not importing for admintoolbox.fftools module.
* **6.2.0.0** Added command Install-FFTools. This will shrink the overall module size and allow for installing fftools only where needed. Change made to Module AdminToolbox.FFTools
* **6.2.0.1** Exported Install-FFTools function for module AdminToolbox.fftools
* **6.2.0.2** Fix for importing support files for admintoolbox.remoting
* **6.2.1.0** Updated disable-standby module to support module restructure for module admintoolbox.endpointmanagement.
* **6.3.0.0** Added set-fftoolsvariables to module admintoolbox.fftools
* **6.3.0.1** Fix to start-burnsubtitles for module admintoolbox.fftools
* **6.3.1.0** Significantly Reduced the module load time using .net methods
* **6.3.1.1** Updated the manifest to support require new versions of modules
* **6.3.2.0** Changes made to AdminToolbox.Networking get-networking function
* **6.3.3.0** Added functions get-whois and start-speedtest for AdminToolbox.Networking Module
* **6.3.3.1** Fix for non-exported functions on last update
* **6.4.3.0** Added the function Start-Application
* **6.4.4.0** Added directory paths for the Start-Applications index
* **6.4.4.1** Removed syswow64 folder from start-applications index. That should help with clobber on applications with 2 versions.
* **6.4.5.0** Added .MSC to start-applications
* **6.4.5.1** Updated manifest
* **6.4.6.0** Made some changes to Start-Application function after some /u/Lee_Dailey tips.
* **6.4.6.1** Fix for exported command in AdminToolbox.endpointmanagement module
* **6.4.7.0** Fix for Invoke-Unzip
* **6.4.8.0** Added Get-MacVendor function to the Admintoolbox.Networking module and added changelog markdown
* **6.4.9.0** Added Invoke-NetworkScan to the AdminToolbox.Networking module
* **6.4.10.0** Modified Invoke-NetworkScan in the AdminToolbox.Networking module to make it even better
* **6.4.11.0** Added regex validation invoke-networkscan CIDR parameter in module admintoolbox.networking
* **6.4.12.0** Filtering null results for invoke-networkscan in module admintoolbox.networking
* **6.4.12.1** Updated help for invoke-networkscan in module admintoolbox.networking
* **6.4.13.0** SpellChecked Everything
* **6.4.14.0** Speed improvements for Invoke-NetworkScan
* **6.4.14.1** Fix for Write-Progress in module admintoolbox.networking
* **6.4.14.1** Fix for non-exported function in module admintoolbox.networking
* **6.4.15.0** Multiple changes to Admintoolbox.Networking and Admintoolbox.EndpointManagement
* **6.4.15.1** Added missing function in Admintoolbox.EndpointManagement module
* **6.4.16.0** Added get-mfastatus function to module Admintoolbox.Office365
* **6.4.17.0** Multiple Changes to other modules and publishing to update version requirements
* **6.4.18.0** Multiple Changes to other modules and publishing to update version requirements
* **6.4.18.1** Manifest update for required module versions
* **6.5.0.0**  Added Module aliases
* **6.5.0.1**  updated Module aliases
* **6.5.0.2**  Changes to Get-ModuleAliases to use Definition instead of ResolvedCommandName
* **6.5.1.0**  Updated required module versions
* **6.6.1.0**  Added Function Invoke-Show
* **6.6.1.1**  Fix for Start-Application where output failed to load into a variable.
* **6.7.0.0**  Tested and marked Core compatbile
* **7.0.0.0**  Added BetterCredentials 3rd party module requirement, and added Get-Filename and Get-Foldername Functions.
* **7.0.0.1**  Remove Bettercredentials Required modules
* **7.0.1.1**  Updated get-info to reflect changes in the last update
* **7.1.0.0**  Added function Open-AdminMMC
* **7.1.1.0**  Updated Required module versions
* **7.1.2.0**  Updated Required module versions
* **7.1.3.0**  Updated multiple module dependencies and updated get-info function
* **7.1.4.0**  Updated multiple module dependencies
* **8.0.0.0**  Moved two functions to the file management module. Added cmder to the module.
* **8.0.1.0**  Updated multiple module dependencies
* **8.1.0.0**  Updated multiple module dependencies
* **8.2.0.0**  Updated cmder settings
* **8.2.0.0**  Updated cmder settings
* **8.3.0.0**  Updated Start-Cmder startup to use a new icon file
* **8.3.1.0**  Updated Get-info and dependencies
* **8.3.2.0**  Updated module dependencies so that the Module AzViz doesn't install Az modules
* **8.4.0.0**  Added Install-PSPortable and Install-PSPortableLight
* **8.4.1.0**  Changed deploy-functions to use approved verbs
* **8.5.0.0**  Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **8.5.1.0**  Removed reliance on Internet explorer web engine by updating invoke-webrequest functions to use basic parsing
* **8.6.0.0**  Added Markdown Documentation and link help
* **9.0.0.0**  Added Module Admintoolbox.Fortiwizard
* **9.0.1.0**  Updated Get-Info
* **9.0.2.0**  Updated Admintoolbox.Fortiwizard Module Requirements
* **9.0.3.0**  Updated Admintoolbox.VMWareAutomate Module Requirements
* **9.0.4.0**  Updated Admintoolbox.Fortiwizard Module Requirements
* **9.0.5.0**  Updated Admintoolbox.Fortiwizard Module Requirements
* **9.0.6.0**  Updated Admintoolbox.Fortiwizard Module Requirements
* **9.1.0** Update versioning standard, added LicenseURI, and updated required modules.
* **9.2.0** Updated Admintoolbox.Fortiwizard Module Requirements
* **9.3.0** Updated Module requirements for Admintoolbox.Remoting
* **9.4.0** Update required modules
* **9.5.0** Update required modules
* **9.6.0** Update required modules
* **9.7.0** Update required modules
* **9.8.0** Update required modules
* **9.9.0** Update required modules
* **9.10.0** Update required modules
* **9.11.0** Update required modules
* **9.12.0** Update required modules
* **9.13.0** Update required modules
* **9.14.0** Update required modules
* **9.15.0** Update required modules
* **9.16.0** Updated ConEmu settings to not check for updates
* **9.16.1** Move comment based help outside function block
* **9.17.0** Update required modules
* **9.18.0** Update required modules
* **9.19.0** Update required modules
* **9.20.0** Workflow Test
* **9.20.1** Update required modules
* **9.21.0** Update get-info
* **9.21.1** Update required modules
* **9.21.2** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)
* **9.22.0** Update required modules
* **10.0.0** Removed PSPortable and ConEmu functions and support files. PSPortable still exists and can be downloaded using the script provided in the related github. However I have decided not to make environmental and terminal suggestions as part of the Admintoolbox Module.
* **10.1.0** Update required modules
* **10.2.0** Update required modules
* **10.2.1** Github Workflow Fix
* **10.2.2** Github Workflow Changes Test
* **10.2.3** Update required modules
* **10.2.4** Update Icon URI in Manifest
* **10.2.5** Update required modules
* **10.2.6** Update Open-AdminMMC saved MSC file.
* **10.2.7** Update required modules
* **10.2.8** Increment Manifest to resolve missing manifest version in github timeline
* **10.2.9** Update required modules
* **10.2.10** Update required modules
* **10.3.0** Push any small changes
* **10.4.0** Security Update
* **11.0.0** Introducing the Admintoolbox.MSGraph Module
* **11.0.1** Update required modules
* **11.0.2** Update required modules
* **11.0.3** Update required modules
* **11.0.4** Update required modules
* **11.0.5** Update required modules
* **11.0.6** Update required modules
* **11.0.7** Update required modules
* **11.0.8** Update required modules
* **11.0.9** Update required modules
* **11.0.10** Update required modules
* **11.0.11** Update required modules
* **11.0.12** Update required modules
* **11.0.13** Update required modules
* **11.0.14** Update required modules
* **11.0.15** Update required modules
* **11.0.16** Update required modules
* **11.0.17** Workflow Fix
* **11.0.18** Workflow Fix
* **11.0.19** Workflow Fix
* **11.0.20** Workflow Fix
* **11.0.21** Update required modules
* **11.0.22** Update required modules
* **11.0.23** Update required modules
* **11.0.24** Update required modules
* **11.0.25** Update required modules
* **11.0.26** Update required modules
* **11.0.27** Update required modules
* **11.0.28** Update required modules
* **11.0.29** CI Update required modules
* **11.0.30** CI Update required modules
* **11.0.31** CI Update required modules
* **11.0.32** CI Update required modules
* **11.0.33** CI Update required modules
* **11.0.34** CI Update required modules
* **11.0.35** CI Update required modules
* **11.0.36** CI Update required modules
* **11.0.37** CI Update required modules
* **11.0.38** CI Update required modules
* **11.0.39** CI Update required modules
* **11.0.40** CI Update required modules
* **11.0.41** CI Update required modules
* **11.0.42** CI Update required modules
* **11.0.43** CI Update required modules
* **11.0.44** CI Update required modules
* **11.0.45** CI Update required modules
* **11.0.46** CI Update required modules
* **11.0.47** CI Update required modules
* **11.0.48** CI Update required modules
* **11.0.49** CI Update required modules
* **11.0.50** CI Update required modules
* **11.0.51** CI Update required modules
* **11.0.52** CI Update required modules
* **11.0.53** CI Update required modules
* **11.0.54** CI Update required modules
* **11.0.55** CI Update required modules
* **11.0.56** CI Update required modules
* **11.0.57** CI Update required modules
* **11.0.58** CI Update required modules
* **11.0.59** CI Update required modules
* **11.0.60** CI Update required modules
* **11.0.61** CI Update required modules
* **11.0.62** CI Update required modules
* **11.0.63** CI Update required modules
* **11.0.64** CI Update required modules
* **11.0.65** CI Update required modules
* **11.0.66** CI Update required modules
* **11.0.67** CI Update required modules
* **11.0.68** CI Update required modules
* **11.0.69** CI Update required modules
* **11.0.70** CI Update required modules
* **11.0.71** CI Update required modules
* **11.0.72** CI Update required modules
* **11.0.73** CI Update required modules
* **11.0.74** CI Update required modules
* **11.0.75** CI Update required modules
* **11.0.76** CI Update required modules
* **11.0.77** CI Update required modules
* **11.0.78** CI Update required modules
* **11.0.79** CI Update required modules
* **11.0.80** CI Update required modules
* **11.0.81** CI Update required modules
* **11.0.82** CI Update required modules
* **11.0.83** CI Update required modules
* **11.0.84** CI Update required modules
* **11.0.85** CI Update required modules
* **11.0.86** CI Update required modules
* **11.0.87** CI Update required modules
* **11.0.88** CI Update required modules
* **11.0.89** CI Update required modules
* **11.0.90** CI Update required modules
* **11.0.91** CI Update required modules
* **11.0.92** CI Update required modules
* **11.0.93** CI Update required modules
* **11.0.94** CI Update required modules
* **11.0.95** CI Update required modules
* **11.0.96** CI Update required modules
* **11.0.97** CI Update required modules
* **11.0.98** CI Update required modules
* **11.0.99** CI Update required modules
* **11.0.100** CI Update required modules
* **11.0.101** CI Update required modules
* **11.0.102** CI Update required modules
* **11.0.103** CI Update required modules
* **11.0.104** CI Update required modules
* **11.0.105** CI Update required modules
* **11.0.106** CI Update required modules
* **11.0.107** CI Update required modules
* **11.0.108** CI Update required modules
* **11.0.109** CI Update required modules
* **11.0.110** CI Update required modules
* **11.0.111** CI Update required modules
* **11.0.112** CI Update required modules
* **11.0.113** CI Update required modules
* **11.0.114** CI Update required modules
* **11.0.115** CI Update required modules
* **11.0.116** CI Update required modules
* **11.0.117** CI Update required modules
* **11.0.118** CI Update required modules
* **11.0.119** CI Update required modules
* **11.0.120** CI Update required modules
* **11.0.121** CI Update required modules
* **11.0.122** CI Update required modules
* **11.0.123** CI Update required modules
* **11.0.124** CI Update required modules
* **11.0.125** CI Update required modules
* **11.0.126** CI Update required modules
* **11.0.127** CI Update required modules
* **11.0.128** CI Update required modules
* **11.0.129** CI Update required modules
* **11.0.130** CI Update required modules
* **11.0.131** CI Update required modules
* **11.0.132** CI Update required modules
* **11.0.133** CI Update required modules
* **11.0.134** CI Update required modules
* **11.0.135** CI Update required modules
* **11.0.136** CI Update required modules
* **11.0.137** CI Update required modules
* **11.0.138** CI Update required modules
* **11.0.139** CI Update required modules
* **11.0.140** CI Update required modules
* **11.0.141** CI Update required modules
* **11.0.142** CI Update required modules
* **11.0.143** CI Update required modules
* **11.0.144** CI Update required modules
* **11.0.145** CI Update required modules
* **11.0.146** CI Update required modules
* **11.0.147** CI Update required modules
* **11.0.148** CI Update required modules
* **11.0.149** CI Update required modules
* **11.0.150** CI Update required modules
* **11.0.151** CI Update required modules
* **11.0.152** CI Update required modules
* **11.0.153** CI Update required modules
* **11.0.154** CI Update required modules
* **11.0.155** CI Update required modules