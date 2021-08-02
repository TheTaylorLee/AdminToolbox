---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-Robocopy

## SYNOPSIS

## SYNTAX

### NoPurgeSync
```
Invoke-Robocopy [-Source] <Object> [-Target] <Object> [-Arguments <Object>] [-NoPurgeSync] [<CommonParameters>]
```

### NoPreset
```
Invoke-Robocopy [-Source] <Object> [-Target] <Object> [-Nopreset] [-Arguments <Object>] [<CommonParameters>]
```

### MirrorSync
```
Invoke-Robocopy [-Source] <Object> [-Target] <Object> [-Arguments <Object>] [-MirrorSync] [<CommonParameters>]
```

## DESCRIPTION
This is a wrapper function that provides preset robocopy options using parameter sets and supports running with no presets.

## EXAMPLES

### EXAMPLE 1
```
$Arguments = @("/mir", "/copyall", "/r:1", "/w:1", "/zb", "/E")
$Arguments | Invoke-Robocopy -Source c:\temp -Target c:\test -nopreset
```

The NoPresets parameter set allows for specifying any valid robocopy arguments in any combination that is preferred.

### EXAMPLE 2
```
Invoke-Robocopy -Source c:\temp -Target c:\test -MirrorSync
```

Default set of parameters for mirroring directories with permissions and purging files that no longer exist at the source.
#Command run is equal to \<Robocopy.exe $Source $Target /mir /COPY:DATSO /r:1 /w:1 /zb $Arguments\>

### EXAMPLE 3
```
Invoke-Robocopy -Source c:\temp -Target c:\test -NoPurgeSync
```

Default set of parameters for mirroring directories with permissions without purging files that no longer exist at the source.
#Command run is equal to \<Robocopy.exe $Source $Target /e /COPY:DATSO /r:1 /w:1 /zb $Arguments\>

## PARAMETERS

### -Source
Source directory from which files are being copied from

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

### -Target
The target directory for copied files

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Nopreset
Specifies that you will be providing your own parameter set for the Robocopy Job

```yaml
Type: SwitchParameter
Parameter Sets: NoPreset
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Arguments
Any combination of robocopy parameters that can be passed to the NoPreset paremeterset, or any prepopulated parametersets

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -MirrorSync
Specifies that you wish to use the MirrorSync preset options for the Robocopy job

```yaml
Type: SwitchParameter
Parameter Sets: MirrorSync
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoPurgeSync
Specifies that you wish to use the NoPurgeSync preset options for the Robocopy job

```yaml
Type: SwitchParameter
Parameter Sets: NoPurgeSync
Aliases:

Required: True
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

