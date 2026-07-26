<#
    .Description
    This function produces a CSV listing file owners within a given path

    .Parameter Path
    Path where files are to be Audited

    .Parameter Report
    Output path and filename for the report

    .Example
    Get-FileOwner -Path c:\users -Report c:\FileOwners.csv

    Specify the parent folder from which all subfolders are queried and where the report should be saved.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-FileOwner {

    [CmdletBinding(SupportsShouldProcess)]

    PARAM (
        [Parameter(Mandatory = $true)]$Path,
        [Parameter(Mandatory = $true)]$Report
    )

    #Check For Admin Privleges
    Get-Elevation

    $LastWrite = @{
        Name       = 'Last Write Time'
        Expression = { $_.LastWriteTime.ToString('u') }
    }
    $Owner = @{
        Name       = 'File Owner'
        Expression = { (Get-Acl $_.FullName).Owner }
    }
    $HostName = @{
        Name       = 'Host Name'
        Expression = { $env:COMPUTERNAME }
    }


    Get-ChildItem -Recurse -Path $Path |
    Select-Object $HostName, $Owner, Name, Directory, $LastWrite, Length |
    Export-Csv -NoTypeInformation $Report

}