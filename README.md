<p align="Center">
<a href="https://www.powershellgallery.com/profiles/TaylorLee"><img src="https://github.com/TheTaylorLee/AdminToolbox/blob/master/images/H3.png"></a>
</p>

The AdminToolbox Powershell Module has multiple dependency modules that are intended to provide a swiss army knife of Admin tools. I am adding to it over time. Installing the Admintoolbox Module will install the other required modules. However, it is not necessary to install all modules, and each module can be installed on it's own.

<p align="Left">
<a href="https://github.com/TheTaylorLee/AdminToolbox/actions/workflows/PS_Gallery_Pipeline.yml"><img src="https://img.shields.io/github/workflow/status/thetaylorlee/admintoolbox/PSGallery%20Publish?label=PSGallery%20Publish&logo=Github"></a>
<a href="https://github.com/TheTaylorLee/AdminToolbox/actions/workflows/Update_Docs.yml"><img src="https://img.shields.io/github/workflow/status/thetaylorlee/admintoolbox/Update%20Docs?label=Update%20Docs&logo=Github"></a>
<a href="https://github.com/TheTaylorLee/AdminToolbox/issues?q=is%3Aopen+is%3Aissue"><img src ="https://img.shields.io/github/issues-raw/thetaylorlee/admintoolbox"></a>
</p>

<p align="Left">
<a href="https://open.vscode.dev/TheTaylorLee/AdminToolbox"><img src="https://open.vscode.dev/badges/open-in-vscode.svg"></a>  
</p>

### To get started

```Powershell
Install-Module AdminToolbox -Allowclobber -Force
```

### Sample Videos

[New-P2PTunnel](https://www.youtube.com/watch?v=stIkaeUwJ4c)

## AdminToolbox.Required Modules

#### ActiveDirectory
> Active Directory Related functions. This module focuses on Account & Group, management & discovery.

#### EndpointManagement
> Functions for management of endpoints and servers. This module focuses on new endpoint setups and common management tasks for them.

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
> Remoting related functions. This module focuses on remote access and management tasks.

#### VmwareAutomate
> VMWare related functions. This module focuses on Automateing Bulk VMWare Tasks.

##### Versions
<p align="Left">
<a href="https://www.powershellgallery.com/packages/AdminToolbox"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.svg?label=AdminToolbox&logo=powershell&ColorB=bluee&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.svg?style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.ActiveDirectory"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.ActiveDirectory.svg?label=ActiveDirectory&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.ActiveDirectory"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.ActiveDirectory.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.EndpointManagement"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.EndpointManagement.svg?label=EndpointManagement&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.EndpointManagement"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.EndpointManagement.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.Exchange"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.Exchange.svg?label=Exchange&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Exchange"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Exchange.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.FFTools"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.FFTools.svg?label=FFTools&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FFTools"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.FFTools.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.FileManagement"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.FileManagement.svg?label=FileManagement&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FileManagement"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.FileManagement.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.FortiWizard"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.FortiWizard.svg?label=FortiWizard&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.FortiWizard"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.FortiWizard.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.Fun"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.Fun.svg?label=Fun&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Fun"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Fun.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.Networking"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.Networking.svg?label=Networking&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Networking"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Networking.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.Office365"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.Office365.svg?label=Office365&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Office365"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Office365.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.Remoting"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.Remoting.svg?label=Remoting&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.Remoting"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.Remoting.svg?&style=flat-square"></a>

<a href="https://www.powershellgallery.com/packages/AdminToolbox.VMWareAutomate"><img src="https://img.shields.io/powershellgallery/v/Admintoolbox.VmwareAutomate.svg?label=VMWareAutomate&logo=powershell&ColorB=blue&style=flat-square"></a>
<a href="https://www.powershellgallery.com/packages/AdminToolbox.VMWareAutomate"><img src="https://img.shields.io/powershellgallery/dt/Admintoolbox.VMWareAutomate.svg?&style=flat-square"></a>
</p>
