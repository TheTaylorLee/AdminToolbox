<#
    .DESCRIPTION
    Launches TraceNG tool

    .EXAMPLE
    Start-Trace

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Start-TraceNG {

    [CmdletBinding()]
    [Alias('trace')]
    param(
    )

    traceng.exe
}