---
external help file: AdminToolbox.FFToolsManifest-help.xml
Module Name: AdminToolbox.FFTools
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Start-BurnSubtitles

## SYNOPSIS

## SYNTAX

```
Start-BurnSubtitles [-video] <Object> [-transcode] [-srtfile] <Object> [[-crf] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Burn subtitles from an srt file.

## EXAMPLES

### EXAMPLE 1
```
Start-BurnSubtitles -video "Action Jackson.mkv" -srtfile "Action Jackson.srt" -Transcode
```

If the transcode switch parameter is used then the file will be transcoded in addition to the subtitles being burned.

## PARAMETERS

### -video
Specify Video Input

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

### -transcode
Specify if the video should also be transcoded

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

### -srtfile
Specify an srt file for use with the Srt parameter set

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

### -crf
Default is set to 21.
Use this parameter to change it to another value.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

