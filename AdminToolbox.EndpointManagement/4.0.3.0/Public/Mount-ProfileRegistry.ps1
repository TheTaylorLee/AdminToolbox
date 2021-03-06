function Mount-ProfileRegistry {
    <#
    .DESCRIPTION
    Loads any local users registry hive into the registry as a friendly name. Useful for modifying a users registry without the need of them being logged in locally.

    .PARAMETER SamAccountName
    SamAccountName of the domain account that you are mounting the local registry for.

    .PARAMETER DomainController
    Domain Controller that has Powershell Remoting enabled on it. For importing a session with the Active directory Module.

    .EXAMPLE
    If you have the AD module locally installed there is no need to specify the domain controller.

    Mount-ProfileRegistry -SamAccountName JohnS

    .EXAMPLE
    Specify the domain controller to implicitly import the active driectory module from a Domain Controller with Powershell Remoting.

    Mount-ProfileRegistry -SamAccountName JohnS -DomainController TexasDC2016

    .Link
    DisMount-ProfileRegistry
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]$SamAccountName,
        [Parameter(Mandatory = $false)]$DomainController
    )

    #import active directory module locally if possible
    Import-Module ActiveDirectory -ErrorAction 'silentlycontinue'

    #Check for loaded ActiveDirectoryModule
    $isloaded = Get-Module | Where-Object { $_.name -eq 'ActiveDirectory' }

    #Import Active Directory Module if needed
    if ($null -eq $isloaded) {
        $DCSession = New-PSSession -Computername $domaincontroller
        Invoke-Command -Command { Import-Module ActiveDirectory } -Session $DCSession
        Import-PSSession -Session $DCSession -Module ActiveDirectory -allowclobber
    }

    #Get Active Directory Sid
    $sid = Get-ADUser -filter { samaccountname -eq $SamAccountName }

    #Check that a use Sid was populated
    if ($null -eq $sid) {
        Write-Warning "Function aborted due to no sid available! Check that the SamAccountName is correct and/or that the Active Directory module was loaded."
    }

    else {
        #Get Profile Folder Path
        $ProfileList = 'Registry::HKey_Local_Machine\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
        $ProfileSelect = Get-ItemProperty -Path $profilelist | Where-Object { $_.pschildname -eq $sid.sid.value }
        $ProfileFolder = $profileselect.ProfileImagePath

        #Mount registry key for user
        reg.exe load HKU\$SamAccountName $ProfileFolder\ntuser.dat

        if ($null -ne $DCSession) {
            #Close PSSession
            Remove-PSSession $DCSession
        }

        Write-Warning "Make sure to run Dismount-ProfileRegistry when completed making changes!"
    }
}