<#
    .SYNOPSIS
    Enables or disables DNS broadcasting on the system.

    .DESCRIPTION
    This function modifies the MDNS and LLMNR settings in the Windows registry to enable or disable DNS broadcasting.

    .PARAMETER Action
    Specifies whether to enable or disable DNS broadcasting. Acceptable values are "Enable" or "Disable".

    .EXAMPLE
    Set-DNSBroadcasting -Action Enable
    Enables DNS broadcasting by removing the relevant registry keys.

    .EXAMPLE
    Set-DNSBroadcasting -Action Disable
    Disables DNS broadcasting by setting the relevant registry keys to 0.

    .NOTES
    Requires administrative privileges to modify the Windows registry.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-DNSBroadcasting {

    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )

    switch ($Action) {
        "Enable" {
            # To Enable
            ## MDNS
            Remove-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\" -Name EnableMDNS
            ## LLMNR
            Remove-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name EnableMulticast
        }
        "Disable" {
            # To Disable
            ## MDNS
            Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\" -Name EnableMDNS -Value 0 -Type DWord
            ## LLMNR
            Set-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows NT\DNSClient\" -Name EnableMulticast -Value 0 -Type DWord
        }
    }
}
