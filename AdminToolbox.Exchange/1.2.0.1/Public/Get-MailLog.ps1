function Get-MailLog {

    <#
    .DESCRIPTION
    Creates a csv file containing logs of mail in a given time frame.

    .Parameter Start
    Start date for the search

    .Parameter End
    End date for the search

    .Parameter ExportPath
    Path for the csv to be saved to

    .Parameter ResultSize
    Maximum number of results returned

    .NOTES
    Requires the Microsoft Exchange module.

    .EXAMPLE
    Specify the date range, report path, and amount of records to return.

    Get-MailLog -Start 05/14/2017 -End 05/14/2018 -ExportPath C:\MailLog.CSV -Resultsize 10000

    .Link
    Get-MessageTrackingLog
    #>

    [CmdletBinding(SupportsShouldProcess)]

    Param (
        [Parameter(Mandatory = $true)]$Start,
        [Parameter(Mandatory = $true)]$End,
        [Parameter(Mandatory = $true)]$ExportPath,
        [Parameter(Mandatory = $true)]$ResultSize
    )

    Get-MessageTrackingLog -Start "$Start" -End "$End" -ResultSize $ResultSize |
    Select-Object Timestamp, Sender, { $_.Recipients }, { $_.Recipientstatus }, EventID, Source, Directionality, MessageSubject, TotalBytes, SourceContext, ServerIP, ClientHostName, ConnectorID, MessageId, OriginalClientIP, { $_.EventData } |
    Export-Csv -path $ExportPath -NoTypeInformation
}