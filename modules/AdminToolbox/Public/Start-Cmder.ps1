<#
    .DESCRIPTION
    Launch a drop-down command console.

    .EXAMPLE
    Cmder

    Launch Cmder

    .Example
    Cmder -Startup

    Add Cmder to startup login startup

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Start-Cmder {

    [cmdletbinding()]
    [Alias ('cmder')]
    param (
        [Parameter (Mandatory = $false)][Switch]$Startup
    )

    if ($Startup) {
        $module = (Get-Module admintoolbox).ModuleBase
        $exe = "$module\support\cmder_mini\vendor\conemu-maximus5\ConEmu.exe"
        $icon = "$module\support\cmder_mini\vendor\conemu-maximus5\ConEmu.ico"

        # Create a Shortcut with Windows PowerShell
        $TargetFile = $exe
        $ShortcutFile = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\cmder.lnk"
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
        $Shortcut.TargetPath = $TargetFile
        $shortcut.IconLocation = $Icon
        $Shortcut.Save()
    }

    else {
        $module = (Get-Module admintoolbox).ModuleBase
        $cmder = "$module\support\cmder_mini\vendor\conemu-maximus5\ConEmu.exe"
        Start-Process $cmder
    }
}