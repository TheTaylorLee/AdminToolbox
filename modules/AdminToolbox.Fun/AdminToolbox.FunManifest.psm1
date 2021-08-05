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
