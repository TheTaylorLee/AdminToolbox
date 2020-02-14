Function Get-SharePermissionsReport {
    <#
    .DESCRIPTION
	Get share permissions for all shares on the local server

	.PARAMETER Path
    Specifies the export directory and filename for the report

    .NOTES
    Requires Active Directory and ImportExcel Modules

    .Example
	Get-ShareNTFSReport -Path "$env:USERPROFILE\downloads\Share Permissions.xlsx"

	.Link
    Get-ShareNTFSReport
    Get-FileOwner
    Find-ComputerFiles
	#>

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $false)]$Path = "$env:USERPROFILE\downloads\Share Permissions.xlsx"
    )

    Get-SmbShare | ForEach-Object { Get-SmbShareAccess $_.name |
        Select-Object Name, AccountName, AccessRight, AccessControlType |
        Export-Excel -WorksheetName $_.Name -TableName $_.name -FreezeTopRow -Path $Path }
}