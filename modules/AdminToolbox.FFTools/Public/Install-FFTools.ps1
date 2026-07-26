<#
    .Description
    Downloads ffmpeg essentials build from gyan.dev, moves those files to $env:SystemDrive\fftools, and adds them to system path.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Install-FFTools {

    #Download and unzip ffmpeg exes'
    $url = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
    $zipfile = "C:\Users\$env:username\Downloads\ffmpeg.zip"
    $outpath = "C:\Users\$env:username\Downloads\ffmpeg\"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::TLS12
    Invoke-WebRequest -Uri $url -OutFile $zipfile
    Invoke-Unzip $zipfile $outpath


    #Copy ffmpeg exes' into the system path for execution in powershell
    $FFMpegFiles = Get-ChildItem $outpath -Recurse -Include *.exe
    New-Item -Path $env:SystemDrive\fftools -ItemType Directory
    Copy-Item $FFMpegFiles $env:SystemDrive\fftools

    #Remove stage package
    Remove-Item $zipfile -Force
    Remove-Item $outpath -Force -Recurse

    #Add fftools into system path for this session
    $p = [Environment]::GetEnvironmentVariable("Path")
    $exepath = "$env:SystemDrive\fftools"
    $p += ";$exepath"
    [Environment]::SetEnvironmentVariable("Path", $p)

    #Permanetely add fftools to system path
    $oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
    $newpath = "$oldpath;$exepath"
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newpath

    #Set permissions on fftools directory to ensure no issues if used in automation tasks
    $sharepath = "$env:SystemDrive\fftools"
    $Acl = Get-Acl $SharePath
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("everyone", "FullControl", "ContainerInherit,Objectinherit", "none", "Allow")
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $SharePath $Acl

    Write-Warning "A reboot may be required for ffmpeg to persist in path when restarting your shell."
}