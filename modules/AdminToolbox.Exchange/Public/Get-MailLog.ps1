<#
    .DESCRIPTION
    Creates a csv file containing logs of mail in a given time frame.

    .Parameter Start
    Start date for the search

    .Parameter End
    End date for the search

    .Parameter ResultSize
    Maximum number of results returned

    .NOTES
    Requires the Microsoft Exchange module.

    .EXAMPLE
    Get-MailLog -Start (get-date).AddDays(-30) -End (get-date) -Resultsize 100000 | export-csv $home\downloads\maillog.csv

    Specify the date range, report path, and amount of records to return.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-MailLog {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$Start,
        [Parameter(Mandatory = $true)]$End,
        [Parameter(Mandatory = $true)]$ResultSize
    )

    Get-MessageTrackingLog -Start "$Start" -End "$End" -ResultSize $ResultSize |
        Select-Object Timestamp, Sender, { $_.Recipients }, { $_.Recipientstatus }, EventID, Source, Directionality, MessageSubject, TotalBytes, SourceContext, ServerIP, ClientHostName, ConnectorID, MessageId, OriginalClientIP, { $_.EventData }
}