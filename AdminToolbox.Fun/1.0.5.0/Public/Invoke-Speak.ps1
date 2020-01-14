Function Invoke-Speak {
    <#
.Description
Use the speech synthesizer in powershell

.Parameter Expression
Type what you want the speech synthesizer to say

.Example
Speak -Ex "Want to play a Game?"

.Example
Speak "Want to play a Game?"
#>
    [CmdletBinding()]
    [Alias('speak')]
    param(
        [Parameter (Mandatory = $true, Position = 1)]
        [string]$Expression
    )
    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak("$expression")
}