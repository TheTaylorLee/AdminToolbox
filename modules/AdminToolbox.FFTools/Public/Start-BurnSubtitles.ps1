<#
    .DESCRIPTION
    Burn subtitles from an srt file.

    .PARAMETER Video
    Specify Video Input

    .PARAMETER Transcode
    Specify if the video should also be transcoded

    .PARAMETER SrtFile
    Specify an srt file for use with the Srt parameter set

    .PARAMETER crf
    Default is set to 21. Use this parameter to change it to another value.

    .Example
    Start-BurnSubtitles -video "Action Jackson.mkv" -srtfile "Action Jackson.srt" -Transcode

    If the transcode switch parameter is used then the file will be transcoded in addition to the subtitles being burned.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Start-BurnSubtitles {

    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true)]
        $video,
        [Parameter(Mandatory = $False)]
        [Switch]
        $transcode,
        [Parameter(Mandatory = $true)]$srtfile,
        [Parameter(Mandatory = $False)]$crf = 21
    )

    if ($env:FFToolsSource -and $env:FFToolsTarget) {
        #Change directory to the source folder
        Set-Location $env:FFToolsSource

        #Split variable to only provide the file name
        $videosplit = ($video).Split('\')[-1]
        $srtfilesplit = ($srtfile).Split('\')[-1]

        #execute subtitle burn
        if ($transcode) {
            ffmpeg.exe -i "$videosplit" -vf "subtitles=$srtfilesplit" -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast  "$env:FFToolsTarget$video"
        }

        else {
            ffmpeg.exe -i "$videosplit" -vf "subtitles=$srtfilesplit" "$env:FFToolsTarget$video"
        }
    }

    else {
        Write-Warning "You must first run Set-FFToolsVariables! This is only required once."
    }
}