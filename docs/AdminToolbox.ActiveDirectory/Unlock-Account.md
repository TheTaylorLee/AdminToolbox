---
external help file: AdminToolbox.ActiveDirectoryManifest-help.xml
Module Name: AdminToolbox.ActiveDirectory
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Unlock-Account

## SYNOPSIS

## SYNTAX

```
Unlock-Account [-Username] <Object> [<CommonParameters>]
```

## DESCRIPTION
Unlocks an Active Directory Account

## EXAMPLES

### EXAMPLE 1
```
Get-LockedAccounts
Unlock-ADAccount -identity JohnD
```

Use Get-lockedAccounts to quickly obtain the identity to use for unlock-ADAccount

## PARAMETERS

### -Username
Username of account being unlocked

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
Requires the Active Directory Module.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

