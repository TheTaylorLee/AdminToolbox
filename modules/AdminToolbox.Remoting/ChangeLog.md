# **AdminToolbox.Remoting**

* **1.0.0.0** Created the Module
* **1.0.0.1** Updated the manifest to resolve clobber issues
* **1.0.0.2** Fix for non-exported command
* **1.0.0.3** Fix for importing support files
* **1.0.1.0** Reduced the module load time using .net methods
* **1.0.1.1** Fix for Invoke-Unzip
* **1.0.2.0** Added markdown to the changelog
* **1.0.3.0** Spellcheck Everything
* **1.0.3.1** Fixed Module Description
* **1.0.3.2** Fixed Module Description
* **1.1.0.0** Tested and marked Core compatbile
* **1.2.0.0** Added Invoke-RWinSta and Invoke-Qwinsta wrapper functions
* **1.2.0.1** Addressed some oversights in the help for Invoke-RWinSta
* **1.3.0.0** Added Functions Remove-TerminalSessions and Get-TerminalSessions
* **1.4.0.0** Added Function Invoke-RunAsSSMS
* **1.5.0.0** Added Function Invoke-RunAsNetwork
* **1.6.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **1.6.1.0** Removed reliance on Internet explorer web engine by updating invoke-webrequest functions to use basic parsing
* **1.7.0.0** Added Markdown Documentation and link help
* **1.8.0** Update versioning standard and added LicenseURI.
* **1.8.1** Invoke-ServiceRecovery doesn't work in Powershell Core. Added a function break with an error to use Legacy Powershell.
* **1.8.2** Move comment based help outside function block
* **1.8.3** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
1.8.3