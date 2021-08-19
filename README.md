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
Functions for management of endpoints and servers. This module focuses on new endpoint setups and common management tasks for them.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.EndpointManagement"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.EndpointManagement.svg?label=AdminToolbox.EndpointManagement&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.EndpointManagement"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.EndpointManagement.svg"></a>
</p>

#### Exchange
Functions for Exchange Management. A few functions focused on mailboxes, connecting to exchange PowerShell, and Exchange Virtual Directories.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Exchange"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.Exchange.svg?label=AdminToolbox.Exchange&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Exchange"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Exchange.svg"></a>
</p>

#### FFTools
Expedite simple ffmpeg actions. This module focuses on simple transcoding tasks and batch processing of media.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FFTools"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.FFTools&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FFTools"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.FFTools.svg"></a>
</p>

#### FileManagement
File Management Functions. This module offers some share and file management options. One of it's most useful features is free space cleanup.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FileManagement"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.FileManagement&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FileManagement"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.FileManagement.svg"></a>
</p>

#### FortiWizard
This module was born from a desire to use variables for generating Fortinet config scripts. It has since developed as a way to take the output of a config function and push it to a FortiGate through invoked SSH commands, and generate full VPN configs from a VPN form.

[Examples](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/AdminToolbox.FortiWizard/Examples)

[VPN Form](https://github.com/TheTaylorLee/AdminToolbox/raw/master/docs/AdminToolbox.FortiWizard/Examples/VPN%20Buildout%20Form.xlsx)

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FortiWizard"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.FortiWizard&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FortiWizard"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.FortiWizard.svg"></a>
</p>

#### Fun
Functions that are just for Fun. This includes functions that can play music, presenting powershell creed, and generating funny excuses.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Fun"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.Fun&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Fun"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Fun.svg"></a>
</p>

#### Networking
Networking related Functions. Various functions for network discovery, troubleshooting, and resolution.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Networking"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.Networking&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Networking"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Networking.svg"></a>
</p>

#### Office365
Office 365 and Azure related functions. These functions vary greatly in their purpose, and are all related to Microsoft 365 differing cloud services.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Office365"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.Office365&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Office365"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Office365.svg"></a>
</p>

#### Remoting
Remoting related functions. This module focuses remote access and management tasks.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Remoting"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.Remoting&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Remoting"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Remoting.svg"></a>
</p>

#### VmwareAutomate
VMWare related functions. This module focuses on Automateing Bulk VMWare Tasks.

<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox.VMWareAutomate"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox.VMWareAutomate&logo=powershell&ColorB=blue"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.VMWareAutomate"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.VMWareAutomate.svg"></a>
</p>
