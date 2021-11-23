# **AdminToolbox.FileManagement**

* **1.0.0.0** Created the Module
* **1.0.1.0** Reduced the module load time using .net methods
* **1.0.1.1** Fix for Invoke-Unzip
* **1.0.2.0** Added markdown to the changelog
* **1.0.3.0** Spellcheck Everything
* **1.0.4.0** Added Aliases
* **1.0.5.0** Added two reporting functions
* **1.1.5.0** Exported the newley added functions in the manifest
* **1.2.0.0** Tested and marked Core compatbile
* **1.2.1.0** Modified Remove-DisabledADProfiles to use a Try/Catch
* **1.3.0.0** Added Get-ShareReport Function that combines ntfs and share permissions reports
* **1.4.0.0** Added Functions get-filename and get-foldername
* **1.5.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **1.6.0.0** Added Markdown Documentation and link help
* **1.7.0** Update versioning standard and added LicenseURI.
* **1.8.0** updated Invoke-Robocopy as a crescendo function and converted existing examples
* **1.9.0** Updated Remove-all to also remove cache files.
* **1.9.1** Move comment based help outside function block
* **1.9.2** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
1.9.2