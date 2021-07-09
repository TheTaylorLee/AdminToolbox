function get-introfw {
    [CmdletBinding()]
    param (
    )

    Write-Host "
                      ______           __  _ _       ___                      __
                     / ____/___  _____/ /_(_) |     / (_)___  ____ __________/ /
                    / /_  / __ \/ ___/ __/ /| | /| / / /_  / / __ '/ ___/ __  /
                   / __/ / /_/ / /  / /_/ / | |/ |/ / / / /_/ /_/ / /  / /_/ /
                  /_/    \____/_/   \__/_/  |__/|__/_/ /___/\__,_/_/   \__,_/
" -ForegroundColor Green

    Write-Host "             -----------------------------------------------------------------------"   -ForegroundColor Green
    Write-Host "             > "                                                                        -ForegroundColor Green  -NoNewline
    Write-Host "Use Get-FortiWizard for a list of functions                         "                   -ForegroundColor Cyan   -NoNewline
    Write-Host "<"                                                                                      -ForegroundColor Green
    Write-Host "             > "                                                                        -ForegroundColor Green  -NoNewline
    Write-Host "FortiOS is a Linux OS. Case sensitivity needs to be considered!     "                   -ForegroundColor Yellow -NoNewline
    Write-Host "<"                                                                                      -ForegroundColor Green
    Write-Host "             > "                                                                        -ForegroundColor Green  -NoNewline
    Write-Host "Pro Tip: Source NAT (IP Pool) and Destination NAT (Virtual IP)"                         -ForegroundColor White  -NoNewline
    Write-Host "      <"                                                                                -ForegroundColor Green
    Write-Host "             -----------------------------------------------------------------------"   -ForegroundColor Green
    Write-Host " "
}