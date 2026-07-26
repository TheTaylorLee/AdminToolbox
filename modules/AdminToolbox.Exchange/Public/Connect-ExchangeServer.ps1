<#
    .DESCRIPTION
    Import a Powershell session from a remote exchange server with the exchange commands available

    .PARAMETER FQDN
    Fully Qualified Domain name of the Exchange Servers powershell virtual directory

    .EXAMPLE
    Connect-ExchangeServer -FQDN server.domain.com

    .NOTES
    The powershell virtual directory must be defined on the exchange server, or this will fail

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Connect-ExchangeServer {

    [CmdletBinding()]
    [Alias('Connect-Exchange')]
    param (
        [Parameter(Mandatory = $true)]$FQDN
    )

    $Credential = Get-Credential

    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$fqdn/PowerShell/ -Authentication Kerberos -Credential $Credential
    Import-PSSession $Session -DisableNameChecking
}
