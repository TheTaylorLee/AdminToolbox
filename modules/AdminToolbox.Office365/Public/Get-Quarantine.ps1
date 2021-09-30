<#
    .DESCRIPTION
    This is an alternative to the function Get-QuarantineMessage. This function bypasses the 1000 item per page limit by creating an array of results for up to 1000 pages and 1 million results. That is the log limit applied by Microsoft. I recommend limiting results as much as possible for performance reasons. Use Get-QuarantineMessage to restrict results further.

    .EXAMPLE
    Get-Quarantine -pages 15

    Specify the number of pages with 1000 results to return

    .EXAMPLE
    Get-Quarantine

    Return the default of 1 page with up to 1000 results

    .EXAMPLE
    Get-Quarantine -pagesize 15

    Specify the pagesize to limit output to only x number of results

    .NOTES
    Requires the ExchangeOnline module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-Quarantine {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)][ValidateRange(1, 1000)][int]$pages = 1,
        [Parameter(Mandatory = $false)][ValidateRange(1, 1000)][int]$pagesize = 1000
    )

    #Takes results from all pages and loads them into an array for presenting more than 1 page of results at once
    $array = foreach ($number in 1..$pages) {
        Get-QuarantineMessage -page $number -Pagesize $pagesize | Select-Object *
    }
    $array
}