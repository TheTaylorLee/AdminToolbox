---
external help file: AdminToolbox.FileManagementManifest-help.xml
Module Name: AdminToolbox.FileManagement
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Invoke-Robocopy

## SYNOPSIS

## SYNTAX

### Default
```
Invoke-Robocopy [-Source] <String> [-Destination] <String> [[-Files] <String>] [-SubDirectories]
 [-EmptyDirectories] [-nLevels <String>] [-Restartable] [-BackupMode] [-RestartableBackup] [-UnBuffered]
 [-EFSRAW] [-CopyFlags <String>] [-CopySEC] [-CopyALL] [-NoCopy] [-SECFix] [-TimeFix] [-Purge] [-Mirror]
 [-MoveFiles] [-MoveAll] [-AddAttributes <String>] [-RemoveAttributes <String>] [-CreateTree] [-FAT] [-256]
 [-MonitorChanges <String>] [-MonitorTime <String>] [-RunHours <String>] [-PerFilePass]
 [-InterPacketGap <String>] [-copyJunctions] [-copySymbolicLinks] [-MultiThread <String>]
 [-dCopyFlags <String>] [-dNoCopy] [-NoOffload] [-Compress] [-IoMaxSize <String>] [-IoRate <String>]
 [-Threshold <String>] [-ArchiveOnly] [-ArchiveOnlyReset] [-IncludeAttributes <String>]
 [-ExcludeAttributes <String>] [-ExcludeFileName] [-ExcludeDirName] [-ExcludeChanged] [-ExcludeNewer]
 [-ExcludeOlder] [-ExcludeExtra] [-ExcludeLonely] [-IncludeSame] [-IncludeTweaked] [-MaxBytes <String>]
 [-MinBytes <String>] [-MaxAGE <String>] [-MinAge <String>] [-MaxLastAccess <String>] [-MinLastAccess <String>]
 [-FATFileTime] [-DST] [-ExcludeSymbolic] [-ExcludeSymbolicDir] [-ExcludeSymbolicFiles] [-IncludeModified]
 [-Retries <String>] [-Wait <String>] [-Registry] [-ToBeDefined] [-LowFreeSpace] [-LFSMFloor <String>] [-LogL]
 [-LogX] [-LogV] [-LogTS] [-LogFP] [-LogBytes] [-LogNS] [-LogNC] [-LogNFL] [-LogNDL] [-LogNP] [-LogETA]
 [-LOGFile <String>] [-LOGFileAppend <String>] [-LOGFileUnicode <String>] [-LOGFileAppendUnicode <String>]
 [-LogTEE] [-LogNJH] [-LogNJS] [-LogUnicode] [-JobName <String>] [-JobSave <String>] [-JobQuit] [-JobNOSD]
 [-JobNODD] [-JobIF] [<CommonParameters>]
```

### help
```
Invoke-Robocopy [-Help] [<CommonParameters>]
```

## DESCRIPTION
This is a PowerShell Crescendo wrapper function for Robocopy or Robust File Copy for Windows

## EXAMPLES

### EXAMPLE 1
```
Invoke-Robocopy -Source c:\temp -Destination c:\test -mirror -copy datso -retries 1 -wait 1
```

Mirror directories with permissions and purge files that no longer exist at the source.
This is equal to \<Robocopy.exe $Source $destination /mir /COPY:DATSO /r:1 /w:1\>

### EXAMPLE 2
```
Invoke-Robocopy -Source c:\temp -destination c:\test -EmptyDirectories -copy datso -retries 1 -wait 1
```

Default set of parameters for mirroring directories with permissions without purging files that no longer exist at the source.
#Command run is equal to \<Robocopy.exe $Source $destination /e /COPY:DATSO /r:1 /w:1\>

## PARAMETERS

### -Source
Copy options
Specify the source directory or file to be copied.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Destination
Copy options
Specify the target directory or filename to be copied to.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Files
Copy options
File(s) to copy  (names/wildcards: default is *.*).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Help
Produces help from the native command

