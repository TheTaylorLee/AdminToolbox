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

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
2.12.4