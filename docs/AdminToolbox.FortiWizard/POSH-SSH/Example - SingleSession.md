* *__Work with a single sessions__*
```Powershell
New-SSHSession
$command = Enable-Management -AdminUsername test -WANInterfaceName wan
$result = Invoke-SSHCommand -Command $command -SessionId 0
$result.output
```
