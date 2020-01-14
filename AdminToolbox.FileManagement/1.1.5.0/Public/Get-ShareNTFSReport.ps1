Function Get-ShareNTFSReport {
    <#
    .DESCRIPTION
	Get ntfs permissions for all shares on the local server

	.PARAMETER Path
    Specifies the export directory and filename for the report

    .NOTES
    Requires Active Directory and ImportExcel Modules

    .Example
	Get-ShareNTFSReport -Path "$env:USERPROFILE\downloads\Group Memberships.xlsx"

	.Link
    Get-SharePermissionsReport
    Get-FileOwner
    Find-ComputerFiles
	#>

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $false)]$Path = "$env:USERPROFILE\downloads\Share NTFS Permissions.xlsx"
    )


    Get-SmbShare | Where-Object { $_.Path -notlike $null } | ForEach-Object { (Get-Acl -Path $_.Path).access |
        Select-Object IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags |
        Export-Excel -WorksheetName $_.Name -TableName $_.name -FreezeTopRow -Path $Path }
}