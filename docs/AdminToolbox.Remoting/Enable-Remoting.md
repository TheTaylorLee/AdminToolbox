---
external help file: AdminToolbox.RemotingManifest-help.xml
Module Name: AdminToolbox.Remoting
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Enable-Remoting

## SYNOPSIS

## SYNTAX

```
Enable-Remoting [-Computer] <Object> [[-Username] <Object>] [[-Password] <SecureString>] [<CommonParameters>]
```

## DESCRIPTION
This Command will enable PowerShell Remoting on a remote PC.

## EXAMPLES

### EXAMPLE 1
```
Enable-PSRemoting -computer PCName -username domain\username
```

This will enable remoting and then prompt for credentials

## PARAMETERS

### -Computer
Computer that PSRemoting is being enabled on

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

### -Username
Username used by PSExec to authenticate with admin privleges

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

### -Password
Password that is associated with the username used

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
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
This function requires psexec.
If you do not, download it with the sysinternals suite.
Add psexec to one of your enviroment variable paths.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

