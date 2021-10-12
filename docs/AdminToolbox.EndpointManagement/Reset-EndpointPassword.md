---
external help file: AdminToolbox.EndpointManagementManifest-help.xml
Module Name: AdminToolbox.EndpointManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Reset-EndpointPassword

## SYNOPSIS

## SYNTAX

```
Reset-EndpointPassword [-Server] <Object> [-User] <Object> [<CommonParameters>]
```

## DESCRIPTION
This function rebuilds the trust relationship for a workstation or server to a Domain

## EXAMPLES

### EXAMPLE 1
```
Reset-EndpintPassword CompanyDC01 Domain\Username
```

Reaches out to a specified domain controller using a domain admin account to rebuild the trust relationship

## PARAMETERS

### -Server
Used to specify a domain controller in the domain

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User
Used to specify a domain admin account

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

