function Get-FileManagement {

    Get-IntroFM

    Write-Host "File Functions"                                                                            -Foregroundcolor green
    Write-Host "Find-ComputersFiles        ..Finds queried files across 1 or more Computers"               -ForegroundColor cyan
    Write-Host "Get-FileOwner              ..Gets CSV of file owners for a path"                           -Foregroundcolor cyan
    Write-Host "Get-FolderSize             ..Gets FolderSize of a single folder quickly"                   -Foregroundcolor cyan
    Write-Host "Invoke-Robocopy            ..Invokes a wrapped robocopy function containing presets"       -ForegroundColor cyan
    Write-Host "Remove-All                 ..Removes many files quickly to free up space"                  -Foregroundcolor cyan
    Write-Host "Remove-DisabledADProfiles  ..Removes local profiles of disabled AD users"                  -Foregroundcolor cyan
    Write-Host "Remove-OlderThan           ..Removes folders and files older than"                         -Foregroundcolor cyan
    Write-Host "Get-ShareNTFSReport        ..Gets NTFS permissions for server file shares"                 -Foregroundcolor cyan
    Write-Host "Get-SharePermissionsReport ..Gets share permissions on a server"                           -Foregroundcolor cyan
    Write-Host " "
}