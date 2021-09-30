<#
    .Description
    This function can Enable/Disable UserAccountControl entirely or just the Prompt Behavior

    .PARAMETER Disable
    Disables UAC entirely

    .PARAMETER DisablePrompt
    Disables UAC prompting only but leaves UAC enabled

    .PARAMETER Enable
    Enables UAC

    .Example
    Set-UAC -DisablePrompt

    Disabled UAC Prompting for Admins, but keeps UAC enabled

    .Example
    Set-UAC -Disable

    Disabled UAC Entirely

    .Example
    Set-UAC -Enable

    Enable UAC Entirely

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-UAC {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Disable')][switch]$Disable,
        [Parameter(Mandatory = $true, ParameterSetName = 'DisablePrompt')][switch]$DisablePrompt,
        [Parameter(Mandatory = $true, ParameterSetName = 'Enable')][switch]$Enable
    )

    #Check for Admin Privleges
    Get-Elevation

    if ($Disable) {
        reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "ConsentPromptBehaviorAdmin" /t reg_dword /d 0
        reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "EnableLUA" /t reg_dword /d 0
    }

    if ($DisablePrompt) {
        reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "ConsentPromptBehaviorAdmin" /t reg_dword /d 0
    }

    if ($Enable) {
        reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "ConsentPromptBehaviorAdmin" /t reg_dword /d 2
        reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /f /v "EnableLUA" /t reg_dword /d 1
    }
}