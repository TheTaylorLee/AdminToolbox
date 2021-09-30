<#
    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Install-FFTools {

    #Download and unzip ffmpeg exes'
    Write-Host "Downloading the windows x64 build of ffmpeg and unpacking in path: $env:SystemRoot\system32" -ForegroundColor Green
    $url = "https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-4.2-win64-static.zip"
    $zipfile = "C:\Users\$env:username\Downloads\ffmpeg.zip"
    $outpath = "C:\Users\$env:username\Downloads\ffmpeg\"
    #[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::TLS12
    Invoke-WebRequest -Uri $url -OutFile $zipfile
    Invoke-Unzip $zipfile $outpath


    #Copy ffmpeg exes' into the system path for execution in powershell
    $FFMpegFiles = Get-ChildItem $outpath -Recurse -Include *.exe
    Copy-Item $FFMpegFiles $env:SystemRoot\system32

    #Remove stage package
    Remove-Item $zipfile -Force
    Remove-Item $outpath -Force -Recurse
}