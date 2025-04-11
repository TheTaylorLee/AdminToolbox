function Get-SecOps {

    Get-IntroSecOps
    Write-Host "Investigation Functions"                                                                                     -ForegroundColor green
    Write-Host "Convert-Base64         ..Converts a base64 encoded string to plain text or vice versa and Write-Output"      -ForegroundColor cyan
    Write-Host "Get-HiddenServices     ..Retrieves and displays information about all hidden services on the system"         -ForegroundColor cyan
    Write-Host " "

    Write-Host "Bitlocker Functions"                                                                                         -ForegroundColor green
    Write-Host "Get-BitlockerRecovery  ..Gets detailed BitLocker recovery information for all volumes."                      -ForegroundColor cyan
    Write-Host "Invoke-BitlockerSetup  ..Invokes a process that enables bitlocker on all drives where possible."             -ForegroundColor cyan
    Write-Host " "
}