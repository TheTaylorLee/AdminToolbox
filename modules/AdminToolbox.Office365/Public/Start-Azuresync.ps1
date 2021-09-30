<#
    .DESCRIPTION
    Starts a local Active Directory sync to Azure Active Directory.

    .NOTES
    Must be run from the Domain Controller that has Azure AD Connect.

    .PARAMETER Policy
    Specify a Delta or Initial sync

    .Example
    Start-AzureSync -Policy Initial

    Performs a full sync with Azure Active Directory

    .EXAMPLE
    Start-AzureSync -Policy Delta

    Performs an incrmental sync with Azure Active Directroy

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Start-AzureSync {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]
        [validateset ("delta", "initial")]
        $Policy
    )

    Import-Module ADSync

    Start-ADSyncSyncCycle -PolicyType $Policy
}