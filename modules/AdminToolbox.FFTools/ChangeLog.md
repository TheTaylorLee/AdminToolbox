# **AdminToolbox.FFTools**

* **1.0.0** Created the Module
* **1.0.1** Added prompt for staging folder
* **1.0.2** Added parameter for output path
* **1.0.3** Added missing component
* **1.0.4** Corrected Start-Transcode outpath parameter
* **1.1.5** Added ffmpeg.exe and ffprobe.exe to remove need to already have them in path
* **1.1.6** Updated module intro and added show commands function
* **1.1.7** Added transcode switch to burn-subtitiles and changed movie parameter to video
* **1.1.8** Updated the Module intro
* **1.2.8** Added Parameter Validation
* **1.2.9** Resolved path for get-tips file
* **1.2.10** Added a Change Log
* **1.2.11** Exported Functions to the Manifest
* **2.2.11** Split Functions into individual files
* **2.2.12** Added Get-Elevation private function
* **2.2.13** Added Parameter help
* **2.2.14** Added Tags and Links
* **2.2.15** Update Get-IntroFFtools
* **2.2.16** Fixed function typo
* **2.2.18** Setup Github and updated Manifest PSData
* **3.1.1.1** Moving to proper version control
* **4.0.0.0** Converted from a standalone module to a dependency module of admintoolbox
* **4.0.0.1** Fixed import to path, path to resolve ff functions not importing.
* **4.1.0.0** Added command Install-FFTools. This will shrink the overall module size and allow for installing fftools only if needed.
* **4.1.0.1** Exported Install-FFTools function
* **4.2.0.0** Added Set-FFToolsVariables to set persistent enviroment variables. This simplifies this module further by removing the need to specifiy source and target paths.
* **4.2.0.1** Fix to start-burnsubtitles for module admintoolbox.fftools
* **4.2.1.0** Reduced the module load time using .net methods
* **4.2.1.1** Exported Functions Fix
* **4.2.2.0** Removed burn-subtitles option for embedded subtitles
* **4.2.3.0** Updated install-fftools for the latest version
* **4.2.3.1** Fix for Invoke-Unzip
* **4.2.4.0** Added markdown to the changelog
* **4.2.5.0** Spellcheck Everything
* **4.2.5.1** Added Transcode Alias
* **4.2.6.0** Added CRF variable to Start-Transcode and Start-Burnsubtitles
* **4.3.6.0** Added Get-Streams and Start-TranscodeMap
* **4.3.6.1** Formatting fix for private function
* **4.3.6.2** Updated help for burn-subtitles
* **4.4.0.0** Tested and marked Core compatbile
* **4.5.0.0** Implemented a CI/CD workflow that finishes with this module being published to PSGallery
* **4.6.0.0** Added Markdown Documentation and link help
* **4.7.0** Update versioning standard and added LicenseURI.
* **4.7.1** Move comment based help outside function block
* **4.7.2** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)
* **4.7.3** Fix Get-Tips environmental path
* **4.8.0** Added lines to strip title and comments metadata for start-transcode
* **4.9.0** Updated metadata handling
* **4.9.1** Update Icon URI in Manifest
* **4.9.2** Increment Manifest to resolve missing manifest version in github timeline
* **4.10.0** Updated install-fftools install path
* **4.11.0** Updated transcode comments
* **4.12.0** Push any small changes
* **4.12.1** Push any small changes
* **4.12.2** Push any small changes
* **4.13.0** Updated Start-Transcode to copy all subtitles and streams. This introduces a possibility of transcode failures and slower transcode times. So this requires map all parameter be checked.
* **4.13.1** Fix parameter placement
* **4.13.2** Only include first video stream to reduce likelihoods of failures, but still include all audio and subtitles. Included artwork can lead to failures otherwise.
* **4.13.3** start-transcode add ? for ignore null stream
* **4.14.0** Updated set-fftoolsvariables with the option to use machine or user variables. Makes automation possible using the system account if desired over setting a user account in certain scenarios.
* **4.14.1**version bump