---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-PerUserMFAEnforced

## SYNOPSIS

## SYNTAX

```
Invoke-PerUserMFAEnforced [<CommonParameters>]
```

## DESCRIPTION
This function will Enable and Enforce per user MFA in Azure and Office 365

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
***https://docs.microsoft.com/en-us/azure/active-directory/roles/permissions-reference#authentication-administrator
One of the following roles are required
Role	                                  | Manage user's auth methods	         | Manage per-user MFA	           | Manage MFA settings | Manage auth method policy | Manage password protection policy
Authentication Administrator             | Yes for some users (see above)       | Yes for some users (see above)  |	No	                |  No	                    | No
Privileged Authentication Administrator	| Yes for all users	                   | Yes for all users               |No	               | No	                       | No
Authentication Policy Administrator    | No                                   |	No                              | Yes                 | Yes	                      | Yes

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

