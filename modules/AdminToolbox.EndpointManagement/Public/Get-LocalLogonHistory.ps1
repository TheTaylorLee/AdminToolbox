<#
.DESCRIPTION
Get logon/logoff history from single PC's either locally or remotely.

.PARAMETER Username
Filters for a specific username

.PARAMETER StartTime
Only provide events after a given date/time

.PARAMETER Endtime
Only provide events before a given date/time

.PARAMETER IncludeLogOff
Filter to include Loggoff events

.PARAMETER ComputerName
Specify a remote computer for auditing

.EXAMPLE
Get-LocalLogonHistory -username john@domain.com -starttime 1/1/1900 -endtime 1/1/2024 -includelogoff -computername janespc

.NOTES
Copied this and then modified this function from https://github.com/junecastillote/Windows-Logon-History-Script/blob/main/LICENSE

Original License
MIT License

Copyright (c) 2023 June Castillote

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
#>

Function Get-LocalLogOnHistory {

    [CmdletBinding()]
    param (
        [Parameter()][String]$Username,
        [Parameter()][datetime]$StartTime,
        [Parameter()][datetime]$EndTime,
        [Parameter()][switch]$IncludeLogOff,
        [Parameter()][string]$ComputerName = $env:COMPUTERNAME
    )

    # Base filter
    $filter = @{
        LogName      = 'Security'
        ID           = @('4624')
        ProviderName = 'Microsoft-Windows-Security-Auditing'
    }

    # If IncludeLogOff is specified, add event 4634 to the filter
    if ($IncludeLogOff) {
        $filter['ID'] += '4634'
    }

    # If StartDate is specified
    if ($StartTime) {
        $filter.Add('StartTime', $StartTime)
    }

    # If EndDate is specified
    if ($EndTime) {
        $filter.Add('EndTime', $EndTime)
    }

    # Add username filter
    if ($Username) {
        ## If PowerShell Core
        if ($PSVersionTable.PSEdition -eq 'Core') {
            $filter.Add('TargetUserName', $Username)
        }
        ## If Windows PowerShell
        else {
            $filter.Add('Data', $Username)
        }
    }

    # https://learn.microsoft.com/en-us/windows/security/threat-protection/auditing/basic-audit-logon-events#configure-this-audit-setting
    $logOnTypeTable = @{
        '2'  = 'Interactive'
        '3'  = 'Network'
        '4'  = 'Batch'
        '5'  = 'Service'
        '6'  = 'Unlock'
        '7'  = 'NetworkCleartext'
        '8'  = 'NewCredentials'
        '9'  = 'RemoteInteractive'
        '10' = 'RemoteInteractive'
        '11' = 'CachedInteractive'
    }

    try {
        $events = Get-WinEvent -FilterHashtable $filter -ErrorAction Stop -ComputerName $ComputerName

        foreach ($event in $events) {
            [PSCustomObject]@{
                TimeStamp    = $event.TimeCreated
                EventType    = $(
                    if ($event.Id -eq '4624') {
                        'LogOn'
                    }
                    else {
                        'LogOff'
                    }
                )
                User         = $(
                    if ($Username) {
                        $Username
                    }
                    elseif ($event.Id -eq '4624') {
                        $event.Properties[5].Value
                    }
                    else {
                        $event.Properties[1].Value
                    }
                )
                SourceIP     = $(
                    if ($event.Id -eq '4624') {
                        $event.Properties[18].Value
                    }
                    else {
                        $null
                    }
                )
                ComputerName = $ComputerName
                LogOnType    = $logOnTypeTable["$($event.Properties[8].value)"]
            }
        }
    }
    catch {
        $_.Exception.Message | Out-Default
        return $null
    }
}