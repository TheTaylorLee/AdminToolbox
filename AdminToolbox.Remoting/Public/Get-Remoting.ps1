function Get-Remoting {

    Get-IntroRem

    Write-Host "Remoting Functions"                                                                                    -ForegroundColor green
    Write-Host "Connect-SSH                ..Connects to SSH Server"                                                   -ForegroundColor cyan
    Write-Host "Get-TerminalSessions       ..Get Terminal Server User Sessions"                                        -ForegroundColor cyan
    Write-Host "Enable-PSRemoting          ..Enables PSRemoting on local endpoint"                                     -ForegroundColor cyan
    Write-Host "Enable-Remoting            ..Enables PSRemoting on remote endpoint"                                    -ForegroundColor cyan
    Write-Host "Install-SSH                ..Installs OpenSSH Features"                                                -ForegroundColor cyan
    Write-Host "Invoke-RunAsNetwork        ..Invokes Runas agains any program with provided network credentials"       -ForegroundColor cyan
    Write-Host "Invoke-RunAsSSMS           ..Invokes Runas against SSMS with provided network credentials"             -ForegroundColor cyan
    Write-Host "Invoke-ServiceRecovery     ..Invokes a Service Restart on all Endpoints"                               -ForegroundColor cyan
    Write-Host "Remove-TerminalSessions    ..Removes Terminal Server User Sessions"                                    -ForegroundColor cyan
    Write-Host " "
}