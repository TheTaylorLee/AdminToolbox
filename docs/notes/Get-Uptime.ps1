function get-uptime {
    (Get-Date) - (gcim Win32_OperatingSystem -computer $client).LastBootUpTime
}