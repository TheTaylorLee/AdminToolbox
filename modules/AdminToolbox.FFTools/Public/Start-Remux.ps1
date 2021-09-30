<#
    .DESCRIPTION
    Remux files to mkv

    .Example
    Start-Remux

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Start-Remux {

    [cmdletbinding()]
    param (
    )

    if ($env:FFToolsSource -and $env:FFToolsTarget) {
        #Change directory to the source folder
        Set-Location $env:FFToolsSource

        $ext = "*.avi"
        $array = @(Get-ChildItem -Filter $ext)
        Foreach ($video in $array.Name) {
            $videoout = $video -split ".avi"
            ffmpeg.exe -i "$video" -c copy "$env:FFToolsTarget$videoout.mkv"
        }

        $ext = "*.mp4"
        $array = @(Get-ChildItem -Filter $ext)
        Foreach ($video in $array.Name) {
            $videoout = $video -split ".mp4"
            ffmpeg.exe -i "$video" -c copy "$env:FFToolsTarget$videoout.mkv"
        }

        $ext = "*.mpg"
        $array = @(Get-ChildItem -Filter $ext)
        Foreach ($video in $array.Name) {
            $videoout = $video -split ".mpg"
            ffmpeg.exe -i "$video" -c copy "$env:FFToolsTarget$videoout.mkv"
        }
    }

    else {
        Write-Warning "You must first run Set-FFToolsVariables! This is only required once."
    }
}