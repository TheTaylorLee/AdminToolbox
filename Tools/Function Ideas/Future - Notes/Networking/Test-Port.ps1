#If invoke-scan stops to work the way it's currently built, these are functions that could come in handy.


function testport ($hostname = 'yahoo.com', $port = 80, $timeout = 100) {
  $requestCallback = $state = $null
  $client = New-Object System.Net.Sockets.TcpClient
  $beginConnect = $client.BeginConnect($hostname, $port, $requestCallback, $state)
  Start-Sleep -milli $timeOut
  if ($client.Connected) { $open = $true } else { $open = $false }
  $client.Close()
  [pscustomobject]@{hostname = $hostname; port = $port; open = $open }
}


Function Start-PortTest {

  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $True)]$computer
  )

  $Ports = 80, 443, 25, 3389, 1723, 47, 10443, 444

  foreach ($port in $ports) {
    $write = Test-NetConnection $computer -Port $Port -InformationLevel Quiet -ErrorAction SilentlyContinue -WarningAction SilentlyContinue;
    If ($write -eq 'true') {
      [pscustomobject]@{
        Computer  = $Computer
        Port      = $Port
        Available = 'True'
      }
    }
    else {
      [pscustomobject]@{
        Computer  = $Computer
        Port      = $Port
        Available = 'False'
      }
    }
  }
}

Function Get-TestPorts {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $True)]$hosts
  )

  $hosts | ForEach-Object -Parallel { Function Start-PortTest {

      [CmdletBinding()]
      param (
        [Parameter(Mandatory = $True)]$computer
      )

      $Ports = 80, 443, 25, 3389, 1723, 47, 10443, 444

      foreach ($port in $ports) {
        $write = Test-NetConnection $computer -Port $Port -InformationLevel Quiet -ErrorAction SilentlyContinue -WarningAction SilentlyContinue;
        If ($write -eq 'true') {
          [pscustomobject]@{
            Computer  = $Computer
            Port      = $Port
            Available = 'True'
          }
        }
        else {
          [pscustomobject]@{
            Computer  = $Computer
            Port      = $Port
            Available = 'False'
          }
        }
      }
    };
    Start-PortTest $_
  } -ThrottleLimit 12
}

$Results = Get-TestPorts '204.14.71.62', '23.31.232.41', '50.245.206.201', '23.31.232.17', '23.31.232.121'
$Results | Export-Excel -Path "$Down\AvailablePorts.xlsx" -Append