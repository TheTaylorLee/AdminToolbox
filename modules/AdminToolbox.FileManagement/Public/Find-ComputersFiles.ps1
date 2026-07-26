<#
    .DESCRIPTION
    Discover queried files meeting a specific search parameter and output the findings to a spreadsheet.

    .Parameter computers
    A list of computers that are being searched

    .Parameter csvout
    Path and filename for the CSV report

    .Parameter include
    Specify filename being searched for

    .Parameter Path
    Patch on the computers that are being search

    .EXAMPLE
    find-computersfiles -computers C:\computers.txt -csvout c:\results.csv -include *.pst

    Searches computers listed in the text file for pst files and outputs the findings to a spreadsheet.

    .EXAMPLE
    find-computersfiles -computers C:\computers.txt -csvout c:\results.csv -include *.pst -path "c$\users\*\appdata\local"

    Performs the same function as the first example, except it only searches the specified path and it's subfolders.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Find-ComputersFiles {

    [CmdletBinding(SupportsShouldProcess)]
    Param (
        #Variable containing computers being queried
        [Parameter(Position = 0, Mandatory = $true)][string[]]$computers,
        #Variable containing output path for csv file
        [Parameter(Position = 1, Mandatory = $true)]$csvout,
        #Variable specifying search parameter
        [Parameter(Position = 2, Mandatory = $true)]$include,
        #Variable specifying search parameter
        [Parameter(Position = 3)]$Path = "c$"
    )

    #Check For Admin Privleges
    Get-Elevation

    #Suppress Errors
    $ErrorActionPreference = 'SilentlyContinue'

    #Runs to find all files that match the query on all included computers and outputs the results to a CSV
    Get-Content $computers |
    ForEach-Object { Get-ChildItem "\\$_\$path" -Include $include -Recurse } |
    Select-Object Name, Directory, Length, LastAccessTime, LastWriteTime, CreationTime |
    Export-Csv $csvout -Append -NoTypeInformation

    #Restores default error action of show
    $ErrorActionPreference = 'Continue'
}