---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# New-P2PTunnelNAT

## SYNOPSIS

## SYNTAX

```
New-P2PTunnelNAT [<CommonParameters>]
```

## DESCRIPTION
This is a CLI wizard that generates a new IPSec Tunnel Config and related objects.
The source Subnet will be Natted by this policy.

## EXAMPLES

### EXAMPLE 1
```
New-P2PTunnelNAT
```

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

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

