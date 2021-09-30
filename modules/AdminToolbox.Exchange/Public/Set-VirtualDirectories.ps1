<#
    .DESCRIPTION
    Configure Virtual Directories for Exchange

    .PARAMETER Servername
    Server that the directories are being set on

    .PARAMETER url
    Domail specific url being set for the virtual directories

    .Example
    Set-VirtualDirectories -Servername exch2016-01 -url mail.domain.com

    Specify the mail server directories are being set on and the url that matches the mail records.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-VirtualDirectories {

    [cmdletbinding()]
    param (
        [Parameter(Mandatory = $true)]$servername,
        [Parameter(Mandatory = $true)]$url
    )



    #Set Virtual Directories
    ###Set Activesync
    Get-ActiveSyncVirtualDirectory -server $servername | Set-ActiveSyncVirtualDirectory -Internalurl "https://$url/Microsoft-Server-ActiveSync" -externalurl "https://$url/Microsoft-Server-ActiveSync"

    ###Set Web Services
    Get-WebServicesVirtualDirectory -server $servername | Set-WebServicesVirtualDirectory -Internalurl "https://$url/ews/exchange.asmx" -externalurl "https://$url/ews/exchange.asmx"

    ###Set OWA
    Get-OwaVirtualDirectory -server $servername | Set-OwaVirtualDirectory -Internalurl "https://$url/owa" -externalurl "https://$url/owa"

    ###Set Autodiscover
    Set-ClientAccessServer -Identity $servername -AutoDiscoverServiceInternalUri "https://$url/Autodiscover/Autodiscover.xml"

    Get-AutodiscoverVirtualDirectory -server $servername | Set-AutodiscoverVirtualDirectory -Internalurl "https://$url/Autodiscover/Autodiscover.xml" -externalurl "https://$url/Autodiscover/Autodiscover.xml"

    ###Set Ecp
    Get-EcpVirtualDirectory -server $servername | Set-EcpVirtualDirectory -Internalurl "https://$url/ecp" -externalUrl $null

    ###Set OAB
    Get-OABvirtualDirectory -server $servername | Set-OABvirtualDirectory -Internalurl "https://$url/oab" -externalurl "https://$url/oab"

    #Set MApi Virtual Directories
    get-mapivirtualdirectory -server $servername | Set-MapiVirtualDirectory -InternalUrl "https://$url/mapi" -externalUrl "https://$url/mapi"
}