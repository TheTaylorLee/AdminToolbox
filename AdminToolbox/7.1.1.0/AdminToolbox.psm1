##Import Functions
$FunctionPathPublic = $PSScriptRoot + "\Public\"
$FunctionPathPrivate = $PSScriptRoot + "\Private\"

try {
    $PublicFunctions = Get-ChildItem $FunctionPathPublic | ForEach-Object {
        [System.IO.File]::ReadAllText($_.FullName, [Text.Encoding]::UTF8) + [Environment]::NewLine
    }

    $PrivateFunctions = Get-ChildItem $FunctionPathPrivate | ForEach-Object {
        [System.IO.File]::ReadAllText($_.FullName, [Text.Encoding]::UTF8) + [Environment]::NewLine
    }

    . ([scriptblock]::Create($PublicFunctions))
    . ([scriptblock]::Create($PrivateFunctions))
}

catch {
    $FunctionListPublic = Get-ChildItem $FunctionPathPublic -Name
    $FunctionListPrivate = Get-ChildItem $FunctionPathPrivate -Name

    ForEach ($Function in $FunctionListPublic) {
        . ($FunctionPathPublic + $Function)
    }

    ForEach ($Function in $FunctionListPrivate) {
        . ($FunctionPathPrivate + $Function)
    }
}

##Import Support Files
#Save the current value for Path in the $p variable.
$p = [Environment]::GetEnvironmentVariable("Path")
#Add the new path to the $p variable. Begin with a semi-colon separator.
$FunctionPath = $PSScriptRoot + "\Support\"
$p += ";$FunctionPath"
#Add the paths in $p to the PSModulePath value.
[Environment]::SetEnvironmentVariable("Path", $p)

#Add Custom Aliases
Set-Alias -Name scm -Value Show-Command
Set-Alias -Name gmad -Value Get-ModuleAliases

#Present Module Introduction
get-introat -clear no