<#
    .DESCRIPTION
    This function will get a list of distribution groups and the members of those groups

    .NOTES
    Requires the connect-exchangeonline module and being connected to exchangeonline

    .EXAMPLE
    Get-DistributionGroupMembers | Export-Excel $env:USERPROFILE\downloads\DistributionMembers.xlsx

    This will export the results to an excel spreadsheet.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-DistributionGroupMembers {
    $groups = Get-DistributionGroup -resultsize unlimited
    foreach ($group in $groups) {
        $members = Get-DistributionGroupMember $group.name
        foreach ($member in $members) {
            [pscustomobject]@{
                Group             = $group.name
                GroupType         = $group.grouptype
                MemberName        = $member.name
                MemberType        = $member.recipienttype
                GroupEmailAddress = $group.PrimarySmtpAddress
            }
        }
    }
}