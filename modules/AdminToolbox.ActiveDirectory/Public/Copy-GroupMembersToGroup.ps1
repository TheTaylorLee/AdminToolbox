<#
    .SYNOPSIS
    Copies the enabled members of a source group to a target group.

    .DESCRIPTION
    This function copies the enabled members of a source group to a target group.
    The source group is specified by its distinguished name, and the target group
    is specified by its distinguished name.

    .PARAMETER sourceGroupDN
    The distinguished name of the source group.

    .PARAMETER targetGroupDN
    The distinguished name of the target group.

    .EXAMPLE
    Copy-GroupMembersToGroup -sourceGroupDN "CN=SourceGroup,OU=Groups,DC=contoso,DC=com" -targetGroupDN "CN=TargetGroup,OU=Groups,DC=contoso,DC=com"

    Copies the enabled members of the SourceGroup to the TargetGroup.

.Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Copy-GroupMembersToGroup {

    param (
        [Parameter(Mandatory = $true)][string]$sourceGroupDN,
        [Parameter(Mandatory = $true)][string]$targetGroupDN
    )

    # Get the members of the source group
    $sourceGroupMembers = Get-ADGroupMember -Identity $sourceGroupDN

    # Add each enabled member of the source group to the target group
    foreach ($member in $sourceGroupMembers) {
        if ((get-aduser $member.distinguishedName).enabled) {
            Add-ADGroupMember -Identity $targetGroupDN -Members $member.DistinguishedName
        }
    }
}