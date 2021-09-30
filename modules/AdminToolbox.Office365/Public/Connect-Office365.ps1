<#
    .DESCRIPTION
    Connect to all Office 365 Modules or just those chosen using the provided parameters

    .Parameter AcctName
    Required Office 365 Username for importing a skype online session

    .Parameter DomainHost
    Tenant specific part of the uri for the Sharepoint host

    .Parameter Az
    Connect to the Azure AD resource management module

    .Parameter AzureAD
    Connect to Azure AD tenant administrative Module. AKA AzureAD v2

    .Parameter ExchangeOnline
    Connect to the Exchange Online Module

    .Parameter ExchangeOnlinev2
    Connect to the Exchange Online Module

    .Parameter MSOnline
    Connect to the the original tenant based administrative module. AKA AzureAD v1

    .Parameter SharepointOnline
    Connect to the SharepointOnline Module

    .Parameter SecurityandCompliance
    Connect to the Security and Compliance Module

    .Parameter Skype
    Connect to the Skype Module

    .Parameter Teams
    Connect to the Teams Module

    .Example
    Connect-Office365 -acctName name@bigcompany.com -domainHost bigcompany -all

    Connects to all included office 365 modules for this function

    .Example
    Connect-Office365 -acctName name@bigcompany.com -skype

    Connects to skype and includes it mandatory parameters

    .Example
    Connect-Office365 -domainhost bigcompany -SharepointOnline

    Connects to Sharepoint and includes it mandatory parameters

    .Example
    Connect-Office365 -AzureAD

    Connects to a specific module using the available AzureAD parameter

    .Example
    Connect-Office365 -AzureAD -Teams

    Connects to multiple specified modules

    .Notes
    #Sharepoint Online Module \
    The SharePoint Online Management Shell is a Windows PowerShell module that you can use to manage SharePoint Online users, sites, and site collections. \
    Sharepoint Online Module https://www.microsoft.com/en-us/download/details.aspx?id=35588

    #Azure AD Module \
    Windows Azure AD tenant-based administrative tasks such as user management, domain management and for configuring single sign-on \
    Install-Module AzureAD

    #Microsoft Online (MSOnline) Module: aka Azure AD V1 Module \
    Original Azure AD module for user management and has legacy functions not include with the Azure AD Module \
       Install-Module MSOnline

    #Exchange Online Module \
    Exchange Online PowerShell allows you to manage your Exchange Online settings from the command line. \
    Install-Module Exchangeonline

    #Exchange Online Module v2 \
    Exchange Online PowerShell allows you to manage your Exchange Online settings from the command line. \
    Install-Module ExchangeOnlineManagement

    #Security and Compliance Module \
    Office 365 Security & Compliance Center PowerShell allows you to manage your Office 365 Security & Compliance Center settings from the command line. \
    Install-Module Exchangeonline

    #Skype For Business Module \
    Skype For Business Module allows managing Skype for Business settings from the Command Line. \
    Download and install Skype for Business Module https://www.microsoft.com/en-us/download/details.aspx?id=39366 \
    If bug still exists, Visual C++ 2017 x64 14.10.25008 is needed to work with this module.

    #Microsoft Teams Module \
    Microsoft Teams Module Module allows managing Microsoft Teams settings from the Command Line. \
    Install-module MicrosoftTeams

    #Azure AZ Module \
    Azure Az Module Module allows managing Azure settings, subscriptions, VM, Resource groups, and more from the Command Line. \
    Replaces AzureRM \
    Install-Module -Name Az

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Connect-Office365 {

    [CmdletBinding()]
    [Alias('Connect-365')]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "Skype")]
        [ValidateScript( { if ( $_ -notlike "*@*.*") { throw "Acctname must be a user principal name like name@company.com" } else { $true } })]
        $AcctName,
        [Parameter(Mandatory = $true, ParameterSetName = "Sharepoint")]
        $DomainHost,
        [Parameter(Mandatory = $true, ParameterSetName = "AzureAD")][Switch] $AzureAD,
        [Parameter(Mandatory = $true, ParameterSetName = "Sharepoint")][Switch] $SharepointOnline,
        [Parameter(Mandatory = $true, ParameterSetName = "ExchangeOnline")][Switch] $ExchangeOnline,
        [Parameter(Mandatory = $true, ParameterSetName = "ExchangeOnlinev2")][Switch] $ExchangeOnlinev2,
        [Parameter(Mandatory = $true, ParameterSetName = "SecurityandCompliance")][Switch] $SecurityandCompliance,
        [Parameter(Mandatory = $true, ParameterSetName = "Skype")][Switch] $Skype,
        [Parameter(Mandatory = $true, ParameterSetName = "Teams")][Switch] $Teams,
        [Parameter(Mandatory = $true, ParameterSetName = "Az")][Switch] $Az,
        [Parameter(Mandatory = $true, ParameterSetName = "MSOnline")][Switch] $MSOnline
    )

    if ($SharepointOnline) {
        #Sharepoint Online Module
        Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
        Write-Host "Connecting to SharePoint Online" -BackgroundColor black -ForegroundColor green
        Connect-SPOService -Url https://$DomainHost-admin.sharepoint.com
    }

    if ($AzureAD) {
        #Azure AD Module
        Write-Host "Connecting to other Azure AD Services" -BackgroundColor black -ForegroundColor green
        Connect-AzureAD
    }

    if ($MSOnline) {
        #MSonline AD Module
        Write-Host "Connecting to Microsoft Online Services" -BackgroundColor black -ForegroundColor green
        Connect-MsolService
    }

    if ($ExchangeOnline) {
        #Exchange Online Module
        Write-Host "Connecting to Exchange Online Services" -BackgroundColor black -ForegroundColor green
        Connect-EXOPSSession
    }

    if ($ExchangeOnlinev2) {
        #Exchange Online Module
        Write-Host "Connecting to Exchange Online Services Version 2" -BackgroundColor black -ForegroundColor green
        Connect-ExchangeOnline
    }

    if ($SecurityandCompliance) {
        #Security and Compliance Module
        Write-Host "Connecting to Exchange Online Protection and Security (aka Security and Compliance)" -BackgroundColor black -ForegroundColor green
        Connect-IPPSSession
    }

    if ($Skype) {
        #Skype For Business Module
        Import-Module SkypeOnlineConnector
        Write-Host "Connecting to Skype for Business Online" -BackgroundColor black -ForegroundColor green
        $sfboSession = New-CsOnlineSession -UserName $AcctName
        Import-PSSession $sfboSession
    }

    if ($Teams) {
        #Microsoft Teams Module
        Write-Host "Connecting to Microsoft Teams" -BackgroundColor black -ForegroundColor green
        Connect-MicrosoftTeams

        $SkypeRequired = Read-Host "Did you import the additionally required skype module? Yes or No"

        if ($SkypeRequired -eq 'No') {
            #Skype For Business Module
            Import-Module SkypeOnlineConnector
            Write-Host "Connecting to Skype for Business Online" -BackgroundColor black -ForegroundColor green
            $sfboSession = New-CsOnlineSession -UserName $AcctName
            Import-PSSession $sfboSession

        }
    }

    if ($Az) {
        #Azure Az Module
        Write-Host "Connecting to Azure Az Module" -BackgroundColor black -ForegroundColor green
        Connect-AzAccount
    }

    Write-Host "Going to import modules with verbose switch so all commands are available" -BackgroundColor black -ForegroundColor green
    Pause
    Get-Module | Import-Module -Verbose
    Clear-Host
}