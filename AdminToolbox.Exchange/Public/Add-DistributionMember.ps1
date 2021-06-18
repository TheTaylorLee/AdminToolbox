function Add-DistributionMember {

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
    Add a single mailbox to a single distribution group

    Add-DistributionMember -Mailbox JohnD@company.com -DistributionGroup "All Employees"

    .EXAMPLE
    Allows shortening the command or adding multiple mailboxes with a shared name to a Distribution Group

    Add-DistributionMember -Mailbox *@company.com -DistributionGroup "All Emp*"

    .EXAMPLE
    Add a single mailbox to multiple Distribution Groups.

    Add-DistributionMember -Mailbox JohnD@company.com -DistributionGroup "All Employees,Worker Bees"
    #>

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$Mailbox,
        [Parameter(Mandatory = $true)]$DistributionGroup
    )

    #Check For Admin Privleges
    Get-Elevation

    Get-Mailbox -identity $Mailbox | add-distributiongroupmember -identity $DistributionGroup
}