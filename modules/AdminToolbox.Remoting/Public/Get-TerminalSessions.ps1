<#
    .DESCRIPTION
    Pulls a list of all users sessions in a Remote Desktop Server Farm

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-TerminalSessions {

    try {
        $BrokerFQDN = (Get-WmiObject win32_computersystem).DNSHostName + "." + (Get-WmiObject win32_computersystem).Domain
        $result = Get-RDUserSession -ConnectionBroker $brokerFQDN -ErrorAction Stop |
        Select-Object Collectionname, domainname, username, hostserver, unifiedsessionid, sessionstate
        $result
    }
    catch {
        $BrokerFQDN = Read-Host 'Specify the FQDN of the ConnectionBroker ex: Company-AZ-BKR01.domain.com'
        $result = Get-RDUserSession -ConnectionBroker $brokerFQDN -ErrorAction Stop |
        Select-Object Collectionname, domainname, username, hostserver, unifiedsessionid, sessionstate
        $result
    }
}