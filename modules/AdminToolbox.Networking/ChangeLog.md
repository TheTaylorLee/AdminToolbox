# **AdminToolbox.Networking**

* **1.0.0.0** Created the Module
* **1.0.0.1** Exported Functions
* **1.0.1.0** Reduced the module load time using .net methods
* **1.1.0.0** Added references to managing routes
* **1.2.0.0** Added Functions Start-Speedtest and Get-Whois
* **1.2.0.1** Exported functions
* **1.2.0.2** Fix for Invoke-Unzip
* **1.3.0.0** Added Get-MacVendor function and added changelog markdown
* **2.3.0.0** Added Invoke-Networkscan. Fantastic powershell device discovery tool.
* **2.3.1.0** Modified Invoke-Networkscan to add comment help and additional output objects that were previously left out of the PSCustomObject
* **2.3.2.0** Added regex validation for cidr on function parameters for Invoke-Networkscan
* **2.3.2.1** Added requiremed module PSNmap to the manifest
* **2.3.3.0** Filtering null results for Invoke-Networkscan
* **2.3.3.0** updated help for Invoke-Networkscan
* **2.3.4.0** Spellcheck Everything
* **2.3.5.0** Added option to choose number of threads to process for Invoke-Networkscan, added Write-Progress to the process block, and simplified the arp refresh to shave all unnecessary time off for that function.
* **2.3.5.1** Fix for Write-Progress
* **2.3.5.2** Fix for non-exported function
* **2.3.6.0** Added Reset-NetworkAdapter and Reset-NetworkStack
* **2.3.7.0** Updated Invoke-Network scan to use a bundled OUI file instead of API calls. This has sped up vendor lookups by over 50%
* **2.3.7.1** Exported missing Get-Whois function
* **2.3.7.2** Formating Changes
* **2.3.8.0** Added aliases
* **2.3.8.1** Updated restmethods to use invoke-command to get around parsing issues
* **2.3.8.2** Fix for invoked restmethod arguments in function Get-PublicIP
* **2.3.8.3** Updated Get-PublicIP to work in multiple powershell versions using the same command
* **2.4.0.0** Tested and marked Core compatbile
* **2.4.1.0** Added the Function Invoke-Monitor
* **2.5.0.0** Add the Function Show-IPInfo
* **2.5.1.0** Added try catch blocks and secondary catches to handle more errors for Invoke-NetworkScan
* **2.5.2.0** Updated Invoke-Monitor with a seconds between tests parameter
* **2.6.0.0** Added Function Start-Trace
* **2.7.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **2.8.0.0** Added Markdown Documentation and link help
* **2.8.1.0** Certain functions run by Invoke-Monitoring exist in the non required admintoolbox.fun module. I added those functions to this module so it's not a required module and errors won't be presented.
* **2.9.0** Update versioning standard and added LicenseURI.
* **2.10.0** Added Invoke-Ethr a crescendo wrapper for Microsoft Ethr.
* **2.11.0** Added Invoke-Iperf a crescendo wrapper for Microsoft Iperf3.
* **2.11.1** Update Get-Networking to show function changes.
* **2.11.2** Updated Start-Trace to now be Start-TraceNG. This addresses clobber issues outlined in issues #23
* **2.12.0** Incorporated PSNmap functions directly to remove the external dependency
* **2.12.1** Invoke-Iperf client parameter changed to a switch parameter to fix it incorrectly set as a string.
* **2.12.2** Move comment based help outside function block
* **2.12.3** Bug fix for Invoke-Networkscan OUI path variable
* **2.12.4** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)
* **2.12.5** Update Icon URI in Manifest
* **2.12.6** Increment Manifest to resolve missing manifest version in github timeline
* **2.13.0** Push any small changes
* **2.13.2** Push any small changes
* **2.13.3** Maintenance Release
* **2.13.4** Fix invoke-iperf client not permitting host ip entry
* **2.13.5** Maintenance Release
* **2.13.6** Maintenance Release
* **2.14.0** Upgrade OUI list with IEEE MA-L list date 20221213
* **2.15.0** Added Function Get-NICConfig
* **2.15.1** Updated Get-NICConfig comment help spacing, so the help is actually presented when using help get-nicconfig
* **2.15.2** fix: missing manifest from workflow writeback
* **2.15.3** Add parameter help for invoke-networkscan, and update substring for vendor custom object to eliminate whitespace.
* **2.15.4** Add notes to invoke-networkscan help.
* **2.15.5** Maintenance Release
* **2.15.7** Maintenance Release
* **2.15.8** Workflow Fix
* **2.15.9** Workflow Fix
* **2.15.10** Workflow Fix
* **2.15.11** CI Maintenance Release
* **2.15.14** CI Maintenance Release
* **2.16.00** Remove start-traceng
* **2.16.1** CI Maintenance Release
* **2.16.53** CI Maintenance Release
* **2.17.0** Add Custom Port Scanning option to Invoke-NetworkScan
* **2.17.1** CI Maintenance Release
* **2.17.23** CI Maintenance Release
* **2.18.00** Remove outdated and broken Start-Speedtest
* **2.18.1** CI Maintenance Release
* **2.18.57** CI Maintenance Release
* **2.19.0** Update get-publicip to add an alias and provide the output as a pscustomobject.
* **2.19.1** CI Maintenance Release
* **2.19.2** Update get-publicip. Add ability to provide ips in a string arrayand added a api rate limit parameter.
* **2.19.3** CI Maintenance Release
* **2.19.5** CI Maintenance Release
* **2.19.6** Fix get-publicip to not require providing an ip.
* **2.19.7** CI Maintenance Release
* **2.19.12** CI Maintenance Release
* **2.20.00** Add token parameter to get-publicip to allow exceeding free api limit
* **2.20.1** CI Maintenance Release
* **2.20.15** CI Maintenance Release
* **2.21.0.0** Add workflow versioning
* **2.21.0.1** CI Maintenance Release
* **2.21.0.24** CI Maintenance Release
* **2.21.1.0** Update get-networking
* **2.21.1.1** CI Maintenance Release
* **2.21.1.30** CI Maintenance Release
* **2.22.0.0** Updated get-publicip with an additional lookup source
* **2.22.0.1** CI Maintenance Release
* **2.22.0.12** CI Maintenance Release
* **2.23.0.0** Add function Get-SpeedtestCLI
* **2.23.0.1** CI Maintenance Release
* **2.23.0.2** CI Maintenance Release
* **2.23.0.3** CI Maintenance Release
* **2.23.0.4** CI Maintenance Release
* **2.23.0.5** CI Maintenance Release
* **2.23.0.6** CI Maintenance Release
* **2.23.0.7** CI Maintenance Release
* **2.23.0.8** CI Maintenance Release