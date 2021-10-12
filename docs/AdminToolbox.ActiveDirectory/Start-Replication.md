---
external help file: AdminToolbox.ActiveDirectoryManifest-help.xml
Module Name: AdminToolbox.ActiveDirectory
online version: https://evotec.xyz/active-directory-instant-replication-between-sites-with-powershell/
schema: 2.0.0
---

# Start-Replication

## SYNOPSIS
Extracted from EvoTec Blog

https://evotec.xyz/active-directory-instant-replication-between-sites-with-powershell/

## SYNTAX

```
Start-Replication [[-Domain] <String>] [<CommonParameters>]
```

## DESCRIPTION
Initiates a replication sync on all Domain sites

## EXAMPLES

### EXAMPLE 1
```
Start-Replication
```

Starts a sync on the current domain environment

### EXAMPLE 2
```
Start-Replication -Domain Domain2.net
```

Starts a sync on the specified domain environment

## PARAMETERS

### -Domain
Specify a domain to start a replication sync for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $Env:USERDNSDOMAIN
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://evotec.xyz/active-directory-instant-replication-between-sites-with-powershell/](https://evotec.xyz/active-directory-instant-replication-between-sites-with-powershell/)

