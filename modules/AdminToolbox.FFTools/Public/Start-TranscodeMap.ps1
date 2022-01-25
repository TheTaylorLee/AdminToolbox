<#
    .DESCRIPTION
    Allows specifying up to 5 streams to include in a transcode file

    .PARAMETER video
    Specify Video Input

    .PARAMETER crf
    Default is set to 21. Use this parameter to change it to another value.

    .PARAMETER m1
    Specify a stream to include

    .PARAMETER m2
    Specify an optional 2nd stream to include

    .PARAMETER m3
    Specify an optional 3rd stream to include

    .PARAMETER m4
    Specify an optional 4th stream to include

    .PARAMETER m5
    Specify an optional 5th stream to include

    .Example
    Start-Transcodemap -video .\movie.mkv -m1 0:0 -m2 0:2 -m3 0:5 -crf 23

    Includes streams 0, 2, and 5 from the file movie.mkv and transcodes with a crf of 23

    .Example
    $files = Get-ChildItem | Select-Object fullname | Where-Object { $_.fullname -like "*mkv*" }
    foreach ($file in $files) {
        Start-Transcodemap -video $file.FullName -m1 0:0 -m2 0:1 -m3 0:2 -m4 0:4 -crf 23
    }

    Transcodemap multiple files where you want to grab the same streams

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Start-TranscodeMap {

    [cmdletbinding()]
    [Alias('TranscodeMap')]
    param (
        [Parameter(Mandatory = $true)]
        $video,
        [Parameter(Mandatory = $true)]
        $m1,
        [Parameter(Mandatory = $false)]
        $m2,
        [Parameter(Mandatory = $false)]
        $m3,
        [Parameter(Mandatory = $false)]
        $m4,
        [Parameter(Mandatory = $false)]
        $m5,
        [Parameter(Mandatory = $false)]$crf = 21
    )

    if ($env:FFToolsSource -and $env:FFToolsTarget) {
        #modify the video parameter to use an mkv extension for the outfile parameter
        $video2 = $video.Split('\')
        $video3 = $video2 | Select-Object -Last 1
        $video4 = $video3 -replace ".{4}$"
        $videoout = $video4 + ".mkv"

        #Run ffmpeg
        if ($m5) {
            ffmpeg.exe -i "$video" -metadata title="" -metadata description="" -metadata COMMENT="" -map $m1 -map $m2 -map $m3 -map $m4 -map $m5 -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$videoout"
        }
        elseif ($m4) {
            ffmpeg.exe -i "$video" -metadata title="" -metadata description="" -metadata COMMENT="" -map $m1 -map $m2 -map $m3 -map $m4 -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$videoout"
        }
        elseif ($m3) {
            ffmpeg.exe -i "$video" -metadata title="" -metadata description="" -metadata COMMENT="" -map $m1 -map $m2 -map $m3 -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$videoout"
        }
        elseif ($m2) {
            ffmpeg.exe -i "$video" -metadata title="" -metadata description="" -metadata COMMENT="" -map $m1 -map $m2 -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$videoout"
        }
        else {
            ffmpeg.exe -i "$video" -metadata title="" -metadata description="" -metadata COMMENT="" -map $m1 -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$videoout"
        }
    }

    else {
        Write-Warning "You must first run Set-FFToolsVariables! This is only required once."
    }
}