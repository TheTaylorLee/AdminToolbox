<#
    .DESCRIPTION
    Disables the local firewall

    .EXAMPLE
    Disable-Firewall

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Disable-Firewall {

    [CmdletBinding(SupportsShouldProcess)]
    param (
    )

    #Check for Admin Privleges
    Get-Elevation

    Write-Host "Disabling Firewall" -ForegroundColor Green
    Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False
}