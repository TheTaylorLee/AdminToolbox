<#
    .Description
    This Command removes log files, temp files, downloads, some appdata, and empties the recycle bin. Dependent on if it's specified this is running on a workstation or server will determine what is deleted.

    .Parameter Hostname
    Specify a remote endpoint and run cleanup against the C$ unc path. Do not use this if the $env:systemdrive of the remote endpoint is not C:

    .EXAMPLE
    Remove-All

    Free up space on the local computer

    .EXAMPLE
    Remove-All -Hostname JackPC10

    Free up space on a remote PC. May be more effective if run locally.

    .EXAMPLE
    Remove-All -server

    Removes folders you wouldn't want on a server such as google chrome and meeting applications in local user appdata, but that you would not want to delete on a workstation.

    .EXAMPLE
    Remove-All -server -hostname 'azure-rds-04.domain.tld'

    Removes folders you wouldn't want on a remote server such as google chrome and meeting applications in local user appdata, but that you would not want to delete on a workstation. May be more effective if run locally.

    .NOTES
    USE AT YOUR OWN RISK. YOU SHOULD READ AND UNDERSTAND THIS FUNCTION BEFORE USING IT.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-All {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias('rall')]
    param (
        [Parameter(Mandatory = $false)]$hostname,
        [Parameter(Mandatory = $false)][Switch]$server
    )

    begin {
        #Check For Admin Privleges
        Get-Elevation

        #Statement of Free Space before process block
        Write-Host " "
        Write-Host "Free Space Before Cleaning" -ForegroundColor Yellow
        Get-CimInstance win32_logicaldisk -Filter "drivetype=3" -computer $hostname |
        Format-Table -Property DeviceID, Volumename, `
        @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
        @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
        @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }

        #Statement that the function is freeing up space
        Write-Host "Freeing up space. Enjoy your Coffee!" -BackgroundColor Black -ForegroundColor Green

        #Test if citrix ica client is installed and backup log file for re-inserting later
        if (Test-Path "C:\Program Files (x86)\Citrix\ICA Client") {
            Copy-Item "C:\Program Files (x86)\Citrix\ICA Client\wfcwin32.log" "C:\Program Files (x86)\Citrix\ICA Client\wfcwin32.bak"
        }
    }

    process {
        if ($server) {
            #Free up space on the local or remote server
            if ($null -ne $hostname) {
                $ErrorActionPreference = 'SilentlyContinue'

                $recycle = "\\$hostname\" + 'C$\$recycle.bin'
                Get-Service -ComputerName $hostname TrustedInstaller | Stop-Service -Force
                Get-ChildItem -Path "\\$hostname\C$\windows\logs" -Include '*.log', '*.cab'  -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path "\\$hostname\C$\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                #Get-ChildItem -Path "\\$hostname\C$\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                $tempfolders = @("\\$hostname\C$\Windows\Temp\*", "\\$hostname\C$\Windows\Prefetch\*", "\\$hostname\C$\Documents and Settings\*\Local Settings\temp\*", "\\$hostname\C$\Users\*\Appdata\Local\Temp\*")
                Remove-Item $tempfolders -Force -Recurse
                $tempinternetfolders = @("\\$hostname\C$\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "\\$hostname\C$\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "\\$hostname\C$\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
                Remove-Item $tempinternetfolders -Force -Recurse
                $Junkfolders = @("\\$hostname\C$\users\*\appdata\roaming\zoom\*", "\\$hostname\C$\users\*\AppData\Local\Google\*", "\\$hostname\C$\users\*\Downloads\*", "\\$hostname\C$\users\*\AppData\Roaming\Slack\Cache\*", "\\$hostname\C$\users\*\AppData\Local\GoToMeeting\*", "\\$hostname\C$\users\*\AppData\Roaming\RingCentralMeetings\*", "\\$hostname\C$\users\*\AppData\Local\Microsoft\Terminal Server Client\*")
                Remove-Item $Junkfolders -Force -Recurse
                Get-Service -ComputerName $hostname -Name TrustedInstaller | Start-Service

                $ErrorActionPreference = 'Continue'
            }

            else {
                $ErrorActionPreference = 'SilentlyContinue'

                Stop-Service TrustedInstaller -Force
                Get-ChildItem -Path "C:\windows\" -Include '*.log', '*.cab'  -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path "C:\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path 'c:\$recycle.bin' -Include '*' -Recurse -Force | Remove-Item -Force -Recurse
                #Get-ChildItem -Path "C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                $tempfolders = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
                Remove-Item $tempfolders -Force -Recurse
                $tempinternetfolders = @("C:\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "C:\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "C:\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
                Remove-Item $tempinternetfolders -Force -Recurse
                $Junkfolders = @("c:\users\*\appdata\roaming\zoom\*", "c:\users\*\AppData\Local\Google\*", "c:\users\*\Downloads\*", "c:\users\*\AppData\Roaming\Slack\Cache\*", "c:\users\*\AppData\Local\GoToMeeting\*", "c:\users\*\AppData\Roaming\RingCentralMeetings\*", "c:\users\*\AppData\Local\Microsoft\Terminal Server Client\*")
                Remove-Item $Junkfolders -Force -Recurse
                powercfg.exe /hibernate off
                Remove-Item c:\hiberfile.sys -Force -ErrorAction 'silentlycontinue'
                Start-Service TrustedInstaller

                $ErrorActionPreference = 'Continue'
            }
        }

        else {
            #Free up space on the local or remote computer
            if ($null -ne $hostname) {
                $ErrorActionPreference = 'SilentlyContinue'

                $recycle = "\\$hostname\" + 'C$\$recycle.bin'
                Get-ChildItem -Path $recycle -Include '*' -Recurse -Force | Remove-Item -Force -Recurse
                Get-Service -ComputerName $hostname TrustedInstaller | Stop-Service -Force
                Get-ChildItem -Path "\\$hostname\C$\windows\logs" -Include '*.log', '*.cab'  -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path "\\$hostname\C$\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path "\\$hostname\C$\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                $tempfolders = @("\\$hostname\C$\Windows\Temp\*", "\\$hostname\C$\Windows\Prefetch\*", "\\$hostname\C$\Documents and Settings\*\Local Settings\temp\*", "\\$hostname\C$\Users\*\Appdata\Local\Temp\*")
                Remove-Item $tempfolders -Force -Recurse
                $tempinternetfolders = @("\\$hostname\C$\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "\\$hostname\C$\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "\\$hostname\C$\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
                Remove-Item $tempinternetfolders -Force -Recurse
                $Junkfolders = @("\\$hostname\C$\users\*\Downloads\*", "\\$hostname\C$\users\*\AppData\Roaming\Slack\Cache\*", "\\$hostname\C$\users\*\AppData\Local\GoToMeeting\*", "\\$hostname\C$\users\*\AppData\Roaming\RingCentralMeetings\*")
                Remove-Item $Junkfolders -Force -Recurse
                Get-Service -ComputerName $hostname -Name TrustedInstaller | Start-Service

                $ErrorActionPreference = 'Continue'
            }

            else {
                $ErrorActionPreference = 'SilentlyContinue'

                Stop-Service TrustedInstaller -Force
                Get-ChildItem -Path "C:\windows\" -Include '*.log', '*.cab'  -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path "C:\ProgramData\Microsoft\Windows\WER" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path 'c:\$recycle.bin' -Include '*' -Recurse -Force | Remove-Item -Force -Recurse
                Get-ChildItem -Path "C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cache\" -Include '*.*' -Recurse -Force | Remove-Item -Force -Recurse
                $tempfolders = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
                Remove-Item $tempfolders -Force -Recurse
                $tempinternetfolders = @("C:\Users\*\Appdata\Local\Microsoft\Windows\INetCache\*", "C:\Users\*\Appdata\Local\Microsoft\Windows\Cookies\*", "C:\Users\*\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*")
                Remove-Item $tempinternetfolders -Force -Recurse
                $Junkfolders = @("c:\users\*\Downloads\*", "c:\users\*\AppData\Roaming\Slack\Cache\*", "c:\users\*\AppData\Local\GoToMeeting\*", "c:\users\*\AppData\Roaming\RingCentralMeetings\*")
                Remove-Item $Junkfolders -Force -Recurse
                powercfg.exe /hibernate off
                Remove-Item c:\hiberfile.sys -Force -ErrorAction 'silentlycontinue'
                Start-Service TrustedInstaller

                $ErrorActionPreference = 'Continue'
            }
        }
    }

    end {
        #Test if citrix ica client is installed and add log file back that if missing breaks citrix ica.
        if (Test-Path "C:\Program Files (x86)\Citrix\ICA Client") {
            Rename-Item "C:\Program Files (x86)\Citrix\ICA Client\wfcwin32.log.bak" "C:\Program Files (x86)\Citrix\ICA Client\wfcwin32.log"
        }

        #Display free Space after process block
        Write-Host " "
        Write-Host "Free Space After Cleaning" -ForegroundColor Yellow
        Get-CimInstance win32_logicaldisk -Filter "drivetype=3" -computer $hostname |
        Format-Table -Property DeviceID, Volumename, `
        @{Name = "SizeGB"; Expression = { [math]::Round($_.Size / 1GB) } }, `
        @{Name = "FreeGB"; Expression = { [math]::Round($_.Freespace / 1GB, 2) } }, `
        @{Name = "PercentFree"; Expression = { [math]::Round(($_.Freespace / $_.size) * 100, 2) } }
    }

}