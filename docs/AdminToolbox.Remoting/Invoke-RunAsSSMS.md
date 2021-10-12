---
external help file: AdminToolbox.RemotingManifest-help.xml
Module Name: AdminToolbox.Remoting
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-RunAsSSMS

## SYNOPSIS
Chosen credentials will be passed to remote SQL server when windows authentication is chosen.
This allows connecting to a SQL server using windows authentication when you are not on that domain.

## SYNTAX

```
Invoke-RunAsSSMS [-account] <Object> [[-SSMSPath] <Object>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Invoke-RunAsSSMS -account domain\account -SSMSPath "C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe"
```

This example will run SQL Server Studio Manager with the remote credentials specified and set the needed path variable.

### EXAMPLE 2
```
Invoke-RunAsSSMS -account domain\account
```

This example will run SQL Server Studio Manager with the remote credentials specified

## PARAMETERS

### -account
Specify the account that should be used for the SQL server you will be connecting to.

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

### -SSMSPath
Specify the Full UNC path to SQL Server Studio Managers ssms.exe.
SSMSPath is only required on the first run of this function and then a user environment variable is set for persistence.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

