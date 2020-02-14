function Remove-All {

    <#
    .Description
    This Command removes log files, temp files, and empties the recycle bin. Access denied errors do not indicate a failure of the script. Run for the local or a remote PC.

    .Parameter Computer
    Specify a remote computer run cleanup against

    .EXAMPLE
    Free up space on the local computer

    Remove-All

    .EXAMPLE
    Free up space on a remote PC. May be more effective if run locally depending on in place security.

    Remove-All -Computer JackPC10

    .Link
    Remove-DisabledADProfiles
    Remove-OlderThan
    #>

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
    Get-CimInstance win32_logicaldisk -filter "drivetype=3" -computer $computer |
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
        Get-ChildItem -path "\\$computer\C$\windows\logs" -Include '*.log' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "\\$computer\C$\windows\logs" -Include '*.cab' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "\\$computer\C$\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "\\$computer\C$\$recycle.bin" -Include '*' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "\\$computer\C$\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -include '*.*' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "\\$computer\C$\Users\*\AppData\Local\Microsoft\Terminal Server Client\" -include '*.*' -Recurse -force | Remove-Item -force -Recurse
        $tempfolders = @("\\$computer\C$\Windows\Temp\*", "\\$computer\C$\Windows\Prefetch\*", "\\$computer\C$\Documents and Settings\*\Local Settings\temp\*", "\\$computer\C$\Users\*\Appdata\Local\Temp\*")
        Remove-Item $tempfolders -force -recurse
        $tempinternetfolders = @("\\$computer\C$\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "\\$computer\C$\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "\\$computer\C$\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
        Remove-Item $tempinternetfolders -force -recurse
        Get-Service -ComputerName $computer -Name TrustedInstaller | Start-Service

        $ErrorActionPreference = 'Continue'

        Write-Host " "
        Write-Host "Free Space After Cleaning" -ForegroundColor Yellow
        Get-CimInstance win32_logicaldisk -filter "drivetype=3" -computer $computer |
        Format-Table -Property DeviceID, Volumename, `
        @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
        @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
        @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }
    }

    else {
        $ErrorActionPreference = 'SilentlyContinue'

        Stop-Service TrustedInstaller -Force
        Get-ChildItem -path "C:\windows\" -Include '*.log' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "C:\windows\logs" -Include '*.cab' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "C:\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path 'c:\$recycle.bin' -Include '*' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -include '*.*' -Recurse -force | Remove-Item -force -Recurse
        Get-ChildItem -path "C:\Users\*\AppData\Local\Microsoft\Terminal Server Client\" -include '*.*' -Recurse -force | Remove-Item -force -Recurse
        $tempfolders = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
        Remove-Item $tempfolders -force -recurse
        $tempinternetfolders = @("C:\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "C:\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "C:\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
        Remove-Item $tempinternetfolders -force -recurse
        powercfg.exe /hibernate off
        Remove-Item c:\hiberfile.sys -force -ErrorAction 'silentlycontinue'
        Start-Service TrustedInstaller

        $ErrorActionPreference = 'Continue'

        Write-Host " "
        Write-Host "Free Space After Cleaning" -ForegroundColor Yellow
        Get-CimInstance win32_logicaldisk -filter "drivetype=3" -computer $computer |
        Format-Table -Property DeviceID, Volumename, `
        @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
        @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
        @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }
    }

}