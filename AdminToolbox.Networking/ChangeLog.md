# **AdminToolbox.Networking**

![AdminToolbox.Networking](https://github.com/TheTaylorLee/AdminToolbox/blob/master/Images/AdminToolbox.Networking.png)

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