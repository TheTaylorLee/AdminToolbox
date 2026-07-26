<#
    .DESCRIPTION
    This functions purpose is to make an office365 group visible in the Outlook Client. It's shorthand for an already existing command. If no parameters are specified then a Gridview is presented to select the group to make visible.

    This Function was initially created to resolve an issue where task comments dissapear for tasks in Teams. This may or may not resolve the issue. This function applies when the team does not show nested under the groups folder in outlook. If the team is not visible in outlook, then the comments will dissapear in teams. Run this function to resolve the task comments not being visible in teams, and restart outlook after awhile. If the issue continues then further troubleshooting is required.

    .EXAMPLE
    Set-365GroupVisibility

    Running the function without specifying the identity will deliver a grid view to select the group from, and populate the parameter that way.

    .EXAMPLE
    Set-365GroupVisibility -identity groupname@companyname.com

    Specifying the identity parameter will run the function without delivering a Grid View for selecting the identity. This is faster if you already know the team identity

    .NOTES
    Requires the ExchangeOnline module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Set-365GroupVisibility {

    [Cmdletbinding()]
    Param (
        [Parameter(Mandatory = $false)]$identity
    )

    if ($null -eq $identity) {
        $ident = Get-Unifiedgroup | Out-GridView -PassThru -Title 'Select the group that this issue is being resolved for'
        set-unifiedgroup -Identity $ident.primarysmtpaddress -HiddenFromExchangeClientsEnabled:$false
    }
    else {
        set-unifiedgroup -Identity $identity -HiddenFromExchangeClientsEnabled:$false
    }
}