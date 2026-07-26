<#
    .SYNOPSIS
    Disables various telemetry and privacy-invasive features in Windows.

    .DESCRIPTION
    This function disables features such as telemetry, online speech recognition, Bing search in the start menu, and more by modifying the Windows registry and uninstalling unnecessary components.

    .EXAMPLE
    Disable-WindowsTelemetry
    Executes all the steps to disable telemetry and related features.

    .NOTES
    Requires administrative privileges to modify the Windows registry and uninstall components. Looking at the changes this script makes is recommended over just running it.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

function Disable-WindowsTelemetry {

    # Disable recall
    reg add HKCU\Software\Policies\Microsoft\Windows\WindowsAI /v DisableAIDataAnalysis /t REG_DWORD /d 0 /f

    # Remove windows widget
    winget uninstall "windows web experience pack"

    # Disable Online Speech Recognition
    reg add HKCU\Software\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy /v HasAccepted /t REG_DWORD /d 0 /f

    # Disable Bing search in start menu
    reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Search /v BingSearchEnabled /t REG_DWORD /d 0 /f

    # Disable Recall Snapshots
    reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\WindowsAI /v DisableAIDataAnalysis /t REG_DWORD /d 1 /f

    # Disable inking and typing personalization
    reg add HKCU\Software\Microsoft\Input\TIPC /v Enabled /t REG_DWORD /d 0 /f
    reg add HKCU\Software\Microsoft\Personalization\Settings /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
    reg add HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore /v HarvestContacts /t REG_DWORD /d 0 /f

    # Disable Telemetry
    reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v Enabled /t REG_DWORD /d 0 /f

    # Disable Tailored Experiences
    reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f

    # Disable Diagnostic data viewer
    reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v DisableDiagnosticDataViewer /t REG_DWORD /d 0 /f

    # Disable Windows Feedback
    reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection /v DoNotShowFeedbackNotifications /t REG_DWORD /d 0 /f

    # Disable Let Windows improve Start and search results by tracking app launches
    reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Start_TrackProgs /t REG_DWORD /d 0 /f

    # Disable Activity History
    reg add HKCU\SOFTWARE\Policies\Microsoft\Windows\System /v PublishUserActivities /t REG_DWORD /d 0 /f
}
