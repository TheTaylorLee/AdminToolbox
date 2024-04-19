function Get-Office365 {

    Get-Intro365

    Write-Host "Office 365 Functions"                                                                                 -ForegroundColor green
    Write-Host "Connect-Office365               ..Connects to Office 365 Modules"                                     -ForegroundColor cyan
    Write-Host "Invoke-EXOSharedSession         ..Invokes an environment to EXO and On-Prem modules same console"     -ForegroundColor cyan
    Write-Host " "

    Write-Host "ADSync Module Functions"                                                                              -ForegroundColor green
    Write-Host "Invoke-Sync365                  ..Invokes an Azure sync using a Non-Verbose alias remotely"           -ForegroundColor cyan
    Write-Host " "

    Write-Host "Az Module Functions"                                                                                  -ForegroundColor green
    Write-Host "Get-TenantDiagrams              ..Gets and generates dependency Diagrams"                             -ForegroundColor cyan
    Write-Host "Get-VMDetails                   ..Gets AzureVM details from multiple functions"                       -ForegroundColor cyan
    Write-Host "Invoke-PowerState               ..Invokes power state changes on VMs and can get their status"        -ForegroundColor cyan
    Write-Host "Set-Subscription                ..Sets the subscription/AZContext for subsequent functions"           -ForegroundColor cyan
    Write-Host " "

    Write-Host "ExchangeOnline Module Functions"                                                                      -ForegroundColor green
    Write-Host "Convert-MailboxToShared         ..Convert Disabled mailbox to a Shared Mailbox"                       -ForegroundColor cyan
    Write-Host "Enable-MailboxAccess            ..Enables full access to a mailbox without a license"                 -ForegroundColor cyan
    Write-Host "Get-DistributionGroupMembers    ..Gets Exchange Online Auth Policy"                                   -ForegroundColor cyan
    Write-Host "Get-Messagetrace                ..Gets an log of email messages"                                      -ForegroundColor cyan
    Write-Host "Get-Quarantine                  ..Gets quarantine messages beyond the 1000 limit Microsoft Sets"      -ForegroundColor cyan
    Write-Host "Set-365GroupVisibility          ..Sets a office365 group visible in the Outlook Client"               -ForegroundColor cyan
    Write-Host "Unblock-Quarantine              ..Unblock/release quarantine messages multiple at a time"             -ForegroundColor cyan
    Write-Host " "

    Write-Host "Teams Module Functions"                                                                               -ForegroundColor green
    Write-Host "Clear-TeamsCache                ..Clears Cache files for Microsoft Teams"                             -ForegroundColor cyan
    Write-Host " "

    Write-Host "Sharepoint pnp Module Functions"                                                                      -ForegroundColor green
    Write-Host "Get-VersionHistoryReport        ..Gets version history information for files in SharePoint Online"    -ForegroundColor cyan
    Write-Host "Remove-VersionHistoryOlderThan  ..Remove old and unneeded file versions that impact storage quotas"   -ForegroundColor cyan
    Write-Host "Set-SharepointVersionLimits     ..Sets versioning limits for SharePoint libraries"                    -ForegroundColor cyan
    Write-Host "Set-SiteOwner                   ..Sets the specified user as an owner for multiple SharePoint sites"  -ForegroundColor cyan
    Write-Host " "
}