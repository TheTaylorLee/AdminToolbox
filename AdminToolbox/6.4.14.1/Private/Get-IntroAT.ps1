function get-introat {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet('yes', 'no')]
        $clear = "yes"
    )

    if ($clear -eq "no") {
    }

    if ($clear -eq "yes") {
        Clear-Host
    }

    Write-Host "
                    _______    __          __
                   |   _   .--|  .--------|__.-----.
                   |.  1   |  _  |        |  |     |
                   |.  _   |_____|__|__|__|__|__|__|
                   |:  |   |       _______             __ __
                   |::.|:. |      |       .-----.-----|  |  |--.-----.--.--.
                   '--- ---'      |.|   | |  _  |  _  |  |  _  |  _  |_   _|
                                  '-|.  |-|_____|_____|__|_____|_____|__.__|
                                    |:  |
                                    |::.|
                                    '---'
" -Foregroundcolor Green

    Write-Host "             --------------------------------------------------------------------"      -Foregroundcolor Green
    Write-Host "             > "                                                                        -Foregroundcolor Green   -NoNewline
    Write-Host "Use "                                                                                   -ForegroundColor Yellow  -NoNewline
    Write-Host "Get-Info "                                                                              -ForegroundColor Cyan    -NoNewline
    Write-Host "for help using this module                          "                                   -ForegroundColor Yellow  -NoNewline
    Write-Host "<"                                                                                      -Foregroundcolor Green
    Write-Host "             > "                                                                        -Foregroundcolor Green   -NoNewline
    Write-Host "This is a "                                                                             -ForegroundColor Yellow  -NoNewline
    Write-Host "Master Module "                                                                         -ForegroundColor Magenta -NoNewline
    Write-Host "for many Awesome modules!                "                                              -ForegroundColor Yellow  -NoNewline                   
    Write-Host "<"                                                                                      -Foregroundcolor Green
    Write-Host "             --------------------------------------------------------------------"      -Foregroundcolor Green

    Write-Host " "
}