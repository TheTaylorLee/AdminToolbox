<#
    .Description
    This function will clear all teams cache files. This can resolve common issues like images taking a long time to show in Teams.

    .EXAMPLE
    Clear-TeamsCache

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Clear-TeamsCache {

    Write-Warning "This function will close Teams & Outlook."
    $query = Read-Host "Do you wish to continue (yes/no)"
    if ($query -eq 'yes') {
        taskkill /im teams.exe /f
        taskkill /im outlook.exe /f
        Get-ChildItem "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\cache" -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\blob_storage" -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\databases" -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\GPUcache" -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\IndexedDB" -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\Local Storage" -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\tmp" -Recurse -Force | Remove-Item -Force -Recurse
    }
    else {
        Write-Output "Clear teams cache aborted"
    }

}