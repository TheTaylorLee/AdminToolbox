<#
    .DESCRIPTION
	Get a list of Active Directory groups and the Members of those groups

	.PARAMETER Path
    Specifies the export directory and filename for the report

    .PARAMETER Searchbase
    A distinguished name for an OU path.

    .NOTES
    Requires Active Directory and ImportExcel Modules

    .Example
    Get-GroupMembers -Path "$env:USERPROFILE\downloads\AD Group Members.xlsx" -searchbase "OU=Security Groups,DC=company,DC=net"

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-GroupMembers {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $false)]$Path = "$env:USERPROFILE\downloads\AD Group Members.xlsx",
        [Parameter(Mandatory = $false)]$Searchbase
    )

    $ErrorActionPreference = 'silentlycontinue'

    if ($searchbase) {
        Get-ADGroup -Filter * -searchbase $Searchbase | Sort-Object Name | ForEach-Object { Get-ADGroupMember -Identity $_.distinguishedName |
            Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
            Export-Excel -FreezeTopRow -WorksheetName $_.name -TableName $_.name -Path $Path
        }
    }
    else {
        Get-ADGroup -Filter * | Sort-Object Name | ForEach-Object { Get-ADGroupMember -Identity $_.distinguishedName |
            Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
            Export-Excel -FreezeTopRow -WorksheetName $_.name -TableName $_.name -Path $Path
        }
    }
    $ErrorActionPreference = 'continue'
}
