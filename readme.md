     _______      __              __
    |   _   | .--|  | .--------. |__| .-----.
    |.  1   | |  _  | |        | |  | |     |
    |.  _   | |_____| |__|__|__| |__| |__|__|
    |:  |   |                             _______                   __   __
    |::.|:. |                            |       | .-----. .-----. |  | |  |--. .-----. .--.--.
    `--- ---'                            |.|   | | |  _  | |  _  | |  | |  _  | |  _  | |_   _|
                                         `-|.  |-' |_____| |_____| |__| |_____| |_____| |__.__|
                                           |:  |
                                           |::.|
                                           `---'

The AdminToolbox Powershell Module has multiple dependency modules that are intended to provide a swiss army knife of Admin tools. I am adding to it over time. Installing the Admintoolbox Module will install the other required modules. However, it is not necessary to install all modules, and each module can be installed on it's own.

<p align="Left">
    <a href="https://img.shields.io/github/workflow/status/thetaylorlee/admintoolbox/.github/workflows/PS_Gallery_Pipeline.yml?branch=main">
        <img src="https://img.shields.io/github/actions/workflow/status/TheTaylorLee/AdminToolbox/PS_Gallery_Pipeline.yml?branch=main&label=PSGallery%20Publsh&logo=Github">
    </a>
    <a href="https://img.shields.io/github/workflow/status/thetaylorlee/admintoolbox/.github/workflows/Version_Bump.yml?branch=main">
        <img src="https://img.shields.io/github/actions/workflow/status/TheTaylorLee/AdminToolbox/Version_Bump.yml?branch=main&label=Version%20Bump&logo=Github">
    </a>
    <a href="https://img.shields.io/github/workflow/status/thetaylorlee/admintoolbox/.github/workflows/PSScriptAnalyzer.yml?branch=main">
        <img src="https://img.shields.io/github/actions/workflow/status/TheTaylorLee/AdminToolbox/PSScriptAnalyzer.yml?branch=main&label=PSScriptAnalyzer&logo=Github">
    </a>
    <a href="https://github.com/TheTaylorLee/AdminToolbox/issues?q=is%3Aopen+is%3Aissue">
        <img src ="https://img.shields.io/github/issues-raw/thetaylorlee/admintoolbox">
    </a>
</p>

##### [2,131,791 downloads as of 2025-08-28](https://www.powershellgallery.com/profiles/TaylorLee)

### To get started

```Powershell
Install-Module AdminToolbox -Allowclobber -Force
```

## AdminToolbox Modules Description
#### ActiveDirectory
> Active Directory Related functions. This module focuses on Account & Group, management & discovery.

#### EndpointManagement
> Functions for management of endpoints and servers. This module focuses on new endpoint setups and common management tasks for them.

#### Exchange
> Functions for Exchange Management. A few functions focused on mailboxes, connecting to exchange PowerShell, and Exchange Virtual Directories.

#### FFTools
> Expedite simple ffmpeg actions. This module focuses on opinionated transcoding tasks and batch processing of media.

- This module receives infrequent updates, but is useable. If transcoding frequently consider checking out [Docker-TranscodeAutomation](https://github.com/TheTaylorLee/docker-transcodeautomation)

#### FileManagement
> File Management Functions. This module offers some share and file management options. One of it's most useful features is free space cleanup.

#### FortiWizard
> This module was born from a desire to use variables for generating Fortinet config scripts. It has since developed as a way to take the output of a config function and push it to a FortiGate through invoked SSH commands, and generate full VPN configs from a VPN form.

[Examples](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/AdminToolbox.FortiWizard/Examples)

[VPN Form](https://github.com/TheTaylorLee/AdminToolbox/blob/main/docs/AdminToolbox.FortiWizard/Examples/VPN%20Buildout%20Form.xlsx)

#### Fun
> Functions that are just for Fun. This includes functions that can play music, presenting powershell creed, and generating funny excuses.

#### Networking
> Networking related Functions. Various functions for network discovery, troubleshooting, and resolution.

#### Office365
> Office 365 and Azure related functions. These functions vary greatly in their purpose, and are all related to Microsoft 365 differing cloud services.

- AzureAD and MSOnline modules are being deprecated by Microsoft, or are deprecated by time this is being read. The related functions have been updated to use MSGraph and can be found in the Admintoolbox.MSGraph module. Other office 365 modules that are not deprecated will still be retained.

#### Remoting
> Remoting related functions. This module focuses on remote access and management tasks.

#### SecOps
> A complimentary module with functions specific to security operations or investigations.

#### VmwareAutomate
> VMWare related functions. This module focuses on Automateing Bulk VMWare Tasks.
