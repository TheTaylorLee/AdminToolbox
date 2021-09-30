<#
    .DESCRIPTION
    Sets a countdown to restart the Endpoint. The command uses a multiplier set to 1 hour.
    You can use decimals to return shorter than an hour restart times or get X hours and X minutes.

    .NOTES
    The parameter must be typed when entering the command and not after. If you typed the command and then entered the parameter when prompted the command will fail. \

    When using decimal values understand that the value is multiplying against the number of seconds in an hour. \
    So all multiplication needs to be done as a fraction of 1. Don't try thinking that it needs to be done against the value of 60 for seconds or hours. \
    View the Examples for clarification.

    .Parameter Hours
    Specify x hours until restart

    .EXAMPLE
    Restart-Endpoint -Hours 5

    Restarts the Endpoint in 5 Hours

    .EXAMPLE
    Restart-Endpoint -Hours 5.25

    Restarts the Endpoint in 5 hours and 15 minutes

    .EXAMPLE
    Restart-Endpoint -Hours 0.25

    Restarts the Endpoint in 15 minutes

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Restart-Endpoint {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)][int]$Hours
    )

    $Hoursmultiplied = $Hours * 3600

    shutdown.exe /r /t $Hoursmultiplied
}