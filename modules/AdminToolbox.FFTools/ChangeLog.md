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
* **4.14.1** Maintenance Release
* **4.14.2** Maintenance Release
* **4.14.3** Maintenance Release
* **4.15.0** Remove ac channel parameter -ac 6. Now upmixing and downmixing is discouraged for keeping original channels.
* **4.15.1** fix: missing manifest from workflow writeback
* **4.15.2** Maintenance Release
* **4.15.3** Maintenance Release
* **4.15.4** Maintenance Release
* **4.15.5** Workflow Fix
* **4.15.6** Workflow Fix
* **4.15.7** Workflow Fix
* **4.15.8** CI Maintenance Release
* **4.15.9** CI Maintenance Release
* **4.15.10** CI Maintenance Release
* **4.15.11** CI Maintenance Release
* **4.15.12** CI Maintenance Release
* **4.15.13** CI Maintenance Release
* **4.15.14** CI Maintenance Release
* **4.15.15** CI Maintenance Release
* **4.15.16** CI Maintenance Release
* **4.15.17** CI Maintenance Release
* **4.15.18** CI Maintenance Release
* **4.15.19** CI Maintenance Release
* **4.15.20** CI Maintenance Release
* **4.15.21** CI Maintenance Release
* **4.15.22** CI Maintenance Release
* **4.15.23** CI Maintenance Release
* **4.15.24** CI Maintenance Release
* **4.15.25** CI Maintenance Release
* **4.15.26** CI Maintenance Release
* **4.15.27** CI Maintenance Release
* **4.15.28** CI Maintenance Release
* **4.15.29** CI Maintenance Release
* **4.15.30** CI Maintenance Release
* **4.15.31** CI Maintenance Release
* **4.15.32** CI Maintenance Release
* **4.15.33** CI Maintenance Release
* **4.15.34** CI Maintenance Release
* **4.15.35** CI Maintenance Release
* **4.15.36** CI Maintenance Release
* **4.15.37** CI Maintenance Release
* **4.15.38** CI Maintenance Release
* **4.15.39** CI Maintenance Release
* **4.15.40** CI Maintenance Release
* **4.15.41** CI Maintenance Release
* **4.15.42** CI Maintenance Release
* **4.15.43** CI Maintenance Release
* **4.15.44** CI Maintenance Release
* **4.15.45** CI Maintenance Release
* **4.16.0** Update functions to copy audio instead of converting to aac.
* **4.16.1** CI Maintenance Release
* **4.16.2** CI Maintenance Release
* **4.16.3** CI Maintenance Release
* **4.16.4** CI Maintenance Release
* **4.16.5** CI Maintenance Release
* **4.16.6** CI Maintenance Release
* **4.16.7** CI Maintenance Release
* **4.16.8** CI Maintenance Release
* **4.16.9** CI Maintenance Release
* **4.16.10** CI Maintenance Release
* **4.16.11** CI Maintenance Release
* **4.16.12** CI Maintenance Release
* **4.16.13** CI Maintenance Release
* **4.16.14** CI Maintenance Release
* **4.16.15** CI Maintenance Release
* **4.16.16** CI Maintenance Release
* **4.16.17** CI Maintenance Release
* **4.16.18** CI Maintenance Release
* **4.16.19** CI Maintenance Release
* **4.16.20** CI Maintenance Release
* **4.16.21** CI Maintenance Release
* **4.16.22** CI Maintenance Release
* **4.16.23** CI Maintenance Release
* **4.16.24** CI Maintenance Release
* **4.16.25** CI Maintenance Release
* **4.16.26** CI Maintenance Release
* **4.16.27** CI Maintenance Release
* **4.16.28** CI Maintenance Release
* **4.16.29** CI Maintenance Release
* **4.16.30** CI Maintenance Release
* **4.16.31** CI Maintenance Release
* **4.16.32** CI Maintenance Release
* **4.16.33** CI Maintenance Release
* **4.16.34** CI Maintenance Release
* **4.16.35** CI Maintenance Release
* **4.16.36** CI Maintenance Release
* **4.16.37** CI Maintenance Release
* **4.16.38** CI Maintenance Release
* **4.16.39** CI Maintenance Release
* **4.16.40** CI Maintenance Release
* **4.16.41** CI Maintenance Release
* **4.16.42** CI Maintenance Release
* **4.16.43** CI Maintenance Release
* **4.16.44** CI Maintenance Release
* **4.16.45** CI Maintenance Release
* **4.16.46** CI Maintenance Release
* **4.16.47** CI Maintenance Release
* **4.16.48** CI Maintenance Release
* **4.16.49** CI Maintenance Release
* **4.16.50** CI Maintenance Release
* **4.16.51** CI Maintenance Release
* **4.16.52** CI Maintenance Release
* **4.16.53** CI Maintenance Release
* **4.16.54** CI Maintenance Release
* **4.16.55** CI Maintenance Release
* **4.16.56** CI Maintenance Release
* **4.16.57** CI Maintenance Release
* **4.16.58** CI Maintenance Release
* **4.16.59** CI Maintenance Release
* **4.16.60** CI Maintenance Release
* **4.16.61** CI Maintenance Release
* **4.16.62** CI Maintenance Release
* **4.16.63** CI Maintenance Release
* **4.16.64** CI Maintenance Release
* **4.16.65** CI Maintenance Release
* **4.16.66** CI Maintenance Release
* **4.16.67** CI Maintenance Release
* **4.16.68** CI Maintenance Release
* **4.16.69** CI Maintenance Release
* **4.16.70** CI Maintenance Release
* **4.16.71** CI Maintenance Release
* **4.16.72** CI Maintenance Release
* **4.16.73** CI Maintenance Release
* **4.16.74** CI Maintenance Release
* **4.16.75** CI Maintenance Release
* **4.16.76** CI Maintenance Release
* **4.16.77** CI Maintenance Release
* **4.16.78** CI Maintenance Release
* **4.16.79** CI Maintenance Release
* **4.16.80** CI Maintenance Release
* **4.16.81** CI Maintenance Release
* **4.16.82** CI Maintenance Release
* **4.16.83** CI Maintenance Release
* **4.16.84** CI Maintenance Release
* **4.16.85** CI Maintenance Release
* **4.16.86** CI Maintenance Release
* **4.16.87** CI Maintenance Release
* **4.16.88** CI Maintenance Release
* **4.16.89** CI Maintenance Release
* **4.16.90** CI Maintenance Release
* **4.16.91** CI Maintenance Release
* **4.16.92** CI Maintenance Release
* **4.16.93** CI Maintenance Release
* **4.16.94** CI Maintenance Release
* **4.16.95** CI Maintenance Release
* **4.16.96** CI Maintenance Release
* **4.16.97** CI Maintenance Release