Function Get-IntroVAT {
    Write-Host "
                ___ ___ ___ ___ ___ ___
               |   Y   |   Y   |   Y   .---.-.----.-----.
               |.  |   |.      |.  |   |  _  |   _|  -__|
               |.  |   |. \_/  |. / \  |___._|__| |_____|
               |:  1   |:  |   |:      |
                \:.. ./|::.|:. |::.|:. |
                 '---' '--- ---'--- ---'
                            _______       __                        __
                           |   _   .--.--|  |_.-----.--------.---.-|  |_.-----.
                           |.  1   |  |  |   _|  _  |        |  _  |   _|  -__|
                           |.  _   |_____|____|_____|__|__|__|___._|____|_____|
                           |:  |   |
                           |::.|:. |
                           '--- ---'
" -Foregroundcolor Green

    Write-Host "             --------------------------------------------------------------------"      -Foregroundcolor Green
    Write-Host "             > "                                                                        -Foregroundcolor Green   -NoNewline
    Write-Host "Use "                                                                                   -ForegroundColor Yellow  -NoNewline
    Write-Host "Connect-Viserver"                                                                       -ForegroundColor Cyan    -NoNewline
    Write-Host " to first access vcenter or a host           "                                          -ForegroundColor Yellow  -NoNewline
    Write-Host "<"                                                                                      -Foregroundcolor Green
    Write-Host "             > "                                                                        -Foregroundcolor Green   -NoNewline
    Write-Host "Vmware.Powercli"                                                                        -ForegroundColor Red     -NoNewline
    Write-Host " Module is required                               "                                     -ForegroundColor Yellow  -NoNewline
    Write-Host "<"                                                                                      -Foregroundcolor Green
    Write-Host "             --------------------------------------------------------------------"      -Foregroundcolor Green

    Write-Host " "
}