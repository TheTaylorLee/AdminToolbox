---
external help file: AdminToolbox.NetworkingManifest-help.xml
Module Name: AdminToolbox.Networking
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-WhoIs

## SYNOPSIS
Does a raw WHOIS query and returns the results

## SYNTAX

```
Get-WhoIs [[-query] <String>] [-server <String>] [-NoForward] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Get-Whois poshcode.org
```

The simplest whois search

### EXAMPLE 2
```
Get-Whois poshcode.com
```

This example is one that forwards to a second whois server ...

### EXAMPLE 3
```
Get-Whois poshcode.com -NoForward
```

Returns the partial results you get when you don't follow forwarding to a new whois server

## PARAMETERS

### -query
The query to send to WHOIS servers

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

### -server
A specific whois server to search

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoForward
Disable forwarding to new whois servers

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
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

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

