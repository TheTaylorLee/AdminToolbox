<#
    .DESCRIPTION
    This function will get office365 roles and their members. It outputs the content to Excel tables.

    .NOTES
    Requires the MSOnline module be imported

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-MSOLRoleMembers {

    begin {
    }

    Process {
        #Check that the MSOnline and ImportExcel Module is loaded
        $Modulecheck = Get-Module msonline
        if ($Modulecheck) {
        }
        Else {
            try {
                Connect-MsolService
            }
            catch {
                Write-Warning "You must first install and import the MSOnline Module"
            }
        }

        $Modulecheck2 = Get-Module ImportExcel
        if ($Modulecheck2) {
        }
        Else {
            try {
                Import-Module ImportExcel
            }
            catch {
                Write-Warning "You must first install and Import the module ImportExcel"
            }
        }

        #Get and Export roles members to an excel file
        $roles = Get-MsolRole | Sort-Object name

        ForEach ($role in $roles) {
            $memberlist = Get-MsolRoleMember -RoleObjectId $role.ObjectId |
            Select-Object DisplayName, EmailAddress, IsLicensed, LastDirSyncTime, RoleMemberType, ValidationStatus
            if ($null -ne $memberlist) {
                Get-MsolRoleMember -RoleObjectId $role.ObjectId |
                Select-Object DisplayName, EmailAddress, IsLicensed, LastDirSyncTime, RoleMemberType, ValidationStatus |
                Export-Excel -WorksheetName $role.name -Path "$env:USERPROFILE\downloads\MSOLRoleMembers.xlsx" -FreezeTopRow -TableName $role.name -AutoSize -Append -ErrorAction 'SilentlyContinue'
            }
        }
    }

    end {
        Write-Host " "
        Write-Host "The file has been exported to $env:USERPROFILE\downloads\MSOLRoleMembers.xlsx" -ForegroundColor Green
        Start-Process $env:USERPROFILE\downloads\MSOLRoleMembers.xlsx
    }
}