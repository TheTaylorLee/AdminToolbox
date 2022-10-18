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
    Get-MailEnabledMembers -Path "$env:USERPROFILE\downloads\AD Mail Enabled Group Members.xlsx" -searchbase "OU=Security Groups,DC=company,DC=net"

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-MailEnabledMembers {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $false)]$Path = "$env:USERPROFILE\downloads\AD Group Members.xlsx",
        [Parameter(Mandatory = $false)]$Searchbase
    )

    $ErrorActionPreference = 'silentlycontinue'

    if ($searchbase) {
        Get-ADGroup -Filter * -searchbase $Searchbase -properties proxyaddresses, description, displayname |
        Select-Object name, distinguishedname, proxyaddresses, description |
        Sort-Object Name |
        Where-Object { $null -ne $_.proxyaddresses } |
        ForEach-Object {
            if ($null -ne $_.displayname) {
                Get-ADGroupMember -Identity $_.distinguishedName |
                Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
                Export-Excel -FreezeTopRow -WorksheetName $_.displayname -TableName $_.displayname -Path $Path -Title $_.description
            }
            else {
                Get-ADGroupMember -Identity $_.distinguishedName |
                Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
                Export-Excel -FreezeTopRow -WorksheetName $_.name -TableName $_.name -Path $Path -Title $_.description
            }
        }
    }
    else {
        Get-ADGroup -Filter * -properties proxyaddresses, description, displayname |
        Select-Object name, distinguishedname, proxyaddresses, description |
        Sort-Object Name |
        Where-Object { $null -ne $_.proxyaddresses } |
        ForEach-Object {
            if ($null -ne $_.displayname) {
                Get-ADGroupMember -Identity $_.distinguishedName |
                Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
                Export-Excel -FreezeTopRow -WorksheetName $_.displayname -TableName $_.displayname -Path $Path -Title $_.description
            }
            else {
                Get-ADGroupMember -Identity $_.distinguishedName |
                Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
                Export-Excel -FreezeTopRow -WorksheetName $_.name -TableName $_.name -Path $Path -Title $_.description
            }
        }
    }
    $ErrorActionPreference = 'continue'
}