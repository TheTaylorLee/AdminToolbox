function Get-Streams {
    <#
    .DESCRIPTION
    Shows streams for a specified file

    .PARAMETER Video
    Specify Video Input

    .Example
    Get-Streams
    #>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true)]$Video
    )

    if ($env:FFToolsSource -and $env:FFToolsTarget) {
        ffprobe $video -hide_banner
    }

    else {
        Write-Warning "You must first run Set-FFToolsVariables! This is only required once."
    }
}
