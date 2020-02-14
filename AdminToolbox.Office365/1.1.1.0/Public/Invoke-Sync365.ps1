Function Invoke-Sync365 {
    <#
    .DESCRIPTION
    This function allows for initiating an Azure AD Sync with a short alias. Saves time having to login to the Azure AD Synced server or type out the Full Invoke-Command cmdlet each time.

    .PARAMETER AzureSyncServer
    Specifies the server that has Azure Active Directory Synchronization installed

    .PARAMETER Policy
    Specify a sync policy other than delta

    .Example
    Specify the Azure Sync Server for future use

    Invoke-Sync365 -AzureSyncServer server.domain.com

    .Example
    If the Azure Sync Server has been specified simply type the alias to initiate an azure sync

    Sync365

    .Example
    Specify a sync policy other than delta

    Sync365 -Policy Initial

    .Notes
    If attempting to run this on a server that doesn't have PSRemoting enabled and Azure AD Sync setup, then this function will fail.
    #>

    [Cmdletbinding()]
    [Alias('Sync365')]
    Param (
        [Parameter(Mandatory = $false)][String]$AzureSyncServer,
        [Parameter(Mandatory = $false)][validateset ("delta", "initial")][String]$Policy = 'delta'
    )

    if ($env:AzureSyncServer) {
        #Invoke Azure AD Sync
        Invoke-Command -ComputerName $env:AzureSyncServer -ScriptBlock { Start-ADSyncSyncCycle -PolicyType $policy }
    }

    else {
        Write-Warning "If you have not specified the Azure Sync Server to use, run this command again using the ""AzureSyncServer"" parameter first!"

        #Apply Environment variable to the current session
        $env:AzureSyncServer = $AzureSyncServer

        #Set Persistent Environment Variable
        [Environment]::SetEnvironmentVariable("AzureSyncServer", "$AzureSyncServer", "User")
    }
}