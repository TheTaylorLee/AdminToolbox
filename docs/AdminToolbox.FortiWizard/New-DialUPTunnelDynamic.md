---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-DialUPTunnelDynamic

## SYNOPSIS

## SYNTAX

```
New-DialUPTunnelDynamic
```

## DESCRIPTION
This is a CLI wizard that generates a new Dialup IPSec Tunnel Config and related objects.
This will be for the remote side of the tunnel whose public IP is subject to change or Sits behind another NAT firewall.

## EXAMPLES

### EXAMPLE 1
```
New-DialupTunnelDynamic
```

### EXAMPLE 2
```
This example generates and SSH session and invokes the output of this function against that sessions.
```

New-SSHSession -computername 192.168.0.1
$command = New-DialupTunnelDynamic
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output

## PARAMETERS

## INPUTS

## OUTPUTS

## NOTES
Capitalization and spacing is very important when running this function.
Typos should also be avoided.
Any errors resultant from adding spaces, creating typos, or not focusing on persisint casing will lead to errors.
The function will fail, or the config script when pushed to the firewall will fail to produce desired results.

Better parameter validation may be added in future versions of this function.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

