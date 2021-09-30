<#
    .DESCRIPTION
    This is a PowerShell Crescendo wrapper function for Robocopy or Robust File Copy for Windows

    .PARAMETER Source
    Copy options
    Specify the source directory or file to be copied.

    .PARAMETER Destination
    Copy options
    Specify the target directory or filename to be copied to.

    .PARAMETER Files
    Copy options
    File(s) to copy  (names/wildcards: default is *.*).

    .PARAMETER Help
    Produces help from the native command

    .PARAMETER SubDirectories
    Copy options
    copy Subdirectories, but not empty ones.

    .PARAMETER EmptyDirectories
    Copy options
    copy subdirectories, including Empty ones.

    .PARAMETER nLevels
    Copy options
    only copy the top n LEVels of the source directory tree.

    .PARAMETER Restartable
    Copy options
    copy files in restartable mode.

    .PARAMETER BackupMode
    Copy options
    copy files in Backup mode.

    .PARAMETER RestartableBackup
    Copy options
    use restartable mode; if access denied use Backup mode.

    .PARAMETER UnBuffered
    Copy options
    copy using unbuffered I/O (recommended for large files).

    .PARAMETER EFSRAW
    Copy options
    copy all encrypted files in EFS RAW mode.

    .PARAMETER CopyFlags
    Copy options
    what to COPY for files (default is /COPY:DAT).
    (copyflags : D=Data, A=Attributes, T=Timestamps, X=Skip alt data streams).
    (S=Security=NTFS ACLs, O=Owner info, U=aUditing info).

    .PARAMETER CopySEC
    Copy options
    copy files with SECurity (equivalent to /COPY:DATS).

    .PARAMETER CopyALL
    Copy options
    COPY ALL file info (equivalent to /COPY:DATSOU).

    .PARAMETER NoCopy
    Copy options
    COPY NO file info (useful with /PURGE).

    .PARAMETER SECFix
    Copy options
    FIX file SECurity on all files, even skipped files.

    .PARAMETER TimeFix
    Copy options
    FIX file TIMes on all files, even skipped files.

    .PARAMETER Purge
    Copy options
    delete dest files/dirs that no longer exist in source.

    .PARAMETER Mirror
    Copy options
    MIRror a directory tree (equivalent to /E plus /PURGE).

    .PARAMETER MoveFiles
    Copy options
    MOVe files (delete from source after copying).

    .PARAMETER MoveAll
    Copy options
    MOVE files AND dirs (delete from source after copying).

    .PARAMETER AddAttributes
    Copy options
    Adds the specified attributes to copied files. The valid values for this option are:
    R - Read only
    A - Archive
    S - System
    H - Hidden
    C - Compressed
    N - Not content indexed
    E - Encrypted
    T - Temporary

    .PARAMETER RemoveAttributes
    Copy options
    Removes the specified attributes to copied files. The valid values for this option are:
    R - Read only
    A - Archive
    S - System
    H - Hidden
    C - Compressed
    N - Not content indexed
    E - Encrypted
    T - Temporary

    .PARAMETER CreateTree
    Copy options
    CREATE directory tree and zero-length files only.

    .PARAMETER FAT
    Copy options
    create destination files using 8.3 FAT file names only.

    .PARAMETER 256
    Copy options
    turn off very long path (> 256 characters) support.

    .PARAMETER MonitorChanges
    Copy options
    MONitor source; run again when more than n changes seen.

    .PARAMETER MonitorTime
    Copy options
    MOnitor source; run again in m minutes Time, if changed.

    .PARAMETER RunHours
    Copy options
    24hr Format hhmm-hhmm
    Run Hours - times when new copies may be started.

    .PARAMETER PerFilePass
    Copy options
    check run hours on a Per File (not per pass) basis.

    .PARAMETER InterPacketGap
    Copy options
    Inter-Packet Gap (ms), to free bandwidth on slow lines.

    .PARAMETER copyJunctions
    Copy options
    copy Junctions as junctions instead of as the junction targets.

    .PARAMETER copySymbolicLinks
    Copy options
    copy Symbolic Links as links instead of as the link targets.

    .PARAMETER MultiThread
    Copy options
    Do multi-threaded copies with n threads (default 8).
    n must be at least 1 and not greater than 128.
    This option is incompatible with the /IPG and /EFSRAW options.
    Redirect output using /LOG option for better performance.

    .PARAMETER dCopyFlags
    Copy options
    what to COPY for directories (default is /DCOPY:DA).
    (copyflags : D=Data, A=Attributes, T=Timestamps, E=EAs, X=Skip alt data streams).

    .PARAMETER dNoCopy
    Copy options
    COPY NO directory info (by default /DCOPY:DA is done).

    .PARAMETER NoOffload
    Copy options
    copy files without using the Windows Copy Offload mechanism.

    .PARAMETER Compress
    Copy options
    Request network compression during file transfer, if applicable.

    .PARAMETER IoMaxSize
    Copy Throttling options
    Format n[KMG]
    Requested max i/o size per {read,write} cycle, in n [KMG] bytes.

    .PARAMETER IoRate
    Copy Throttling options
    Format n[KMG]
    Requested i/o rate, in n [KMG] bytes per second.

    .PARAMETER Threshold
    Copy Throttling options
    Format n[KMG]
    File size threshold for throttling, in n [KMG] bytes (see Remarks).

    .PARAMETER ArchiveOnly
    File Selection Options
    copy only files with the Archive attribute set.

    .PARAMETER ArchiveOnlyReset
    File Selection Options
    copy only files with the Archive attribute and reset it.

    .PARAMETER IncludeAttributes
    File Selection Options
    Includes only files for which any of the specified attributes are set. The valid values for this option are:
    R - Read only
    A - Archive
    S - System
    H - Hidden
    C - Compressed
    N - Not content indexed
    E - Encrypted
    T - Temporary
    O - Offline

    .PARAMETER ExcludeAttributes
    File Selection Options
    Excludes files for which any of the specified attributes are set. The valid values for this option are:
    R - Read only
    A - Archive
    S - System
    H - Hidden
    C - Compressed
    N - Not content indexed
    E - Encrypted
    T - Temporary
    O - Offline

    .PARAMETER ExcludeFileName
    File Selection Options
    eXclude Files matching given names/paths/wildcards.

    .PARAMETER ExcludeDirName
    File Selection Options
    eXclude Directories matching given names/paths.

    .PARAMETER ExcludeChanged
    File Selection Options
    eXclude Changed files.

    .PARAMETER ExcludeNewer
    File Selection Options
    eXclude Newer files.

    .PARAMETER ExcludeOlder
    File Selection Options
    eXclude Older files.

    .PARAMETER ExcludeExtra
    File Selection Options
    eXclude eXtra files and directories.
    An extra file is present in destination but not source; excluding extras will prevent any deletions from the destination.

    .PARAMETER ExcludeLonely
    File Selection Options
    eXclude Lonely files and directories.
    A lonely file is present in source but not destination; excluding lonely will prevent any new files being added to the destination.

    .PARAMETER IncludeSame
    File Selection Options
    Include Same files.

    .PARAMETER IncludeTweaked
    File Selection Options
    Include Tweaked files.
    A Tweaked file is defined to be one that exists in both the source and destination, with identical size and timestamp, but different attribute settings.

    .PARAMETER MaxBytes
    File Selection Options
    MAXimum file size - exclude files bigger than n bytes.

    .PARAMETER MinBytes
    File Selection Options
    MINimum file size - exclude files smaller than n bytes.

    .PARAMETER MaxAGE
    File Selection Options
    MAXimum file AGE - exclude files older than n days/date.

    .PARAMETER MinAge
    File Selection Options
    MINimum file AGE - exclude files newer than n days/date.

    .PARAMETER MaxLastAccess
    File Selection Options
    MAXimum Last Access Date - exclude files unused since n.

    .PARAMETER MinLastAccess
    File Selection Options
    MINimum Last Access Date - exclude files used since n.
    (If n < 1900 then n = n days, else n = YYYYMMDD date).

    .PARAMETER FATFileTime
    File Selection Options
    assume FAT File Times (2-second granularity).

    .PARAMETER DST
    File Selection Options
    compensate for one-hour DST time differences.

    .PARAMETER ExcludeSymbolic
    File Selection Options
    eXclude symbolic links (for both files and directories) and Junction points.

    .PARAMETER ExcludeSymbolicDir
    File Selection Options
    eXclude symbolic links for Directories and Junction points.

    .PARAMETER ExcludeSymbolicFiles
    File Selection Options
    eXclude symbolic links for Files.

    .PARAMETER IncludeModified
    File Selection Options
    Include Modified files (differing change times).

    .PARAMETER Retries
    Retry Options
    number of Retries on failed copies: default 1 million.

    .PARAMETER Wait
    Retry Options
    Wait time between retries: default is 30 seconds.

    .PARAMETER Registry
    Retry Options
    Save /R:n and /W:n in the Registry as default settings.

    .PARAMETER ToBeDefined
    Retry Options
    Wait for sharenames To Be Defined (retry error 67).

    .PARAMETER LowFreeSpace
    Retry Options
    Operate in low free space mode, enabling copy pause and resume (see Remarks).

    .PARAMETER LFSMFloor
    Retry Options
    Format n[KMG]
    /LFSM, specifying the floor size in n [K:kilo,M:mega,G:giga] bytes.

    .PARAMETER LogL
    Logging Options
    List only - don't copy, timestamp or delete any files.

    .PARAMETER LogX
    Logging Options
    report all eXtra files, not just those selected.

    .PARAMETER LogV
    Logging Options
    produce Verbose output, showing skipped files.

    .PARAMETER LogTS
    Logging Options
    include source file Time Stamps in the output.

    .PARAMETER LogFP
    Logging Options
    include Full Pathname of files in the output.

    .PARAMETER LogBytes
    Logging Options
    Print sizes as bytes.

    .PARAMETER LogNS
    Logging Options
    No Size - don't log file sizes.

    .PARAMETER LogNC
    Logging Options
    No Class - don't log file classes.

    .PARAMETER LogNFL
    Logging Options
    No File List - don't log file names.

    .PARAMETER LogNDL
    Logging Options
    No Directory List - don't log directory names.

    .PARAMETER LogNP
    Logging Options
    No Progress - don't display percentage copied.

    .PARAMETER LogETA
    Logging Options
    show Estimated Time of Arrival of copied files.

    .PARAMETER LOGFile
    Logging Options
    output status to LOG file (overwrite existing log).

    .PARAMETER LOGFileAppend
    Logging Options
    output status to LOG file (append to existing log).

    .PARAMETER LOGFileUnicode
    Logging Options
    output status to LOG file as UNICODE (overwrite existing log).

    .PARAMETER LOGFileAppendUnicode
    Logging Options
    output status to LOG file as UNICODE (append to existing log).

    .PARAMETER LogTEE
    Logging Options
    output to console window, as well as the log file.

    .PARAMETER LogNJH
    Logging Options
    No Job Header.

    .PARAMETER LogNJS
    Logging Options
    No Job Summary.

    .PARAMETER LogUnicode
    Logging Options
    output status as UNICODE.

    .PARAMETER JobName
    Job Options
    take parameters from the named JOB file.

    .PARAMETER JobSave
    Job Options
    SAVE parameters to the named job file

    .PARAMETER JobQuit
    Job Options
    QUIT after processing command line (to view parameters).

    .PARAMETER JobNOSD
    Job Options
    NO Source Directory is specified.

    .PARAMETER JobNODD
    Job Options
    NO Destination Directory is specified.

    .PARAMETER JobIF
    Job Options
    Include the following Files.

    .EXAMPLE
    Invoke-Robocopy -Source c:\temp -Destination c:\test -mirror -copy datso -retries 1 -wait 1

    Mirror directories with permissions and purge files that no longer exist at the source.
    This is equal to <Robocopy.exe $Source $destination /mir /COPY:DATSO /r:1 /w:1>

    .EXAMPLE
    Invoke-Robocopy -Source c:\temp -destination c:\test -EmptyDirectories -copy datso -retries 1 -wait 1

    Default set of parameters for mirroring directories with permissions without purging files that no longer exist at the source.
    #Command run is equal to <Robocopy.exe $Source $destination /e /COPY:DATSO /r:1 /w:1>

    .Notes
    Using /PURGE or /MIR on the root directory of the volume formerly caused
    robocopy to apply the requested operation on files inside the System
    Volume Information directory as well. This is no longer the case; if
    either is specified, robocopy will skip any files or directories with that
    name in the top-level source and destination directories of the copy session.

    The modified files classification applies only when both source
    and destination filesystems support change timestamps (e.g., NTFS)
    and the source and destination files have different change times but are
    otherwise the same. These files are not copied by default; specify /IM
    to include them.

    The /DCOPY:E flag requests that extended attribute copying should be
    attempted for directories. Note that currently robocopy will continue
    if a directory's EAs could not be copied. This flag is also not included
    in /COPYALL.

    If either /IoMaxSize or /IoRate are specified, robocopy will enable
    copy file throttling (the purpose being to reduce system load).
    Both may be adjusted to allowable or optimal values; i.e., both
    specify desired copy parameters, but the system and robocopy are
    allowed to adjust them to reasonable/allowed values as necessary.
    If /Threshold is also used, it specifies a minimum file size for
    engaging throttling; files below that size will not be throttled.
    Values for all three parameters may be followed by an optional suffix
    character from the set [KMG] (kilo, mega, giga).

    Using /LFSM requests robocopy to operate in 'low free space mode'.
    In this mode, robocopy will pause whenever a file copy would cause the
    destination volume's free space to go below a 'floor' value, which
    can be explicitly specified by the LFSM:n[KMG] form of the flag.
    If /LFSM is specified with no explicit floor value, the floor is set to
    ten percent of the destination volume's size.
    Low free space mode is incompatible with /MT and /EFSRAW.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-Robocopy {

    [CmdletBinding()]

    param(
        [Parameter(Position = 1, Mandatory = $true, ParameterSetName = 'Default')]
        [string]$Source,
        [Parameter(Position = 2, Mandatory = $true, ParameterSetName = 'Default')]
        [string]$Destination,
        [Parameter(Position = 3, ParameterSetName = 'Default')]
        [string]$Files,
        [Parameter(Mandatory = $true, ParameterSetName = 'help')]
        [switch]$Help,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$SubDirectories,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$EmptyDirectories,
        [Parameter(ParameterSetName = 'Default')]
        [string]$nLevels,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$Restartable,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$BackupMode,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$RestartableBackup,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$UnBuffered,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$EFSRAW,
        [Parameter(ParameterSetName = 'Default')]
        [string]$CopyFlags,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$CopySEC,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$CopyALL,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$NoCopy,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$SECFix,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$TimeFix,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$Purge,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$Mirror,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$MoveFiles,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$MoveAll,
        [Parameter(ParameterSetName = 'Default')]
        [string]$AddAttributes,
        [Parameter(ParameterSetName = 'Default')]
        [string]$RemoveAttributes,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$CreateTree,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$FAT,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$256,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MonitorChanges,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MonitorTime,
        [Parameter(ParameterSetName = 'Default')]
        [string]$RunHours,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$PerFilePass,
        [Parameter(ParameterSetName = 'Default')]
        [string]$InterPacketGap,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$copyJunctions,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$copySymbolicLinks,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MultiThread,
        [Parameter(ParameterSetName = 'Default')]
        [string]$dCopyFlags,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$dNoCopy,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$NoOffload,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$Compress,
        [Parameter(ParameterSetName = 'Default')]
        [string]$IoMaxSize,
        [Parameter(ParameterSetName = 'Default')]
        [string]$IoRate,
        [Parameter(ParameterSetName = 'Default')]
        [string]$Threshold,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ArchiveOnly,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ArchiveOnlyReset,
        [Parameter(ParameterSetName = 'Default')]
        [string]$IncludeAttributes,
        [Parameter(ParameterSetName = 'Default')]
        [string]$ExcludeAttributes,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeFileName,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeDirName,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeChanged,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeNewer,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeOlder,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeExtra,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeLonely,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$IncludeSame,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$IncludeTweaked,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MaxBytes,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MinBytes,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MaxAGE,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MinAge,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MaxLastAccess,
        [Parameter(ParameterSetName = 'Default')]
        [string]$MinLastAccess,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$FATFileTime,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$DST,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeSymbolic,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeSymbolicDir,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ExcludeSymbolicFiles,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$IncludeModified,
        [Parameter(ParameterSetName = 'Default')]
        [string]$Retries,
        [Parameter(ParameterSetName = 'Default')]
        [string]$Wait,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$Registry,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$ToBeDefined,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LowFreeSpace,
        [Parameter(ParameterSetName = 'Default')]
        [string]$LFSMFloor,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogL,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogX,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogV,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogTS,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogFP,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogBytes,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogNS,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogNC,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogNFL,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogNDL,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogNP,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogETA,
        [Parameter(ParameterSetName = 'Default')]
        [string]$LOGFile,
        [Parameter(ParameterSetName = 'Default')]
        [string]$LOGFileAppend,
        [Parameter(ParameterSetName = 'Default')]
        [string]$LOGFileUnicode,
        [Parameter(ParameterSetName = 'Default')]
        [string]$LOGFileAppendUnicode,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogTEE,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogNJH,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogNJS,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$LogUnicode,
        [Parameter(ParameterSetName = 'Default')]
        [string]$JobName,
        [Parameter(ParameterSetName = 'Default')]
        [string]$JobSave,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$JobQuit,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$JobNOSD,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$JobNODD,
        [Parameter(ParameterSetName = 'Default')]
        [switch]$JobIF
    )

    BEGIN {
        $__PARAMETERMAP = @{
            Source               = @{
                OriginalName     = ''
                OriginalPosition = '1'
                Position         = '1'
                ParameterType    = 'string'
                NoGap            = $False
            }
            Destination          = @{
                OriginalName     = ''
                OriginalPosition = '2'
                Position         = '2'
                ParameterType    = 'string'
                NoGap            = $False
            }
            Files                = @{
                OriginalName     = ''
                OriginalPosition = '3'
                Position         = '3'
                ParameterType    = 'string'
                NoGap            = $False
            }
            Help                 = @{
                OriginalName     = '/?'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            SubDirectories       = @{
                OriginalName     = '/S'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            EmptyDirectories     = @{
                OriginalName     = '/E'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            nLevels              = @{
                OriginalName     = '/LEV:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            Restartable          = @{
                OriginalName     = '/Z'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            BackupMode           = @{
                OriginalName     = '/B'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            RestartableBackup    = @{
                OriginalName     = '/ZB'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            UnBuffered           = @{
                OriginalName     = '/J'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            EFSRAW               = @{
                OriginalName     = '/EFSRAW'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            CopyFlags            = @{
                OriginalName     = '/COPY:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            CopySEC              = @{
                OriginalName     = '/SEC'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            CopyALL              = @{
                OriginalName     = '/COPYALL'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            NoCopy               = @{
                OriginalName     = '/NOCOPY'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            SECFix               = @{
                OriginalName     = '/SECFIX'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            TimeFix              = @{
                OriginalName     = '/TIMFIX'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            Purge                = @{
                OriginalName     = '/PURGE'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            Mirror               = @{
                OriginalName     = '/MIR'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            MoveFiles            = @{
                OriginalName     = '/MOV'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            MoveAll              = @{
                OriginalName     = '/MOVE'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            AddAttributes        = @{
                OriginalName     = '/A+:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            RemoveAttributes     = @{
                OriginalName     = '/A-:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            CreateTree           = @{
                OriginalName     = '/CREATE'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            FAT                  = @{
                OriginalName     = '/FAT'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            256                  = @{
                OriginalName     = '/256'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            MonitorChanges       = @{
                OriginalName     = '/MON:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            MonitorTime          = @{
                OriginalName     = '/MOT:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            RunHours             = @{
                OriginalName     = '/RH:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            PerFilePass          = @{
                OriginalName     = '/PF'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            InterPacketGap       = @{
                OriginalName     = '/IPG:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            copyJunctions        = @{
                OriginalName     = '/SJ'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            copySymbolicLinks    = @{
                OriginalName     = '/SL'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            MultiThread          = @{
                OriginalName     = '/MT:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            dCopyFlags           = @{
                OriginalName     = '/DCOPY:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            dNoCopy              = @{
                OriginalName     = '/NODCOPY'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            NoOffload            = @{
                OriginalName     = '/NOOFFLOAD'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            Compress             = @{
                OriginalName     = '/COMPRESS'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            IoMaxSize            = @{
                OriginalName     = '/IoMaxSize:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            IoRate               = @{
                OriginalName     = '/IoRate:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            Threshold            = @{
                OriginalName     = '/Threshold:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            ArchiveOnly          = @{
                OriginalName     = '/A'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ArchiveOnlyReset     = @{
                OriginalName     = '/M'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            IncludeAttributes    = @{
                OriginalName     = '/IA:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            ExcludeAttributes    = @{
                OriginalName     = '/XA:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            ExcludeFileName      = @{
                OriginalName     = '/XF'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeDirName       = @{
                OriginalName     = '/XD'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeChanged       = @{
                OriginalName     = '/XC'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeNewer         = @{
                OriginalName     = '/XN'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeOlder         = @{
                OriginalName     = '/XO'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeExtra         = @{
                OriginalName     = '/XX'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeLonely        = @{
                OriginalName     = '/XL'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            IncludeSame          = @{
                OriginalName     = '/IS'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            IncludeTweaked       = @{
                OriginalName     = '/IT'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            MaxBytes             = @{
                OriginalName     = '/MAX:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            MinBytes             = @{
                OriginalName     = '/MIN:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            MaxAGE               = @{
                OriginalName     = '/MAXAGE:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            MinAge               = @{
                OriginalName     = '/MINAGE:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            MaxLastAccess        = @{
                OriginalName     = '/MAXLAD:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            MinLastAccess        = @{
                OriginalName     = '/MINLAD:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            FATFileTime          = @{
                OriginalName     = '/FFT'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            DST                  = @{
                OriginalName     = '/DST'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeSymbolic      = @{
                OriginalName     = '/XJ'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeSymbolicDir   = @{
                OriginalName     = '/XJD'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ExcludeSymbolicFiles = @{
                OriginalName     = '/XJF'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            IncludeModified      = @{
                OriginalName     = '/IM'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            Retries              = @{
                OriginalName     = '/R:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            Wait                 = @{
                OriginalName     = '/W:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            Registry             = @{
                OriginalName     = '/REG'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            ToBeDefined          = @{
                OriginalName     = '/TBD'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LowFreeSpace         = @{
                OriginalName     = '/LFSM'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LFSMFloor            = @{
                OriginalName     = '/LFSM:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            LogL                 = @{
                OriginalName     = '/L'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogX                 = @{
                OriginalName     = '/X'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogV                 = @{
                OriginalName     = '/V'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogTS                = @{
                OriginalName     = '/TS'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogFP                = @{
                OriginalName     = '/FP'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogBytes             = @{
                OriginalName     = '/BYTES'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogNS                = @{
                OriginalName     = '/NS'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogNC                = @{
                OriginalName     = '/NC'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogNFL               = @{
                OriginalName     = '/NFL'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogNDL               = @{
                OriginalName     = '/NDL'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogNP                = @{
                OriginalName     = '/NP'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogETA               = @{
                OriginalName     = '/ETA'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LOGFile              = @{
                OriginalName     = '/LOG:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            LOGFileAppend        = @{
                OriginalName     = '/LOG+:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            LOGFileUnicode       = @{
                OriginalName     = '/UNILOG:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            LOGFileAppendUnicode = @{
                OriginalName     = '/UNILOG+:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            LogTEE               = @{
                OriginalName     = '/TEE'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogNJH               = @{
                OriginalName     = '/NJH'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogNJS               = @{
                OriginalName     = '/NJS'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            LogUnicode           = @{
                OriginalName     = '/UNICODE'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            JobName              = @{
                OriginalName     = '/JOB:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            JobSave              = @{
                OriginalName     = '/SAVE:'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'string'
                NoGap            = $True
            }
            JobQuit              = @{
                OriginalName     = '/QUIT'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            JobNOSD              = @{
                OriginalName     = '/NOSD'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            JobNODD              = @{
                OriginalName     = '/NODD'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
            JobIF                = @{
                OriginalName     = '/IF'
                OriginalPosition = '0'
                Position         = '2147483647'
                ParameterType    = 'switch'
                NoGap            = $False
            }
        }

        $__outputHandlers = @{ Default = @{ StreamOutput = $true; Handler = { $input } } }
    }

    PROCESS {
        $__commandArgs = @()
        $__boundparms = $PSBoundParameters
        $MyInvocation.MyCommand.Parameters.Values.Where( { $_.SwitchParameter -and $_.Name -notmatch "Debug|Whatif|Confirm|Verbose" -and ! $PSBoundParameters[$_.Name] }).ForEach( { $PSBoundParameters[$_.Name] = [switch]::new($false) })
        if ($PSBoundParameters["Debug"]) { Wait-Debugger }
        foreach ($paramName in $PSBoundParameters.Keys | Sort-Object { $__PARAMETERMAP[$_].OriginalPosition }) {
            $value = $PSBoundParameters[$paramName]
            $param = $__PARAMETERMAP[$paramName]
            if ($param) {
                if ( $value -is [switch] ) { $__commandArgs += if ( $value.IsPresent ) { $param.OriginalName } else { $param.DefaultMissingValue } }
                elseif ( $param.NoGap ) { $__commandArgs += "{0}""{1}""" -f $param.OriginalName, $value }
                else { $__commandArgs += $param.OriginalName; $__commandArgs += $value | ForEach-Object { $_ } }
            }
        }
        $__commandArgs = $__commandArgs | Where-Object { $_ }
        if ($PSBoundParameters["Debug"]) { Wait-Debugger }
        if ( $PSBoundParameters["Verbose"]) {
            Write-Verbose -Verbose -Message robocopy.exe
            $__commandArgs | Write-Verbose -Verbose
        }
        $__handlerInfo = $__outputHandlers[$PSCmdlet.ParameterSetName]
        if (! $__handlerInfo ) {
            $__handlerInfo = $__outputHandlers["Default"] # Guaranteed to be present
        }
        $__handler = $__handlerInfo.Handler
        if ( $PSCmdlet.ShouldProcess("robocopy.exe $__commandArgs")) {
            if ( $__handlerInfo.StreamOutput ) {
                & "robocopy.exe" $__commandArgs | & $__handler
            }
            else {
                $result = & "robocopy.exe" $__commandArgs
                & $__handler $result
            }
        }
    }
}