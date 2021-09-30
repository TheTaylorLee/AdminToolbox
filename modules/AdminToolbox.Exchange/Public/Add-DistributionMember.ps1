<#
    .DESCRIPTION
    Add a mailbox or mailboxes to a distribution group. Wildcards can be used to add the whole organization to a distribution group.

    .NOTES
    Requires the microsoft exchange module.

    .PARAMETER Mailbox
    Specifies the Mailbox or Mailboxes that are to be added to the Distribution Group

    .PARAMETER DistributionGroup
    The Distribution Group the Mailbox or Mailboxes are being added to

    .EXAMPLE
    Add-DistributionMember -Mailbox JohnD@company.com -DistributionGroup "All Employees"

    Add a single mailbox to a single distribution group

    .EXAMPLE
    Add-DistributionMember -Mailbox *@company.com -DistributionGroup "All Emp*"

    Allows shortening the command or adding multiple mailboxes with a shared name to a Distribution Group

    .EXAMPLE
    Add-DistributionMember -Mailbox JohnD@company.com -DistributionGroup "All Employees,Worker Bees"

    Add a single mailbox to multiple Distribution Groups.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Add-DistributionMember {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$Mailbox,
        [Parameter(Mandatory = $true)]$DistributionGroup
    )

    #Check For Admin Privleges
    Get-Elevation

    Get-Mailbox -identity $Mailbox | add-distributiongroupmember -identity $DistributionGroup
}