##Import Functions
$FunctionPathPublic = $PSScriptRoot + "\Public\"
$FunctionPathPrivate = $PSScriptRoot + "\Private\"
$FunctionListPublic = Get-ChildItem $FunctionPathPublic -Name
$FunctionListPrivate = Get-ChildItem $FunctionPathPrivate -Name

ForEach ($Function in $FunctionListPublic) {
    . ($FunctionPathPublic + $Function)
}

ForEach ($Function in $FunctionListPrivate) {
    . ($FunctionPathPrivate + $Function)
}

##Import Support Files
#Save the current value for Path in the $p variable.
$p = [Environment]::GetEnvironmentVariable("Path")
#Add the new path to the $p variable. Begin with a semi-colon separator.
$FunctionPath = $PSScriptRoot + "\Support\"
$p += ";$FunctionPath"
#Add the paths in $p to the PSModulePath value.
[Environment]::SetEnvironmentVariable("Path", $p)
