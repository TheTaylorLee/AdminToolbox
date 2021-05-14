function Get-EndpointReport {

    <#
    .DESCRIPTION
    Create a CSV report of Active Directory Endpoints

    .Parameter Path
    Output path and filename for the report file

    .NOTES
    Requires the Active Directory Module

    .Example
    Be sure to specify a filename and extension for the report.

    Get-EndpointReport -path C:\UserReport.csv

    .Link
    Get-UserReport
	Get-GroupMemberships
	Get-GroupMembers
    #>

    [CmdletBinding(SupportsShouldProcess)]

    Param (
        [Parameter(Mandatory = $true)]$Path
    )

    Import-Module ActiveDirectory

    Get-ADComputer -Filter { (Enabled -eq $true) } -properties * |
    Select-Object name, OperatingSystem, whenCreated, LastLogonDate |
    Export-Csv $Path -NoTypeInformation

}