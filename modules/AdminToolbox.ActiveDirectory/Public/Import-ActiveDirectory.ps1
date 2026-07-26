<#
    .DESCRIPTION
    This command is primarily for use in powershell core. It will attempt to import the active directory module into Powershell Core, but if that fails it will fallback to using powershell for the module import.

    .Example
    Import-AD

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Import-ActiveDirectory {

    [CmdletBinding()]
    [Alias('Import-AD')]
    Param (
    )

    try {
        Import-Module ActiveDirectory
        Write-Host "Import AD module into the current host was successful!" -ForegroundColor Green
    }
    catch {
        try {
            Import-Module ActiveDirectory -UseWindowsPowerShell
            Write-Host "Import AD module failed for the current host. Imported by powershell!" -ForegroundColor yellow
        }
        catch {
            Write-Host "Import AD module failed for both methods" -ForegroundColor Red
            $_.Exception.Message
        }
    }
}