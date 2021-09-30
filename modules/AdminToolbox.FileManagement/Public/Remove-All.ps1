<#
    .Description
    This Command removes log files, temp files, and empties the recycle bin. Access denied errors do not indicate a failure of the script. Run for the local or a remote PC.

    .Parameter Computer
    Specify a remote computer run cleanup against

    .EXAMPLE
    Remove-All

    Free up space on the local computer

    .EXAMPLE
    Remove-All -Computer JackPC10

    Free up space on a remote PC. May be more effective if run locally depending on in place security.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-All {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('rall')]
    param (
        [Parameter(Mandatory = $false)]$computer
    )


    #Check For Admin Privleges
    Get-Elevation

    #Statement of Free Space before Cleaning
    Write-Host " "
    Write-Host "Free Space Before Cleaning" -ForegroundColor Yellow
    Get-CimInstance win32_logicaldisk -Filter "drivetype=3" -computer $computer |
    Format-Table -Property DeviceID, Volumename, `
    @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
    @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
    @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }

    #Statement that the function is freeing up space
    Write-Host "Freeing up space. Enjoy your Coffee!" -BackgroundColor Black -ForegroundColor Green

    #Free up space on the local or remote computer
    if ($null -ne $computer) {
        $ErrorActionPreference = 'SilentlyContinue'

        Get-Service -ComputerName $computer TrustedInstaller | Stop-Service -Force
        Get-ChildItem -Path "\\$computer\C$\windows\logs" -Include '*.log' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "\\$computer\C$\windows\logs" -Include '*.cab' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "\\$computer\C$\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "\\$computer\C$\$recycle.bin" -Include '*' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "\\$computer\C$\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "\\$computer\C$\Users\*\AppData\Local\Microsoft\Terminal Server Client\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
        $tempfolders = @("\\$computer\C$\Windows\Temp\*", "\\$computer\C$\Windows\Prefetch\*", "\\$computer\C$\Documents and Settings\*\Local Settings\temp\*", "\\$computer\C$\Users\*\Appdata\Local\Temp\*")
        Remove-Item $tempfolders -Force -Recurse
        $tempinternetfolders = @("\\$computer\C$\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "\\$computer\C$\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "\\$computer\C$\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
        Remove-Item $tempinternetfolders -Force -Recurse
        $cachefolders = @("\\$computer\C$\users\*\appdata\roaming\zoom\*", "\\$computer\C$\users\*\AppData\Local\Google\*", "\\$computer\C$\users\*\Downloads\*", "\\$computer\C$\users\*\AppData\Roaming\Slack\Cache\*", "\\$computer\C$\users\*\AppData\Local\GoToMeeting\*", "\\$computer\C$\users\*\AppData\Roaming\RingCentralMeetings\*", "\\$computer\C$\users\*\AppData\Local\Microsoft\Terminal Server Client\*")
        Remove-Item $cachefolders -Force -Recurse
        Get-Service -ComputerName $computer -Name TrustedInstaller | Start-Service

        $ErrorActionPreference = 'Continue'

        Write-Host " "
        Write-Host "Free Space After Cleaning" -ForegroundColor Yellow
        Get-CimInstance win32_logicaldisk -Filter "drivetype=3" -computer $computer |
        Format-Table -Property DeviceID, Volumename, `
        @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
        @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
        @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }
    }

    else {
        $ErrorActionPreference = 'SilentlyContinue'

        Stop-Service TrustedInstaller -Force
        Get-ChildItem -Path "C:\windows\" -Include '*.log' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "C:\windows\logs" -Include '*.cab' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "C:\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path 'c:\$recycle.bin' -Include '*' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
        Get-ChildItem -Path "C:\Users\*\AppData\Local\Microsoft\Terminal Server Client\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
        $tempfolders = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
        Remove-Item $tempfolders -Force -Recurse
        $tempinternetfolders = @("C:\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "C:\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "C:\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
        Remove-Item $tempinternetfolders -Force -Recurse
        $cachefolders = @("c:\users\*\appdata\roaming\zoom\*", "c:\users\*\AppData\Local\Google\*", "c:\users\*\Downloads\*", "c:\users\*\AppData\Roaming\Slack\Cache\*", "c:\users\*\AppData\Local\GoToMeeting\*", "c:\users\*\AppData\Roaming\RingCentralMeetings\*", "c:\users\*\AppData\Local\Microsoft\Terminal Server Client\*")
        Remove-Item $cachefolders -Force -Recurse
        powercfg.exe /hibernate off
        Remove-Item c:\hiberfile.sys -Force -ErrorAction 'silentlycontinue'
        Start-Service TrustedInstaller

        $ErrorActionPreference = 'Continue'

        Write-Host " "
        Write-Host "Free Space After Cleaning" -ForegroundColor Yellow
        Get-CimInstance win32_logicaldisk -Filter "drivetype=3" -computer $computer |
        Format-Table -Property DeviceID, Volumename, `
        @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
        @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
        @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }
    }

}