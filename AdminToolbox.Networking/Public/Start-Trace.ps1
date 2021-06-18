function Start-Trace {
    <#
    .DESCRIPTION
    Launches TraceNG tool

    .EXAMPLE
    Start-Trace
    #>

    [CmdletBinding()]
    [Alias('trace')]
    param(
    )


    traceng.exe
}