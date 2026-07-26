<#
    .DESCRIPTION
    Are you out of excuses. Let powershell help you

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-Excuse {

    [CmdletBinding(SupportsShouldProcess)]
    param (

    )

    if ($host.version.major -gt '5') {
        Write-Host " "
        Write-Error "This function only works in powershell version 5.1 or less."
        break
    }

    $ex = (Invoke-WebRequest http://pages.cs.wisc.edu/~ballard/bofh/excuses -OutVariable excuses).content.split([Environment]::NewLine)[(Get-Random $excuses.content.split([Environment]::NewLine).count)]

    Write-Host " "
    Write-Host "$ex" -ForegroundColor Green
    Write-Host " "

    Add-Type -AssemblyName System.Speech
    $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak("$ex")
}