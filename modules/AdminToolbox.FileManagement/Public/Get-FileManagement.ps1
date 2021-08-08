function Get-FileManagement {

    Get-IntroFM

    Write-Host "File Functions"                                                                                     -ForegroundColor green
    Write-Host "Find-ComputersFiles        ..Finds queried files across 1 or more Computers"                        -ForegroundColor cyan
    Write-Host "Get-FileName               ..Gets a gui for selecting a file"                                       -ForegroundColor cyan
    Write-Host "Get-FileOwner              ..Gets CSV of file owners for a path"                                    -ForegroundColor cyan
    Write-Host "Get-FolderName             ..Gets a gui for selecting a folder"                                     -ForegroundColor cyan
    Write-Host "Get-FolderSize             ..Gets FolderSize of a single folder quickly"                            -ForegroundColor cyan
    Write-Host "Get-ShareReport            ..Gets report of share and NTFS permissions"                             -ForegroundColor cyan
    Write-Host "Invoke-Robocopy            ..Invokes a crescendowrapped robocopy function containing presets"       -ForegroundColor cyan
    Write-Host "Remove-All                 ..Removes many files quickly to free up space"                           -ForegroundColor cyan
    Write-Host "Remove-DisabledADProfiles  ..Removes local profiles of disabled AD users"                           -ForegroundColor cyan
    Write-Host "Remove-OlderThan           ..Removes folders and files older than"                                  -ForegroundColor cyan
    Write-Host " "
}