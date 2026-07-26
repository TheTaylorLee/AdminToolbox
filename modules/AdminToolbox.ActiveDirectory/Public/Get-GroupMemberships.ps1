<#
    .DESCRIPTION
	Get a list of Active Directory User Accounts and the groups they are a member of

	.PARAMETER Path
    Specifies the export directory and filename for the report

    .NOTES
    Requires Active Directory and ImportExcel Modules

    .Example
	Get-GroupMemberships -Path "$env:USERPROFILE\downloads\Group Memberships.xlsx"

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-GroupMemberships {

	[CmdletBinding()]

	Param (
		[Parameter(Mandatory = $false)]$Path = "$env:USERPROFILE\downloads\AD Group Membership.xlsx"
	)

	$ErrorActionPreference = 'silentlycontinue'

	$users = Get-ADUser -Filter 'enabled -eq $true' -Properties DisplayName, memberof
	$processthis = ForEach ($user in $users) {
		New-Object PSObject -Property @{
			UserName = $user.DisplayName
			Groups   = ($user.memberof | Get-ADGroup | Select-Object -ExpandProperty Name) -join ","
		}
	}
	$processthis | Select-Object UserName, Groups | Export-Excel -WorksheetName "Group Memberships" -Path $path

	$ErrorActionPreference = 'continue'
}