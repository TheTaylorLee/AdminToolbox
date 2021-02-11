function Start-Cmder {
    <#
    .DESCRIPTION
    Launch a drop-down command console.

    .EXAMPLE
    Launch Cmder

    Cmder

    .Example
    Add Cmder to startup login startup

    Cmder -Startup
    #>

    [cmdletbinding()]
    [Alias ('cmder')]
    param (
        [Parameter (Mandatory = $false)][Switch]$Startup
    )

    if ($Startup) {
        $module = (Get-Module admintoolbox).ModuleBase
        $cmder = "$module\support\cmder_mini\Cmder.exe"

        # Create a Shortcut with Windows PowerShell
        $TargetFile = $cmder
        $ShortcutFile = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\cmder.lnk"
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
        $Shortcut.TargetPath = $TargetFile
        $Shortcut.Save()
    }

    else {
        $module = (Get-Module admintoolbox).ModuleBase
        $cmder = "$module\support\cmder_mini\Cmder.exe"
        Start-Process $cmder
    }
}