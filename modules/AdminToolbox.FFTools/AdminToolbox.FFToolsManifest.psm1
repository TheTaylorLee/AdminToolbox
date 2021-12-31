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

##Function to Add ffmpeg module files to PSModulePath
#Save the current value for PSModulePath in the $p variable.
$p = [Environment]::GetEnvironmentVariable("Path")
#Add the new path to the $p variable. Begin with a semi-colon separator.
$exepath = $PSScriptRoot + "\support\"
$p += ";$exepath"
#Add the paths in $p to the PSModulePath value.
[Environment]::SetEnvironmentVariable("Path", $p)

#Set function variable
$tipspath = $PSScriptRoot + "\support\ffmpeg tips.txt"