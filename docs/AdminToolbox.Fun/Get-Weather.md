---
external help file: AdminToolbox.FunManifest-help.xml
Module Name: AdminToolbox.Fun
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Get-Weather

## SYNOPSIS

## SYNTAX

```
Get-Weather [-Location] <Object> [<CommonParameters>]
```

## DESCRIPTION
Shows weather for a location or the moon phase

## EXAMPLES

### EXAMPLE 1
```
Get-Weather -Location houston+texas
```

Multiple Location Options Available

paris                 # city name
Eiffel+tower          # any location
muc                   # airport code (3 letters)
94107                 # area codes
moon                  # Moon phase (add ,+US or ,+France for these cities)
moon@2016-10-25       # Moon phase for the date (@2016-10-25)

## PARAMETERS

### -Location
Specify a location to get weather for

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
For help modifying the function

http://wttr.in/:help

https://winaero.com/blog/get-weather-forecast-powershell/

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

