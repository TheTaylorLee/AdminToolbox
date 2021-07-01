function Start-Trace {
    <#
    .DESCRIPTION
    Launches TraceNG tool

    .EXAMPLE
    Start-Trace

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    [CmdletBinding()]
    [Alias('trace')]
    param(
    )


    traceng.exe
}