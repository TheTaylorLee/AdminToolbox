* *__Work with a single sessions__*
```Powershell
New-SSHSession
$input = Enable-Management -AdminUsername test -WANInterfaceName wan
$result = Invoke-SSHCommand -Command $input -SessionId 0
$result.output
```