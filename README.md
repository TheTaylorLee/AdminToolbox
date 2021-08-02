# AdminToolbox
The AdminToolbox Powershell Module has multiple dependency modules that are intended to provide a swiss army knife of semi-random tools. I am adding to it over time. I recommend if using any of the modules, install the AdminToolbox module. It will install the other required modules, it has some functions that are useful for function discovery, and it provides some environment options.

[![PSGallery Publish](https://github.com/TheTaylorLee/AdminToolbox/actions/workflows/PS_Gallery_Pipeline.yml/badge.svg?branch=master)](https://github.com/TheTaylorLee/AdminToolbox/actions/workflows/PS_Gallery_Pipeline.yml)

If the above workflow shows a status other than passing, the code is being developed. Wait for it to show passed, or download the module from Powershell Gallery.

### To get started

```Powershell
Install-Module AdminToolbox -Allowclobber -Force
```

### Helpful Links

[Docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/) Markdown help and examples can be found here.

[Powershell Gallery](https://www.powershellgallery.com/packages/AdminToolbox/) has all versions of the AdminToolbox Modules.

### Sample Videos

[New-P2PTunnel](https://www.youtube.com/watch?v=stIkaeUwJ4c)

## AdminToolbox.Required Modules

##### ActiveDirectory
> Active Directory Related functions. This module focuses on Account & Group, management & discovery.

##### EndpointManagement
> Functions for management of endpoints and servers. This module focuses on new endpoint setups and common management tasks for them.

##### Exchange
##### FFTools
##### FileManagement
##### FortiWizard

Disclaimer: This module is in no way associated with Fortinet.

> This module was born from a desire to use variables for generating Fortinet config scripts. It has since developed as a way to take the output of a config function and push it to a FortiGate through invoked SSH commands, and generate full VPN configs from a VPN form.

[Examples](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/FortiWizard/Examples)

[VPN Form](https://github.com/TheTaylorLee/AdminToolbox/blob/master/docs/FortiWizard/Examples/VPN%20Buildout%20Form.xlsx)

##### Fun
##### Networking
##### Office365
##### Remoting
##### VmwareAutomate