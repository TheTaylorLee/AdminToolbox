function Get-Excuse {

    <#
    .DESCRIPTION
    Are you out of excuses. Let powershell help you
    #>

    [CmdletBinding(SupportsShouldProcess)]

    $ex = (Invoke-WebRequest http://pages.cs.wisc.edu/~ballard/bofh/excuses -OutVariable excuses).content.split([Environment]::NewLine)[(Get-Random $excuses.content.split([Environment]::NewLine).count)]

    Write-Host " "
    Write-Host "$ex" -Foregroundcolor Green
    Write-Host " "

    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak("$ex")
}