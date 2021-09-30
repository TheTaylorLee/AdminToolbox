<#
    .Description
    Use the speech synthesizer in powershell

    .Parameter Expression
    Type what you want the speech synthesizer to say

    .Example
    Speak -Ex "Want to play a Game?"

    .Example
    Speak "Want to play a Game?"

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Invoke-Speak {

    [CmdletBinding()]
    [Alias('speak')]
    param(
        [Parameter (Mandatory = $true, Position = 1)]
        [string]$Expression
    )

    if ($host.version.major -lt "6") {
        Add-Type -AssemblyName System.Speech
        $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $SpeechSynth.Speak("$expression")
    }
    else {
        Write-Warning "This command is not compatible in powershell core"
    }
}