<#
    .DESCRIPTION
    Transcodes video files containing extensions *.mp4, *.mkv, *.avi, and *.mpg

    Inputted Parameters are

    -metadata title="" -metadata description="" -metadata COMMENT="" -c:v libx265 -crf 21 -ac 6 -c:a aac -preset veryfast

    .PARAMETER crf
    Default is set to 21. Use this parameter to change it to another value.

    .Example
    Start-Transcode

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Start-Transcode {

    [cmdletbinding()]
    [Alias('Transcode')]
    param (
        [Parameter(Mandatory = $False)]$crf = 21
    )

    if ($env:FFToolsSource -and $env:FFToolsTarget) {
        #Change directory to the source folder
        Set-Location $env:FFToolsSource


        $ext = "*.mkv"
        $array = @(Get-ChildItem -Filter $ext)
        Foreach ($video in $array.Name) {
            ffmpeg.exe -i $video -metadata title="" -metadata description="" -metadata COMMENT="" -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$video"
        }

        $ext = "*.avi"
        $array = @(Get-ChildItem -Filter $ext)
        Foreach ($video in $array.Name) {
            ffmpeg.exe -i $video -metadata title="" -metadata description="" -metadata COMMENT="" -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$video"
        }

        $ext = "*.mp4"
        $array = @(Get-ChildItem -Filter $ext)
        Foreach ($video in $array.Name) {
            ffmpeg.exe -i $video -metadata title="" -metadata description="" -metadata COMMENT="" -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$video"
        }

        $ext = "*.mpg"
        $array = @(Get-ChildItem -Filter $ext)
        Foreach ($video in $array.Name) {
            ffmpeg.exe -i $video -metadata title="" -metadata description="" -metadata COMMENT="" -c:v libx265 -crf $crf -ac 6 -c:a aac -preset veryfast "$env:FFToolsTarget$video"
        }
    }

    else {
        Write-Warning "You must first run Set-FFToolsVariables! This is only required once."
    }
}