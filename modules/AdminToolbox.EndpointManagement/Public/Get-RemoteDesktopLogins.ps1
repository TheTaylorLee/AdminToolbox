<#
    .DESCRIPTION
    Get all remote desktop logon and logoff events and return results to a csv

    .PARAMETER OutputPath
    For specifying a save location where results will be saved and the name of the file

    .EXAMPLE
    Get-RemoteDesktopLogins -Outputpath c:\folder\filename.csv

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-RemoteDesktopLogins {

    [cmdletbinding()]

    param (
        [Parameter(Position = 0, Mandatory = $true)]$OutputPath
    )

    #Common Variables
    $LogName = 'Microsoft-Windows-TerminalServices-LocalSessionManager/Operational'
    $Results = @()
    $Events21 = Get-WinEvent -LogName $LogName | Where-Object { ($_.Id -like '21*') }
    $Events23 = Get-WinEvent -LogName $LogName | Where-Object { ($_.Id -like '23*') }
    $Events24 = Get-WinEvent -LogName $LogName | Where-Object { ($_.Id -like '24*') }
    $Events25 = Get-WinEvent -LogName $LogName | Where-Object { ($_.Id -like '25*') }

    #Foreach to retrieve event 21
    foreach ($Event in $Events21) {
        $EventXml = [xml]$Event.ToXML()

        $ResultHash = @{
            Time        = $Event.TimeCreated.ToString()
            'Event ID'  = $Event.Id
            'Desc'      = ($Event.Message -split "`n")[0]
            'Username'  = $EventXml.Event.UserData.EventXML.User
            'Source IP' = $EventXml.Event.UserData.EventXML.Address
            'Details'   = $Event.Message
            'Computer'  = $EventXML.Event.System.Computer
        }

        $Results += (New-Object PSObject -Property $ResultHash)

    } #End of Events loop

    #Output results to file
    $Results | Export-Csv $Outputpath -Append -NTI

    #Foreach to retrieve event 23
    foreach ($Event in $Events23) {
        $EventXml = [xml]$Event.ToXML()

        $ResultHash = @{
            Time        = $Event.TimeCreated.ToString()
            'Event ID'  = $Event.Id
            'Desc'      = ($Event.Message -split "`n")[0]
            'Username'  = $EventXml.Event.UserData.EventXML.User
            'Source IP' = $EventXml.Event.UserData.EventXML.Address
            'Details'   = $Event.Message
            'Computer'  = $EventXML.Event.System.Computer
        }

        $Results += (New-Object PSObject -Property $ResultHash)

    } #End of Events loop

    #Output results to file
    $Results | Export-Csv $Outputpath -Append -NTI

    foreach ($Event in $Events24) {
        $EventXml = [xml]$Event.ToXML()

        $ResultHash = @{
            Time        = $Event.TimeCreated.ToString()
            'Event ID'  = $Event.Id
            'Desc'      = ($Event.Message -split "`n")[0]
            'Username'  = $EventXml.Event.UserData.EventXML.User
            'Source IP' = $EventXml.Event.UserData.EventXML.Address
            'Details'   = $Event.Message
            'Computer'  = $EventXML.Event.System.Computer
        }

        $Results += (New-Object PSObject -Property $ResultHash)

    } #End of Events loop

    #Output results to file
    $Results | Export-Csv $Outputpath -Append -NTI

    foreach ($Event in $Events25) {
        $EventXml = [xml]$Event.ToXML()

        $ResultHash = @{
            Time        = $Event.TimeCreated.ToString()
            'Event ID'  = $Event.Id
            'Desc'      = ($Event.Message -split "`n")[0]
            'Username'  = $EventXml.Event.UserData.EventXML.User
            'Source IP' = $EventXml.Event.UserData.EventXML.Address
            'Details'   = $Event.Message
            'Computer'  = $EventXML.Event.System.Computer
        }

        $Results += (New-Object PSObject -Property $ResultHash)

    } #End of Events loop

    #Output results to file
    $Results | Export-Csv $Outputpath -Append -NTI
}