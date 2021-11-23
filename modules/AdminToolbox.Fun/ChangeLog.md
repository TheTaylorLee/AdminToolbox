# **AdminToolbox.Fun**

* **1.0.0.0** Created the Module
* **1.0.1.0** Reduced the module load time using .net methods
* **1.0.1.1** Fix for Invoke-Unzip
* **1.0.2.0** Added markdown to the changelog
* **1.0.3.0** Spellcheck Everything
* **1.0.4.0** Added 3 function
* **1.0.4.1** Removed invoke-rickroll due to false positive anti-virus alerts for bitdefender anti-virus
* **1.0.5.0** Added Get-Creed
* **1.0.5.1** Updated invoke-speak with warnings for powershell core
* **1.1.0.0** Tested and marked Core compatbile
* **1.2.0.0** Added Get-Emote and Start-Snake Functions
* **1.2.0.1** Removed Start-Snake Function for compatability reasons
* **1.3.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **1.3.1.0** Removed reliance on Internet explorer web engine by updating invoke-webrequest functions to use basic parsing
* **1.4.0.0** Added Markdown Documentation and link help
* **1.5.0** Update versioning standard and added LicenseURI.
* **1.5.1** Invoke-speak doesn't work in powershell core. Implemented a break to prevent it running in Pwsh.
* **1.5.2** Move comment based help outside function block
* **1.5.3** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
1.5.3