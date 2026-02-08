<#
    .DESCRIPTION
    Returns the current date, time, or datetime in a specified format.

    .Parameter format
    Specifies the format of the output. Valid values are:
    - 'Date': Returns the date in 'yyyy-MM-dd' format.
    - 'Time': Returns the time in 'HHmmss' format.
    - 'Datetime': Returns the date and time in 'yyyy-MM-dd_HHmmss' format.
    - 'UTC': Returns the UTC date and time in 'yyyy-MM-dd_HHmmsUTC' format.

    .EXAMPLE
    Get-FormattedDate -format 'Date'

    .EXAMPLE
    Get-FormattedDate -format 'Time'

    .EXAMPLE
    Get-FormattedDate -format 'Datetime'

    .EXAMPLE
    Get-FormattedDate -format 'UTC'

    .EXAMPLE
    get-process | export-csv .\processes_$(fdate).csv -NoTypeInformation

    .Notes
    This function formats the current date and time based on the specified format.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-FormattedDate {

    [CmdletBinding()]
    [Alias('fdate')]

    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet('Date', 'Time', 'Datetime', 'UTC')]
        [string]$format
    )

    switch ($format) {
        'Date' { Get-Date -Format yyyy-MM-dd }
        'Time' { Get-Date -Format HHmmss }
        'Datetime' { Get-Date -Format yyyy-MM-dd_HHmmss }
        'UTC' { [DateTime]::UtcNow.ToString('u').replace('Z', 'UTC').replace(' ', '_').replace(':', '') }
        default { Get-Date -Format yyyy-MM-dd_HHmmss }
    }
}