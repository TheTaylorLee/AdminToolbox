<#
    .DESCRIPTION
    Restart one or multiple services that share a part of a Service Displayname

    The purpose of this command is recover from issues with widely distributed services. Example would be an antivirus service or Remote Access Agents providing trouble.

    .Parameter DisplayNameLike
    Specify a full or partial name match for the service

    .Parameter FromLog
    Specifies to pickup failed service recoveries from a log file

    .EXAMPLE
    Invoke-ServiceRecovery -DisplayNameLike Kaseya

    Restart specified service on all domain endpoints

    .EXAMPLE
    Invoke-ServiceRecovery -DisplayNameLike Kaseya -FromLog .\servicerecovery_log_0911.txt

    Restart specified service on all remaining endpoints using the failed endpoints log.

    .NOTES
    Must be Run from a DC or have the ActiveDirectory Module imported

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-ServiceRecovery {

    Param (
        [Parameter(Mandatory = $true)]$DisplayNameLike,
        [Parameter(Mandatory = $false)]$FromLog
    )


    #Check For Admin Privleges
    Get-Elevation

    if ($host.version.major -gt '5') {
        Write-Host " "
        Write-Error "This function only works in powershell version 5.1 or less."
        break
    }

    #Resuming recovery from a Logfile
    if ($null -ne $FromLog) {
        #Restart Services
        Get-Content $FromLog |
        ForEach-Object {
            try {
                Write-Host "Restarting Services with DisplayNameLike $DisplayNameLike on: " -ForegroundColor Green -NoNewline
                Write-Host "$_" -ForegroundColor Cyan

                Get-Service -computername $_ | Where-Object { $_.displayname -like "*$DisplayNameLike*" } | Restart-Service -Force
            }
            catch {
                $trim0 = $_
                $trim1 = $trim0 -replace ("Cannot open Service Control Manager on computer '", "")
                $trimout = $trim1 -replace ("'. This operation might require other privileges.", "")
                $trimout | Out-File $env:USERPROFILE\desktop\ServiceRecovery_Log.txt -Append
            }
        }
    }

    else {
        #Restart Services
        foreach ($computer in Get-ADComputer -Filter { (Enabled -eq $true) } | Sort-Object name | Select-Object -ExpandProperty name) {
            try {
                Write-Host "Restarting Services with DisplayNameLike $DisplayNameLike on: " -ForegroundColor Green -NoNewline
                Write-Host "$computer" -ForegroundColor Cyan

                Get-Service -computername $computer | Where-Object { $_.displayname -like "*$DisplayNameLike*" } | Restart-Service -Force
            }
            catch {
                $trim0 = $_
                $trim1 = $trim0 -replace ("Cannot open Service Control Manager on computer '", "")
                $trimout = $trim1 -replace ("'. This operation might require other privileges.", "")
                $trimout | Out-File $env:USERPROFILE\desktop\ServiceRecovery_Log.txt -Append
            }
        }

    }

    #Rename LogFile to Avoid overwrites later
    $Date = Get-Date -Format hhmm
    Rename-Item $env:USERPROFILE\desktop\ServiceRecovery_Log.txt $env:USERPROFILE\desktop\ServiceRecovery_Log_"$Date".txt
}