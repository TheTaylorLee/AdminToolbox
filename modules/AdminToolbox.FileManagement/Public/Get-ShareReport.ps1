<#
    .Description
    This function produces an excel report of shares for the endpoint it is run on. The report will have tabs for all of the shares. Each share tab outlines Share and NTFS permissions for the share. Additional tabs are created with Active Directroy groups and their members for cross referencing.

    .Parameter DomainController
    Required parameter for Group Membership information

    .Parameter Path
    Path where the report will be saved. Default parameter path is $env:USERPROFILE\downloads\Share Permissions.xlsx

    .Parameter smbShares
    For Specifying one or more shares that should be reported on. Default parameter is set to pull for all shares

    .Example
    Get-ShareReport -DomainController DCHostname

    Get a share report for all Shares

    .Example
    Get-ShareReport -DomainController DCHostname -smbShares Sharename

    Get a Share report for a single share

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-ShareReport {

    [CmdletBinding()]

    Param (
        [Parameter(Mandatory = $true)]$DomainController,
        [Parameter(Mandatory = $false)]$Path = "$env:USERPROFILE\downloads\Share Permissions.xlsx",
        [Parameter(Mandatory = $false)]$smbShares = (Get-SmbShare)
    )

    begin {
        #Checking for admin permissions
        Get-Elevation

        #Import PSSession with the Active Directory Module
        $DCSession = New-PSSession -ComputerName $domaincontroller
        Invoke-Command -Command { Import-Module ActiveDirectory } -Session $DCSession
        Import-PSSession -Session $DCSession -Module ActiveDirectory -AllowClobber

        #Open Explorer where the file will be written to
        Start-Process explorer.exe $env:USERPROFILE\downloads
    }

    process {


        #SMB Access
        ForEach ($SmbShare in $SmbShares) {
            $smb = $smbshare.name
            Get-SmbShareAccess $Smb |
            Select-Object Name, AccountName, AccessRight, AccessControlType |
            Export-Excel -WorksheetName $Smb -TableName "$Smb SMB Table" -FreezeTopRow -Path $Path -Title "$Smb SMB Access" -TitleSize 12 -TitleBold -AutoSize -WarningAction:SilentlyContinue
        }

        #NTFS Access
        ForEach ($SmbShare in $SmbShares | Where-Object { $_.Path -notlike $null }) {
            $smb = $smbshare.name
            (Get-Acl -Path $SmbShare.Path).access | Select-Object IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags |
            Export-Excel -WorksheetName $Smb -TableName "$Smb NTFS Table" -FreezeTopRow -Path $Path -Title "$Smb NTFS Access" -TitleSize 12 -TitleBold -AutoSize -StartColumn 6 -WarningAction:SilentlyContinue
        }

        #Groups Reporting
        $ADGroup = Get-ADGroup -Filter * | Sort-Object Name
        $ADDomain = (Get-ADDomain).name
        ForEach ($Group in $ADGroup) {
            $notnull = Get-ADGroupMember -Identity $Group.Name -ErrorAction silentlycontinue
            if ($null -ne $notnull) {
                $Groupname = $Group.Name
                Get-ADGroupMember -Identity $Group.Name -ErrorAction silentlycontinue |
                Select-Object objectClass, name, SamAccountName, @{name = "AccountStatus"; Expression = ( { $status = Get-ADUser $_.SamAccountName | Select-Object Enabled; $status.Enabled }) }, distinguishedName, objectGUID |
                Export-Excel -FreezeTopRow -WorksheetName "$ADDomain|$Groupname" -Path $Path -TableName "$ADDomain|$Groupname" -Title "$ADDomain|$Groupname" -TitleSize 12 -TitleBold -AutoSize -WarningAction:SilentlyContinue
            }
        }

        $ErrorActionPreference = 'silentlycontinue'
        $Localgroup = Get-LocalGroup | Sort-Object Name
        ForEach ($Group in $LocalGroup) {
            $notnull = Get-LocalGroupMember -Name $Group.Name
            if ($null -ne $notnull) {
                $Groupname = $Group.Name
                Get-LocalGroupMember -Name $Group.Name |
                Select-Object Name, ObjectClass, PrincipalSource |
                Export-Excel -FreezeTopRow -WorksheetName "Builtin|$Groupname" -Path $Path -TableName "Builtin|$Groupname" -Title "Builtin|$Groupname" -TitleSize 12 -TitleBold -AutoSize -WarningAction:SilentlyContinue
            }
        }
        $ErrorActionPreference = 'continue'
    }

    end {
    }
}