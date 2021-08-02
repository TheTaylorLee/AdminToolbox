---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Connect-Office365

## SYNOPSIS

## SYNTAX

### Skype
```
Connect-Office365 -AcctName <Object> [-Skype] [<CommonParameters>]
```

### Sharepoint
```
Connect-Office365 -DomainHost <Object> [-SharepointOnline] [<CommonParameters>]
```

### AzureAD
```
Connect-Office365 [-AzureAD] [<CommonParameters>]
```

### ExchangeOnline
```
Connect-Office365 [-ExchangeOnline] [<CommonParameters>]
```

### ExchangeOnlinev2
```
Connect-Office365 [-ExchangeOnlinev2] [<CommonParameters>]
```

### SecurityandCompliance
```
Connect-Office365 [-SecurityandCompliance] [<CommonParameters>]
```

### Teams
```
Connect-Office365 [-Teams] [<CommonParameters>]
```

### Az
```
Connect-Office365 [-Az] [<CommonParameters>]
```

### MSOnline
```
Connect-Office365 [-MSOnline] [<CommonParameters>]
```

## DESCRIPTION
Connect to all Office 365 Modules or just those chosen using the provided parameters

## EXAMPLES

### EXAMPLE 1
```
Connect-Office365 -acctName name@bigcompany.com -domainHost bigcompany -all
```

Connects to all included office 365 modules for this function

### EXAMPLE 2
```
Connect-Office365 -acctName name@bigcompany.com -skype
```

Connects to skype and includes it mandatory parameters

### EXAMPLE 3
```
Connect-Office365 -domainhost bigcompany -SharepointOnline
```

Connects to Sharepoint and includes it mandatory parameters

### EXAMPLE 4
```
Connect-Office365 -AzureAD
```

Connects to a specific module using the available AzureAD parameter

### EXAMPLE 5
```
Connect-Office365 -AzureAD -Teams
```

Connects to multiple specified modules

## PARAMETERS

### -AcctName
Required Office 365 Username for importing a skype online session

```yaml
Type: Object
Parameter Sets: Skype
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomainHost
Tenant specific part of the uri for the Sharepoint host

```yaml
Type: Object
Parameter Sets: Sharepoint
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AzureAD
Connect to Azure AD tenant administrative Module.
AKA AzureAD v2

```yaml
Type: SwitchParameter
Parameter Sets: AzureAD
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SharepointOnline
Connect to the SharepointOnline Module

```yaml
Type: SwitchParameter
Parameter Sets: Sharepoint
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExchangeOnline
Connect to the Exchange Online Module

```yaml
Type: SwitchParameter
Parameter Sets: ExchangeOnline
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExchangeOnlinev2
Connect to the Exchange Online Module

```yaml
Type: SwitchParameter
Parameter Sets: ExchangeOnlinev2
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecurityandCompliance
Connect to the Security and Compliance Module

```yaml
Type: SwitchParameter
Parameter Sets: SecurityandCompliance
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Skype
Connect to the Skype Module

```yaml
Type: SwitchParameter
Parameter Sets: Skype
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Teams
Connect to the Teams Module

```yaml
Type: SwitchParameter
Parameter Sets: Teams
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Az
Connect to the Azure AD resource management module

```yaml
Type: SwitchParameter
Parameter Sets: Az
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSOnline
Connect to the the original tenant based administrative module.
AKA AzureAD v1

```yaml
Type: SwitchParameter
Parameter Sets: MSOnline
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
#Sharepoint Online Module \
The SharePoint Online Management Shell is a Windows PowerShell module that you can use to manage SharePoint Online users, sites, and site collections.
\
Sharepoint Online Module https://www.microsoft.com/en-us/download/details.aspx?id=35588

#Azure AD Module \
Windows Azure AD tenant-based administrative tasks such as user management, domain management and for configuring single sign-on \
Install-Module AzureAD

#Microsoft Online (MSOnline) Module: aka Azure AD V1 Module \
Original Azure AD module for user management and has legacy functions not include with the Azure AD Module \
   Install-Module MSOnline

#Exchange Online Module \
Exchange Online PowerShell allows you to manage your Exchange Online settings from the command line.
\
Install-Module Exchangeonline

#Exchange Online Module v2 \
Exchange Online PowerShell allows you to manage your Exchange Online settings from the command line.
\
Install-Module ExchangeOnlineManagement

#Security and Compliance Module \
Office 365 Security & Compliance Center PowerShell allows you to manage your Office 365 Security & Compliance Center settings from the command line.
\
Install-Module Exchangeonline

#Skype For Business Module \
Skype For Business Module allows managing Skype for Business settings from the Command Line.
\
Download and install Skype for Business Module https://www.microsoft.com/en-us/download/details.aspx?id=39366 \
If bug still exists, Visual C++ 2017 x64 14.10.25008 is needed to work with this module.

#Microsoft Teams Module \
Microsoft Teams Module Module allows managing Microsoft Teams settings from the Command Line.
\
Install-module MicrosoftTeams

#Azure AZ Module \
Azure Az Module Module allows managing Azure settings, subscriptions, VM, Resource groups, and more from the Command Line.
\
Replaces AzureRM \
Install-Module -Name Az

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

