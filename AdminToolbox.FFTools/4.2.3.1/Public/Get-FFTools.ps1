#Get commands function
function Get-FFTools {

    Get-IntroFFT

    Write-Host " "
    Write-Host "FFTools Functions"                                                          -Foregroundcolor green
    Write-Host "Get-Tips              ..Gets a cheat sheet for a few ffmpeg functions"      -Foregroundcolor cyan
    Write-Host "Install-FFTools       ..Installs FFMpeg into the system path"               -ForegroundColor cyan
    Write-Host "Set-FFToolsVariables  ..Sets Persistent Enviroment Variables"               -ForegroundColor cyan
    Write-Host "Start-BurnSubtitles   ..Starts burning Subtitles to a video file"           -ForegroundColor cyan
    Write-Host "Start-Remux           ..Starts Remuxing a Directory"                        -ForegroundColor cyan
    Write-Host "Start-Transcode       ..Starts Transcoding a Directory"                     -ForegroundColor cyan
    Write-Host " "
}