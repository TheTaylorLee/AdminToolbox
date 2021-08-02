---
external help file: AdminToolbox.FFToolsManifest-help.xml
Module Name: AdminToolbox.FFTools
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Start-TranscodeMap

## SYNOPSIS

## SYNTAX

```
Start-TranscodeMap [-video] <Object> [-m1] <Object> [[-m2] <Object>] [[-m3] <Object>] [[-m4] <Object>]
 [[-m5] <Object>] [[-crf] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Allows specifying up to 5 streams to include in a transcode file

## EXAMPLES

### EXAMPLE 1
```
Start-TranscodeStreams -video .\movie.mkv -m1 0:0 -m2 0:2 -m3 0:5 -crf 23
```

Includes streams 0, 2, and 5 from the file movie.mkv and transcodes with a crf of 23

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

### -m1
Specify a stream to include

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

### -m2
Specify an optional 2nd stream to include

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -m3
Specify an optional 3rd stream to include

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -m4
Specify an optional 4th stream to include

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -m5
Specify an optional 5th stream to include

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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
Position: 7
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

