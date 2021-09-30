<#
    .DESCRIPTION
    Connect to Exchange online Module and Exchange PSSnapin using a Single Console Host

    .PARAMETER FQDN
    Fully Qualified Domain name of the Exchange Servers powershell virtual directory

    .Example
    Invoke-EXOSharedSession -FQDN server.domain.com

    .Notes
    Requires the Exchange online module already installed

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Invoke-EXOSharedSession {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]$FQDN
    )

    #Import On-Premise Exchange Session
    $Credential = Get-Credential

    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$fqdn/PowerShell/ -Authentication Kerberos -Credential $Credential
    Import-PSSession $Session -DisableNameChecking -Prefix OP

    #Connect to Exchange Online
    $CreateEXOPSSession = (Get-ChildItem -Path $Env:LOCALAPPDATA\Apps\2.0* -Filter CreateExoPSSession.ps1 -Recurse -ErrorAction SilentlyContinue -Force | Select-Object -Last 1).DirectoryName
    Import-Module  "$CreateEXOPSSession\CreateExoPSSession.ps1" -Force
    Connect-EXOPSSession

    Write-Host "Use no Prefix when working with Exchange Online" -ForegroundColor Green
    Write-Host "Use the Prefix OP when working with On-Premise Exchange" -ForegroundColor Yellow
}