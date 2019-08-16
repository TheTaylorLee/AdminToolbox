1.0.0 Created the Module
1.0.1 Updated Get-Intro
1.0.2 First Powershell Gallery Publish Test
1.1.3 Modified Module structure for Repository compatibility
2.1.3 Updated functions to better follow best practices and improve performance
2.2.3 Get-Location alias added and Added Free space tracking to remove-all
2.3.3 Updated Remove-All and Added Get-Weather
2.3.4 Small Fixes
2.3.6 Updated Connect-Office365 to import Exchange Online Module
2.3.7 Removed get-command from connect-Office365 function and Updated get-intro
2.3.8 Updagted get-info
2.3.9 Connect-Office365 improvements
2.4.0 Added Clear-Arp Function
3.4.0 Added functions for openssh administration and Added Support files to the module
3.4.1 Added service handling to delete cbs logs
3.4.2 Added Azure AD v1 switch to connect-365
3.4.3 Updated get-intro
3.4.3 Updated get-info
3.4.4 Small Fixes
3.4.5 Small Fixes
3.4.6 Updated Remove-All
3.4.7 Updated Remove-All and Disable-Standby
3.4.8 Removed forced formating for get-printers
3.4.9 Updated module intro
3.5.9 Added Invoke-ServiceRecovery Function
3.5.10 Optomize Invoke-ServiceRecovery Function
3.5.12 Added Powerbutton and Lid Actions to Disable-Standby
3.6.12 Added Start-Iperf function
3.7.12 Nested the PSnmap module
3.8.13 Greatly Improved Get-Applications and Added Parameter Validation to some functions
3.9.13 Added Gui uninstaller for all applications
3.9.14 Math fix for Restart-Endpoint
3.10.14 Added Cmdlet Explorer
3.11.14 Updated get-virtualdirectories and added set-virtualdirectories
3.11.15 Added Change Log
3.11.16 Exported functions to the manifest test
3.11.17 Exported functions to the manifest test
3.11.18 Exported functions to the manifest fix
3.12.18 Consolidated UAC Functions into a single function
3.12.19 Modified Get-MailLog
3.12.20 Add Related Links for better command Discoverability
3.13.20 Added Functions for Managing Exchange Online Authentication Policies
3.13.21 Small fixes to last commit
3.13.22 Changes to functions names added in commit 3.13.20 to avoid clobber
3.13.23 Style change to Set-AuthPolicy Output
3.13.24 Update Get-Info
4.13.24 Modified Module to work with private functions. Updated Install-SSH to allow for installing from Github
4.14.24 Removed Duplicate call in the Module. Added Private assemblies to allowing unzipping a file in older versions of powershell and to download ssh from Github.
4.14.25 Add winssh file to path after running the install-ssh function.
4.15.25 Added Convert-MailboxToShared
4.16.25 Structured Functions into seperate files
4.17.25 Small function modifications to remove few code warnings. Expanded Function help to provide more detail, Added Invoke-Robocopy.
4.17.26 Updated Convert-MailboxtoShared for improved SMTP handling
4.17.27 Updated Convert-MailboxtoShared to make the code easier to follow and to allow for consistent menu options.
4.17.28 Added set primary SMTP address to Convert-MailboxtoShared
4.18.28 Added Get-ReplicationStatus and Start-Replication
4.18.29 Updated get-info
4.18.30 Added Tags and Links
4.18.31 Updated Get-Intro
4.18.32 Fixed function typo
4.18.34 Setup Github and updated Manifest PSData
4.18.35 Updated Set-Virtualdirectories to accept characters that would otherwise cause the function to break
5.1.1.1 Moving to a proper version control
5.2.1.1 Added Mount-ProfileRegistry and Dismount-ProfileRegistry
5.2.2.1 Updated Disable-Standby to create a new powerscheme
5.2.2.2 Fixed Disable-Standby
5.2.3.1 Updated get-modules
5.2.4.1 Added invoke-unzip methods for full compatibility down to powershell v2
6.0.0.0 Converted to a Master Module with dependent modules. Added many functions
6.0.0.1 Updated to resolve clobber issue for .remoting module
6.0.0.2 Fix for non-exported command in module .remoting
6.1.0.0 Added Get-Full and changed Get-Info
6.1.0.2 Exported Funcitons
6.1.0.3 Fixed import to path, path to resolve ffmpeg functions not importing for admintoolbox.fftools module.
6.2.0.0 Added command Install-FFTools. This will shrink the overall module size and allow for installing fftools only where needed. Change made to Module AdminToolbox.FFTools
6.2.0.1 Exported Install-FFTools function for module AdminToolbox.fftools
6.2.0.2 Fix for importing support files for admintoolbox.remoting
6.2.1.0 Updated disable-standby module to support module restructure for module admintoolbox.endpointmanagement.
6.3.0.0 Added set-fftoolsvariables to module admintoolbox.fftools
6.3.0.1 Fix to start-burnsubtitles for module admintoolbox.fftools
6.3.1.0 Signifigantly Reduced the module load time using .net methods
6.3.1.1 Updated the manifest to support reuire new versions of modules
6.3.2.0 Changes made to AdminToolbox.Networking get-networking function
6.3.3.0 Added functions get-whois and start-speedtest for AdminToolbox.Networking Module
6.3.3.1 Fix for non-exported functions on last update
6.4.3.0 Added the function Start-Application
6.4.4.0 Added directory paths for the Start-Applications index
6.4.4.1 Removed syswow64 folder from start-applications index. That should help with clobber on applications with 2 versions.
6.4.5.0 Added .MSC to start-applications
6.4.5.1 Updated manifest
6.4.6.0 Made some changes to Start-Application function after some /u/Lee_Dailey tips.
6.4.6.1 Fix for exported command in AdminToolbox.endpointmanagement module
6.4.7.0 Fix for Invoke-Unzip