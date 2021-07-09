* *__Push a command to many sessions__*
```Powershell
$input = Enable-Management -AdminUsername test -WANInterfaceName wan
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Invoke-SSHCommand -Command $input -SessionId $session.sessionid
}
```