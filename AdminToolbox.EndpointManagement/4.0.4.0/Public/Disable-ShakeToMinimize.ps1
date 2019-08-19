function Disable-ShakeToMinimize {

    <#
    .Description
    This function disables the annoying shake to minimize Windows feature
    #>

    [CmdletBinding()]
    param (
    )

    reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v "DisallowShaking" /t reg_dword /d 1

}