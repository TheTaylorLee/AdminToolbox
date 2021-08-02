---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Remove-DisabledADProfiles

## SYNOPSIS

## SYNTAX

```
Remove-DisabledADProfiles [-domaincontroller] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function leverages PSRemoting to import the AD module a active domain controller.
It will then parse through existing profiles on the local machine to make sure they don't belong to disabled or missing Active Directory Accounts
If a profile matches a missing or disable Active Directroy account it will be deleted on the local client.

## EXAMPLES

### EXAMPLE 1
```
Remove-DisabledADProfiles -domaincontroller DomainControllerDNSName
```

Use Computername to specify the Domain Controller to be queried for active domain accounts

## PARAMETERS

### -domaincontroller
Specify a a domain controller that has Powershell remoting enabled

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This function requires Powershell Remoting be enabled on the leveraged domain controller.
If PSRemoting is disabled run the command \<Enable-PSRemoting -force\> on the domain controller

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

