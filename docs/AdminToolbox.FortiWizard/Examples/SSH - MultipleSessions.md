* *__Push a command to many sessions__*
```Powershell
$command = Enable-Management -AdminUsername test -WANInterfaceName wan
$sessions = Get-SSHSession
foreach ($session in $sessions) {
    Invoke-SSHCommand -Command $command -SessionId $session.sessionid
}
```
