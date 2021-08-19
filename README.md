# AdminToolbox
The AdminToolbox Powershell Module has multiple dependency modules that are intended to provide a swiss army knife of Admin tools. I am adding to it over time. I recommend if using any of the modules, install the AdminToolbox module. It will install the other required modules, it has some functions that are useful for function discovery, and it provides some environment options.

[![PSGallery Publish](https://github.com/TheTaylorLee/AdminToolbox/actions/workflows/PS_Gallery_Pipeline.yml/badge.svg?branch=master)](https://github.com/TheTaylorLee/AdminToolbox/actions/workflows/PS_Gallery_Pipeline.yml)

<p align="Left">
<a href="https://github.com/TheTaylorLee/AdminToolbox"><img src="https://img.shields.io/github/repo-size/thetaylorlee/admintoolbox?label=Repository%20Size"></a>
<a href="https://github.com/TheTaylorLee/AdminToolbox/issues?q=is%3Aopen+is%3Aissue"><img src ="https://img.shields.io/github/issues-raw/thetaylorlee/admintoolbox"></a>
<a href="https://github.com/TheTaylorLee/AdminToolbox/issues?q=is%3Aissue+is%3Aclosed"><img src ="https://img.shields.io/github/issues-closed/thetaylorlee/admintoolbox"></a>
</p>

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.svg"></a>
</p>



### To get started

```Powershell
Install-Module AdminToolbox -Allowclobber -Force
```

### Sample Videos

[New-P2PTunnel](https://www.youtube.com/watch?v=stIkaeUwJ4c)

## AdminToolbox.Required Modules

#### ActiveDirectory
Active Directory Related functions. This module focuses on Account & Group, management & discovery.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.ActiveDirectory"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.ActiveDirectory.svg?label=AdminToolbox.ActiveDirectory&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.ActiveDirectory"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.ActiveDirectory.svg"></a>
</p>

#### EndpointManagement
> Functions for management of endpoints and servers. This module focuses on new endpoint setups and common management tasks for them.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.EndpointManagement"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.EndpointManagement.svg?label=AdminToolbox.EndpointManagement&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.EndpointManagement"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.EndpointManagement.svg"></a>
</p>

#### Exchange
> Functions for Exchange Management. A few functions focused on mailboxes, connecting to exchange PowerShell, and Exchange Virtual Directories.

#### FFTools
> Expedite simple ffmpeg actions. This module focuses on simple transcoding tasks and batch processing of media.

#### FileManagement
> File Management Functions. This module offers some share and file management options. One of it's most useful features is free space cleanup.

#### FortiWizard
> This module was born from a desire to use variables for generating Fortinet config scripts. It has since developed as a way to take the output of a config function and push it to a FortiGate through invoked SSH commands, and generate full VPN configs from a VPN form.

[Examples](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/AdminToolbox.FortiWizard/Examples)

[VPN Form](https://github.com/TheTaylorLee/AdminToolbox/raw/master/docs/AdminToolbox.FortiWizard/Examples/VPN%20Buildout%20Form.xlsx)

#### Fun
> Functions that are just for Fun. This includes functions that can play music, presenting powershell creed, and generating funny excuses.

#### Networking
> Networking related Functions. Various functions for network discovery, troubleshooting, and resolution.

#### Office365
> Office 365 and Azure related functions. These functions vary greatly in their purpose, and are all related to Microsoft 365 differing cloud services.

#### Remoting
> Remoting related functions. This module focuses remote access and management tasks.

#### VmwareAutomate
> VMWare related functions. This module focuses on Automateing Bulk VMWare Tasks.
