function Start-AzureSync {

    <#
    .DESCRIPTION
    Starts a local Active Directory sync to Azure Active Directory.

    .NOTES
    Must be run from the Domain Controller that has Azure AD Connect.

    .PARAMETER Policy
    Specify a Delta or Initial sync

    .Example
    Performs a full sync with Azure Active Directory

    Start-AzureSync -Policy Initial

    .EXAMPLE
    Performs an incrmental sync with Azure Active Directroy

    Start-AzureSync -Policy Delta
    #>

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]
        [validateset ("delta", "initial")]
        $Policy
    )

    Import-Module ADSync

    Start-ADSyncSyncCycle -PolicyType $Policy
}