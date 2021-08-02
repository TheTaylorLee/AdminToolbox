function Invoke-Robocopy {
    <#
    .DESCRIPTION
    This is a wrapper function that provides preset robocopy options using parameter sets and supports running with no presets.

    .PARAMETER Source
    Source directory from which files are being copied from

    .PARAMETER Target
    The target directory for copied files

    .PARAMETER Arguments
    Any combination of robocopy parameters that can be passed to the NoPreset paremeterset, or any prepopulated parametersets

    .PARAMETER MirrorSync
    Specifies that you wish to use the MirrorSync preset options for the Robocopy job

    .PARAMETER NoPreset
    Specifies that you will be providing your own parameter set for the Robocopy Job

    .PARAMETER NoPurgeSync
    Specifies that you wish to use the NoPurgeSync preset options for the Robocopy job

    .EXAMPLE
    $Arguments = @("/mir", "/copyall", "/r:1", "/w:1", "/zb", "/E")
    $Arguments | Invoke-Robocopy -Source c:\temp -Target c:\test -nopreset

    The NoPresets parameter set allows for specifying any valid robocopy arguments in any combination that is preferred.

    .EXAMPLE
    Invoke-Robocopy -Source c:\temp -Target c:\test -MirrorSync

    Default set of parameters for mirroring directories with permissions and purging files that no longer exist at the source.
    #Command run is equal to <Robocopy.exe $Source $Target /mir /COPY:DATSO /r:1 /w:1 /zb $Arguments>

    .EXAMPLE
    Invoke-Robocopy -Source c:\temp -Target c:\test -NoPurgeSync

    Default set of parameters for mirroring directories with permissions without purging files that no longer exist at the source.
    #Command run is equal to <Robocopy.exe $Source $Target /e /COPY:DATSO /r:1 /w:1 /zb $Arguments>

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    [cmdletbinding()]

    param (
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = 'MirrorSync')]
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = 'NoPreset')]
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = 'NoPurgeSync')]
        $Source,
        [Parameter(Mandatory = $true, Position = 2, ParameterSetName = 'MirrorSync')]
        [Parameter(Mandatory = $true, Position = 2, ParameterSetName = 'NoPreset')]
        [Parameter(Mandatory = $true, Position = 2, ParameterSetName = 'NoPurgeSync')]
        $Target,
        [Parameter(Mandatory = $true, ParameterSetName = 'NoPreset')][switch]
        $Nopreset,
        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ParameterSetName = 'MirrorSync')]
        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ParameterSetName = 'NoPreset')]
        [Parameter(Mandatory = $false, ValueFromPipeline = $true, ParameterSetName = 'NoPurgeSync')]
        $Arguments,
        [Parameter(Mandatory = $true, ParameterSetName = 'MirrorSync')][switch]
        $MirrorSync,
        [Parameter(Mandatory = $true, ParameterSetName = 'NoPurgeSync')][switch]
        $NoPurgeSync
    )

    #Check For Admin Privleges
    Get-Elevation


    if ($nopreset) {
        Robocopy.exe $Source $Target $Arguments
    }

    if ($MirrorSync) {
        Robocopy.exe $Source $Target /mir /COPY:DATSO /r:1 /w:1 /zb $Arguments
    }

    if ($NoPurgeSync) {
        Robocopy.exe $Source $Target /E /COPY:DATSO /r:1 /w:1 /zb $Arguments
    }
}