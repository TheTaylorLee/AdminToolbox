<#
    .Description
    This function leverages PSRemoting to import the AD module a active domain controller.
    It will then parse through existing profiles on the local machine to make sure they don't belong to disabled or missing Active Directory Accounts
    If a profile matches a missing or disable Active Directroy account it will be deleted on the local client.

    .Notes
    This function requires Powershell Remoting be enabled on the leveraged domain controller. If PSRemoting is disabled run the command <Enable-PSRemoting -force> on the domain controller

    .Parameter domaincontroller
    Specify a a domain controller that has Powershell remoting enabled

    .EXAMPLE
    Remove-DisabledADProfiles -domaincontroller DomainControllerDNSName

    Use Computername to specify the Domain Controller to be queried for active domain accounts

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-DisabledADProfiles {

    [CmdletBinding()]
    [Alias('rdad')]
    Param (
        [Parameter(Mandatory = $true)]$domaincontroller
    )

    #Check For Admin Privleges
    Get-Elevation

    try {
        $DCSession = New-PSSession -ComputerName $domaincontroller
        Invoke-Command -Command { Import-Module ActiveDirectory } -Session $DCSession
        Import-PSSession -Session $DCSession -Module ActiveDirectory -AllowClobber

        $profiles = Get-WmiObject -Class Win32_UserProfile
        foreach ($prof in $profiles) {
            $sid = $prof.sid
            $ADUser = Get-ADUser -Filter * | Where-Object sid -EQ $sid
            if ($ADUser.enabled -eq $false) {
                #delete profile
                "Delete $($ADUser.name)"
                $prof.delete()
            }


        }
    }
    catch {
        Write-Output $_.Exception.Message
    }

}