```yaml
Type: SwitchParameter
Parameter Sets: help
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubDirectories
Copy options
copy Subdirectories, but not empty ones.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EmptyDirectories
Copy options
copy subdirectories, including Empty ones.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -nLevels
Copy options
only copy the top n LEVels of the source directory tree.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Restartable
Copy options
copy files in restartable mode.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -BackupMode
Copy options
copy files in Backup mode.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -RestartableBackup
Copy options
use restartable mode; if access denied use Backup mode.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UnBuffered
Copy options
copy using unbuffered I/O (recommended for large files).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -EFSRAW
Copy options
copy all encrypted files in EFS RAW mode.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CopyFlags
Copy options
what to COPY for files (default is /COPY:DAT).
(copyflags : D=Data, A=Attributes, T=Timestamps, X=Skip alt data streams).
(S=Security=NTFS ACLs, O=Owner info, U=aUditing info).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CopySEC
Copy options
copy files with SECurity (equivalent to /COPY:DATS).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CopyALL
Copy options
COPY ALL file info (equivalent to /COPY:DATSOU).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoCopy
Copy options
COPY NO file info (useful with /PURGE).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SECFix
Copy options
FIX file SECurity on all files, even skipped files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimeFix
Copy options
FIX file TIMes on all files, even skipped files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Purge
Copy options
delete dest files/dirs that no longer exist in source.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Mirror
Copy options
MIRror a directory tree (equivalent to /E plus /PURGE).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MoveFiles
Copy options
MOVe files (delete from source after copying).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MoveAll
Copy options
MOVE files AND dirs (delete from source after copying).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AddAttributes
Copy options
Adds the specified attributes to copied files.
The valid values for this option are:
R - Read only
A - Archive
S - System
H - Hidden
C - Compressed
N - Not content indexed
E - Encrypted
T - Temporary

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoveAttributes
Copy options
Removes the specified attributes to copied files.
The valid values for this option are:
R - Read only
A - Archive
S - System
H - Hidden
C - Compressed
N - Not content indexed
E - Encrypted
T - Temporary

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreateTree
Copy options
CREATE directory tree and zero-length files only.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FAT
Copy options
create destination files using 8.3 FAT file names only.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -256
Copy options
turn off very long path (\> 256 characters) support.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MonitorChanges
Copy options
MONitor source; run again when more than n changes seen.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MonitorTime
Copy options
MOnitor source; run again in m minutes Time, if changed.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RunHours
Copy options
24hr Format hhmm-hhmm
Run Hours - times when new copies may be started.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PerFilePass
Copy options
check run hours on a Per File (not per pass) basis.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InterPacketGap
Copy options
Inter-Packet Gap (ms), to free bandwidth on slow lines.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -copyJunctions
Copy options
copy Junctions as junctions instead of as the junction targets.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -copySymbolicLinks
Copy options
copy Symbolic Links as links instead of as the link targets.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MultiThread
Copy options
Do multi-threaded copies with n threads (default 8).
n must be at least 1 and not greater than 128.
This option is incompatible with the /IPG and /EFSRAW options.
Redirect output using /LOG option for better performance.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -dCopyFlags
Copy options
what to COPY for directories (default is /DCOPY:DA).
(copyflags : D=Data, A=Attributes, T=Timestamps, E=EAs, X=Skip alt data streams).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -dNoCopy
Copy options
COPY NO directory info (by default /DCOPY:DA is done).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoOffload
Copy options
copy files without using the Windows Copy Offload mechanism.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Compress
Copy options
Request network compression during file transfer, if applicable.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IoMaxSize
Copy Throttling options
Format n\[KMG\]
Requested max i/o size per {read,write} cycle, in n \[KMG\] bytes.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IoRate
Copy Throttling options
Format n\[KMG\]
Requested i/o rate, in n \[KMG\] bytes per second.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Threshold
Copy Throttling options
Format n\[KMG\]
File size threshold for throttling, in n \[KMG\] bytes (see Remarks).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArchiveOnly
File Selection Options
copy only files with the Archive attribute set.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ArchiveOnlyReset
File Selection Options
copy only files with the Archive attribute and reset it.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeAttributes
File Selection Options
Includes only files for which any of the specified attributes are set.
The valid values for this option are:
R - Read only
A - Archive
S - System
H - Hidden
C - Compressed
N - Not content indexed
E - Encrypted
T - Temporary
O - Offline

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeAttributes
File Selection Options
Excludes files for which any of the specified attributes are set.
The valid values for this option are:
R - Read only
A - Archive
S - System
H - Hidden
C - Compressed
N - Not content indexed
E - Encrypted
T - Temporary
O - Offline

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeFileName
File Selection Options
eXclude Files matching given names/paths/wildcards.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeDirName
File Selection Options
eXclude Directories matching given names/paths.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeChanged
File Selection Options
eXclude Changed files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeNewer
File Selection Options
eXclude Newer files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeOlder
File Selection Options
eXclude Older files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeExtra
File Selection Options
eXclude eXtra files and directories.
An extra file is present in destination but not source; excluding extras will prevent any deletions from the destination.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeLonely
File Selection Options
eXclude Lonely files and directories.
A lonely file is present in source but not destination; excluding lonely will prevent any new files being added to the destination.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSame
File Selection Options
Include Same files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeTweaked
File Selection Options
Include Tweaked files.
A Tweaked file is defined to be one that exists in both the source and destination, with identical size and timestamp, but different attribute settings.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxBytes
File Selection Options
MAXimum file size - exclude files bigger than n bytes.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinBytes
File Selection Options
MINimum file size - exclude files smaller than n bytes.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxAGE
File Selection Options
MAXimum file AGE - exclude files older than n days/date.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinAge
File Selection Options
MINimum file AGE - exclude files newer than n days/date.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxLastAccess
File Selection Options
MAXimum Last Access Date - exclude files unused since n.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinLastAccess
File Selection Options
MINimum Last Access Date - exclude files used since n.
(If n \< 1900 then n = n days, else n = YYYYMMDD date).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FATFileTime
File Selection Options
assume FAT File Times (2-second granularity).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DST
File Selection Options
compensate for one-hour DST time differences.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeSymbolic
File Selection Options
eXclude symbolic links (for both files and directories) and Junction points.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeSymbolicDir
File Selection Options
eXclude symbolic links for Directories and Junction points.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludeSymbolicFiles
File Selection Options
eXclude symbolic links for Files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeModified
File Selection Options
Include Modified files (differing change times).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Retries
Retry Options
number of Retries on failed copies: default 1 million.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wait
Retry Options
Wait time between retries: default is 30 seconds.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Registry
Retry Options
Save /R:n and /W:n in the Registry as default settings.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ToBeDefined
Retry Options
Wait for sharenames To Be Defined (retry error 67).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LowFreeSpace
Retry Options
Operate in low free space mode, enabling copy pause and resume (see Remarks).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LFSMFloor
Retry Options
Format n\[KMG\]
/LFSM, specifying the floor size in n \[K:kilo,M:mega,G:giga\] bytes.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogL
Logging Options
List only - don't copy, timestamp or delete any files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogX
Logging Options
report all eXtra files, not just those selected.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogV
Logging Options
produce Verbose output, showing skipped files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogTS
Logging Options
include source file Time Stamps in the output.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogFP
Logging Options
include Full Pathname of files in the output.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogBytes
Logging Options
Print sizes as bytes.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogNS
Logging Options
No Size - don't log file sizes.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogNC
Logging Options
No Class - don't log file classes.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogNFL
Logging Options
No File List - don't log file names.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogNDL
Logging Options
No Directory List - don't log directory names.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogNP
Logging Options
No Progress - don't display percentage copied.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogETA
Logging Options
show Estimated Time of Arrival of copied files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LOGFile
Logging Options
output status to LOG file (overwrite existing log).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LOGFileAppend
Logging Options
output status to LOG file (append to existing log).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LOGFileUnicode
Logging Options
output status to LOG file as UNICODE (overwrite existing log).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LOGFileAppendUnicode
Logging Options
output status to LOG file as UNICODE (append to existing log).

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogTEE
Logging Options
output to console window, as well as the log file.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogNJH
Logging Options
No Job Header.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogNJS
Logging Options
No Job Summary.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogUnicode
Logging Options
output status as UNICODE.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobName
Job Options
take parameters from the named JOB file.

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobSave
Job Options
SAVE parameters to the named job file

```yaml
Type: String
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobQuit
Job Options
QUIT after processing command line (to view parameters).

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobNOSD
Job Options
NO Source Directory is specified.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobNODD
Job Options
NO Destination Directory is specified.

