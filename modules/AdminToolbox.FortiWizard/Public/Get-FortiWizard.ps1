function Get-FortiWizard {

    [CmdletBinding()]
    [Alias("FortiWizard")]
    param (
    )

    #Present Module Introduction
    get-introfw

    Write-Host "Other Functions..."                         -ForegroundColor green
    Write-Host "
Disable-SipALG            ..Disables SipALG and deletes SIP profile
Enable-Management         ..Enables Management of the Firewall from the Public Interface and sets trusted Hosts
Get-SSHSession            ..Gets a list of active SSH Sessions
Invoke-SSHCommand         ..Invokes an SSH Command
New-LocalInPolicy         ..Create a localin policy for restricting access to builting mangement features
New-SSHSession            ..Creates an SSH Session
    "                                                       -ForegroundColor cyan

    Write-Host "Policies and Objects..."                    -ForegroundColor green
    Write-Host "
New-AddressObject         ..Creates New Address Objects
New-AddressGroup          ..Creates New Address Groups
New-IPPoolFixedRange      ..Creates New Fixed Range IP Pool
New-IPPoolOverload        ..Creates New Overload IP Pool
New-ServiceObject         ..Creates New Service
New-ServiceGroup          ..Creates New Service Group
New-VIPHost               ..Creates New Virtual IP for Single Host
New-VIPRange              ..Creates New Virtual IP Range
    "                                                       -ForegroundColor cyan

    Write-Host "VPN Functions..."                           -ForegroundColor green
    Write-Host "
Enable-PushNotifications  ..Enables push notifications for the Fortitoken Mobile app
New-DialUPTunnelBehindNAT ..Creates a Dialup Tunnel for the static site
New-DialUPTunnelRemoteNAT ..Creates a Dialup tunnel for the Dynamic site
New-FormTunnel            ..Creates a tunnel from provided Example VPN Form of 1 of 4 VPN types
New-P2PTunnel             ..Creates a Typical IPSec Tunnel
New-P2PTunnelNAT          ..Creates a new IPSec tunnel with the local subnet NATTed
Write-SSLVPNConfig        ..Writes an initial setup script for enabling the Forticlient VPN Config
    "                                                       -ForegroundColor cyan
}