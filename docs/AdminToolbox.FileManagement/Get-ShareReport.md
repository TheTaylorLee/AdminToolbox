---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-ShareReport

## SYNOPSIS

## SYNTAX

```
Get-ShareReport [-DomainController] <Object> [[-Path] <Object>] [[-smbShares] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function produces an excel report of shares for the endpoint it is run on.
The report will have tabs for all of the shares.
Each share tab outlines Share and NTFS permissions for the share.
Additional tabs are created with Active Directroy groups and their members for cross referencing.

## EXAMPLES

### EXAMPLE 1
```
Get-ShareReport -DomainController DCHostname
```

Get a share report for all Shares

### EXAMPLE 2
```
Get-ShareReport -DomainController DCHostname -smbShares Sharename
```

Get a Share report for a single share

## PARAMETERS

### -DomainController
Required parameter for Group Membership information

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

### -Path
Path where the report will be saved.
Default parameter path is $env:USERPROFILE\downloads\Share Permissions.xlsx

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: "$env:USERPROFILE\downloads\Share Permissions.xlsx"
Accept pipeline input: False
Accept wildcard characters: False
```

### -smbShares
For Specifying one or more shares that should be reported on.
Default parameter is set to pull for all shares

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (Get-SmbShare)
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

