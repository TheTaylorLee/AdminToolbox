function Start-Iperf {
    <#
    .DESCRIPTION
    Setup and iperf server or client connection for testing connection speeds

    .PARAMETER server
    Specify if running in server mode

    .PARAMETER client
    Specify if running in client mode

    .PARAMETER udp
    Specify to use udp

    .PARAMETER serverip
    Specify the ip of the server connecting to when in client mode

    .PARAMETER port
    specify the port for the client and server connections

    .EXAMPLE
    Start-Iperf -server -port 10555

    Setup a iperf server connection

    .EXAMPLE
    Start-Iperf -client -serverip 0.0.0.0 -port 10555

    Initiate a client bandwidth test

    .EXAMPLE
    Start-Iperf -Client -serverip 0.0.0.0 --port 10555 udp

    Initiate a client bandwidth test

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    [CmdletBinding()]
    [Alias('iperf')]
    Param (

        [Parameter(Mandatory = $true, ParameterSetName = 'Server')][Switch]$server,
        [Parameter(Mandatory = $true, ParameterSetName = 'Client')][switch]$client,
        [Parameter(Mandatory = $false, ParameterSetName = 'Client')][Switch]$udp,
        [Parameter(Mandatory = $true, ParameterSetName = 'Client')]$serverip,
        [Parameter(Mandatory = $true, ParameterSetName = 'Client')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Server')]
        $port
    )

    $AdminConsole = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")

    if ($AdminConsole -like "False*") {
        Write-Warning "You need to run PowerShell as an admin to use this function!"
        Break
    }

    if ($server) {
        iperf3.exe -s -p $port
    }

    if ($client) {
        if ($udp) {
            iperf3.exe -c $serverip -p $port -u -b 0
        }

        else {
            iperf3.exe -c $serverip -p $port
        }
    }
}