---
external help file: AdminToolbox.FFToolsManifest-help.xml
Module Name: AdminToolbox.FFTools
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Start-Transcode

## SYNOPSIS

## SYNTAX

```
Start-Transcode [[-crf] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Transcodes video files containing extensions *.mp4, *.mkv, *.avi, and *.mpg

Inputted Parameters are

-c:v libx265 -crf 21 -ac 6 -c:a aac -preset veryfast

## EXAMPLES

### EXAMPLE 1
```
Start-Transcode
```

## PARAMETERS

### -crf
Default is set to 21.
Use this parameter to change it to another value.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 21
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

