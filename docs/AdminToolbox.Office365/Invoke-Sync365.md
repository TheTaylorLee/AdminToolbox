---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version:
schema: 2.0.0
---

# Invoke-Sync365

## SYNOPSIS

## SYNTAX

```
Invoke-Sync365 [[-AzureSyncServer] <String>] [[-Policy] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function allows for initiating an Azure AD Sync with a short alias.
Saves time having to login to the Azure AD Synced server or type out the Full Invoke-Command cmdlet each time.

## EXAMPLES

### EXAMPLE 1
```
Specify the Azure Sync Server for future use
```

Invoke-Sync365 -AzureSyncServer server.domain.com

### EXAMPLE 2
```
If the Azure Sync Server has been specified simply type the alias to initiate an azure sync
```

Sync365

### EXAMPLE 3
```
Specify a sync policy other than delta
```

Sync365 -Policy Initial

## PARAMETERS

### -AzureSyncServer
Specifies the server that has Azure Active Directory Synchronization installed

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Policy
Specify a sync policy other than delta

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Delta
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
If attempting to run this on a server that doesn't have PSRemoting enabled and Azure AD Sync setup, then this function will fail.

## RELATED LINKS
