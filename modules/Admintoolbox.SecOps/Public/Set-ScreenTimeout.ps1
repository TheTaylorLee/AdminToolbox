<#
    .SYNOPSIS
    Configures screen timeout settings for both power policy and local group policy.

    .DESCRIPTION
    This function sets the screen timeout for logged-in users and lock screen, updates power policy settings,
    and modifies local group policy to enforce the screen saver timeout.

    .PARAMETER Seconds
    The timeout duration in seconds.

    .EXAMPLE
    Set-ScreenTimeout -Seconds 300
    Configures the screen timeout to 300 seconds.

    .NOTES
    Requires administrative privileges to execute.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-ScreenTimeout {

    param (
        [Parameter(Mandatory = $true)]
        [int]$Seconds
    )

    # Power Policy
    ## Screen timeout logged in
    powercfg.exe /setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE $Seconds
    powercfg.exe /setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE $Seconds
    ## Screen timeout lock screen
    powercfg.exe /setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK $Seconds
    powercfg.exe /setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK $Seconds
    powercfg.exe /setactive SCHEME_CURRENT

    # Local Group Policy
    New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\' -Name 'InactivityTimeoutSecs' -Value $Seconds -PropertyType dword -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveActive" -Value "1" -PropertyType string -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaverIsSecure" -Value "1" -PropertyType string -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveTimeOut" -Value $Seconds -PropertyType string -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "SCRNSAVE.EXE" -Value "%windir%\system32\rundll32.exe user32.dll,LockWorkStation" -PropertyType string -Force

    # Apply Group Policy Updates
    gpupdate /force
}