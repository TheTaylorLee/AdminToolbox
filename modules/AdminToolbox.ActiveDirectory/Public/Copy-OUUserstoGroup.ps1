<#
    .SYNOPSIS
    Adds enabled users from a specified Organizational Unit to a target group.

    .DESCRIPTION
    This function retrieves all enabled users from a specified Organizational Unit
    and adds them to a target Active Directory group.

    .PARAMETER OUDistinguishedName
    The distinguished name of the Organizational Unit containing the users.

    .PARAMETER TargetGroupDN
    The distinguished name of the target security group to add the users to.

    .EXAMPLE
    Copy-OUUserstoGroup -OUDistinguishedName "OU=Sales,DC=contoso,DC=com" -TargetGroupDN "CN=SalesGroup,OU=Groups,DC=contoso,DC=com"

    Adds all enabled users from the Sales OU to the SalesGroup.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Copy-OUUserstoGroup {

    param (
        [Parameter(Mandatory = $false)][string]$OUDistinguishedName,
        [Parameter(Mandatory = $false)][string]$TargetGroupDN
    )

    # If OUDistinguishedName is not provided, present a GridView for selection
    if (-not $OUDistinguishedName) {
        $selectedOU = Get-ADOrganizationalUnit -Filter * -Properties Name |
            Select-Object Name, DistinguishedName |
            Out-GridView -Title "Select an Organizational Unit" -PassThru
        if (-not $selectedOU) { Write-Warning "No OU selected. Aborting."; return }
        $OUDistinguishedName = $selectedOU.DistinguishedName
    }

    # If TargetGroupDN is not provided, present a GridView for selection
    if (-not $TargetGroupDN) {
        $selectedGroup = Get-ADGroup -Filter * -Properties Name |
            Select-Object Name, GroupScope, DistinguishedName |
            Out-GridView -Title "Select a Target Group" -PassThru
        if (-not $selectedGroup) { Write-Warning "No group selected. Aborting."; return }
        $TargetGroupDN = $selectedGroup.DistinguishedName
    }

    # Get enabled users from the specified OU
    $ouUsers = Get-ADUser -Filter { Enabled -eq $true } -SearchBase $OUDistinguishedName

    # Add each user to the target group
    foreach ($user in $ouUsers) {
        Add-ADGroupMember -Identity $TargetGroupDN -Members $user.DistinguishedName
    }
}