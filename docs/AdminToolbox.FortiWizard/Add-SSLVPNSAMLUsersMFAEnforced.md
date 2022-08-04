---
external help file: AdminToolbox.FortiWizardManifest-help.xml
Module Name: AdminToolbox.FortiWizard
online version: https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs
schema: 2.0.0
---

# Add-SSLVPNSAMLUsersMFAEnforced

## SYNOPSIS

## SYNTAX

```
Add-SSLVPNSAMLUsersMFAEnforced [<CommonParameters>]
```

## DESCRIPTION
This functions adds users to the SAML Enterprise APP and Security group only if their Azure MFA is already setup.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
If you are using this function, then you must have already setup the APP Registration and User Groups for FortiClient SAML Authentication.
If that is not the case, check out these links to understand what is required to do so.
After that point this and related functions are useful for adding new users to be permitted to login to the SSLVPN.

https://yura.stryi.com/en/2021-03-05/fortigate-ssl-vpn-azure-mfa/
https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs/AdminToolbox.FortiWizard/SupportDocs

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs](https://github.com/TheTaylorLee/AdminToolbox/tree/master/docs)

