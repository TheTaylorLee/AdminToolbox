<#
    .DESCRIPTION
    Disconnect existing Exchange Server Sessions

    .EXAMPLE
    Disconnect-ExchangeServer -FQDN server.domain.com

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Disconnect-ExchangeServer {

    [CmdletBinding()]
    [Alias('Disconnect-Exchange')]
    param (
    )

    Get-PSSession |
    Where-Object { $_.ConfigurationName -eq 'Microsoft.Exchange' } |
    Remove-PSSession
}