function Disable-PasswordPeek {
<#
.DESCRIPTION
Disables Password peaking in windows password prompts. Especially useful if providing remote support and needing to type in admin credentials.
#>

    [CmdletBinding()]
    Param (
    )

    #Check for Admin Privleges
    Get-Elevation

    reg.exe ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CredUI" /v DisablePasswordReveal /t REG_DWORD /d 1 /f
}