#Get commands function
function Get-FFTools {

    if ($env:FFToolsSource -and $env:FFToolsTarget) {
        Set-Location $env:FFToolsSource
    }

    Get-IntroFFT

    Write-Host " "
    Write-Host "FFTools Functions"                                                             -Foregroundcolor green
    Write-Host "Get-Streams           ..Gets the streams for a specified file"                 -Foregroundcolor cyan
    Write-Host "Get-Tips              ..Gets a cheat sheet for a few ffmpeg functions"         -Foregroundcolor cyan
    Write-Host "Install-FFTools       ..Installs FFMpeg into the system path"                  -ForegroundColor cyan
    Write-Host "Set-FFToolsVariables  ..Sets Persistent Environment Variables"                 -ForegroundColor cyan
    Write-Host "Start-BurnSubtitles   ..Starts burning Subtitles to a video file"              -ForegroundColor cyan
    Write-Host "Start-Remux           ..Starts Remuxing a Directory"                           -ForegroundColor cyan
    Write-Host "Start-Transcode       ..Starts Transcoding a Directory"                        -ForegroundColor cyan
    Write-Host "Start-TranscodeMap    ..Starts Transcoding a a file using specified streams"   -ForegroundColor cyan
    Write-Host " "
}