```yaml
Type: SwitchParameter
Parameter Sets: Default
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -JobIF
Job Options
Include the following Files.

```yaml
Type: SwitchParameter
Parameter Sets: Default
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
Using /PURGE or /MIR on the root directory of the volume formerly caused
robocopy to apply the requested operation on files inside the System
Volume Information directory as well.
This is no longer the case; if
either is specified, robocopy will skip any files or directories with that
name in the top-level source and destination directories of the copy session.

The modified files classification applies only when both source
and destination filesystems support change timestamps (e.g., NTFS)
and the source and destination files have different change times but are
otherwise the same.
These files are not copied by default; specify /IM
to include them.

The /DCOPY:E flag requests that extended attribute copying should be
attempted for directories.
Note that currently robocopy will continue
if a directory's EAs could not be copied.
This flag is also not included
in /COPYALL.

If either /IoMaxSize or /IoRate are specified, robocopy will enable
copy file throttling (the purpose being to reduce system load).
Both may be adjusted to allowable or optimal values; i.e., both
specify desired copy parameters, but the system and robocopy are
allowed to adjust them to reasonable/allowed values as necessary.
If /Threshold is also used, it specifies a minimum file size for
engaging throttling; files below that size will not be throttled.
Values for all three parameters may be followed by an optional suffix
character from the set \[KMG\] (kilo, mega, giga).

Using /LFSM requests robocopy to operate in 'low free space mode'.
In this mode, robocopy will pause whenever a file copy would cause the
destination volume's free space to go below a 'floor' value, which
can be explicitly specified by the LFSM:n\[KMG\] form of the flag.
If /LFSM is specified with no explicit floor value, the floor is set to
ten percent of the destination volume's size.
Low free space mode is incompatible with /MT and /EFSRAW.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

