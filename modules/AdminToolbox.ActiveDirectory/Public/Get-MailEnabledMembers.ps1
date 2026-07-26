<#
    .DESCRIPTION
	Get a list of Active Directory groups and the Members for mail enabled groups. This is intended to even provide membership for Azure mail enabled groups. Group writeback must be enabled and the feature for those groups to have the friendly names enabled.

    This functions will not return full results if you name your groups Group_* or don't enable friendly names for writeback groups. I have found the group_* writeback groups will have equivalent named writeback groups so they are excluded from the report.

    Each pages title is the "Group name -- description". Don't store passwords in your descriptions or this will disclose them. You should store confidential info in descrptions anyways it's not secure.

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
        Where-Object { $null -ne $_.proxyaddresses -and $_.name -notlike "Group_*" } |
        ForEach-Object {
            $name = $_.name
            $description = $_.description
            Get-ADGroupMember -Identity $_.distinguishedName |
            Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
            Export-Excel -FreezeTopRow -WorksheetName $_.name -TableName $_.name -Path $Path -Title "$name -- $description"
        }
    }
    else {
        Get-ADGroup -Filter * -properties proxyaddresses, description, displayname |
        Select-Object name, distinguishedname, proxyaddresses, description |
        Sort-Object Name |
        Where-Object { $null -ne $_.proxyaddresses -and $_.name -notlike "Group_*" } |
        ForEach-Object {
            $name = $_.name
            $description = $_.description
            Get-ADGroupMember -Identity $_.distinguishedName |
            Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
            Export-Excel -FreezeTopRow -WorksheetName $_.name -TableName $_.name -Path $Path -Title "$name -- $description"
        }
        $ErrorActionPreference = 'continue'
    }
}