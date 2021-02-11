Function Set-Subscription {
    <#
    .DESCRIPTION
    Presents a gridview of all subscriptions. On subscription from that view should be selected, for setting the subscription context where additional functions will be run from.

    .EXAMPLE
    This command has no parameters

    Set-Subscription

    .NOTES
    Requires the AZ module be installed, imported, and Connected.

    .LINK
    Get-AZContext
    #>

    [CmdletBinding()]
    Param (
    )

    $Subscription = Get-AzSubscription | Out-GridView -PassThru -Title 'Choose the subscription you want to work in'
    $Subscription | Set-AzContext
}