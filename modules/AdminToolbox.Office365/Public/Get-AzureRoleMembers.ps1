<#
    .DESCRIPTION
    This function will get AzureAD roles and their members. It outputs the content to Excel tables.

    .NOTES
    Requires the AzureAD module be imported

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-AzureRoleMembers {

    begin {
    }

    Process {
        #Check that the MSOnline and ImportExcel Module is loaded
        $Modulecheck = Get-Module msonline
        if ($Modulecheck) {
        }
        Else {
            try {
                Connect-AzureAD
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
        $roles = get-azureaddirectoryrole | Sort-Object displayname

        ForEach ($role in $roles) {
            get-azureaddirectoryrolemember -ObjectId $role.ObjectId |
            Select-Object DisplayName, EmailAddress, IsLicensed, LastDirSyncTime, RoleMemberType, ValidationStatus |
            Export-Excel -WorksheetName $role.displayname -Path "$env:USERPROFILE\downloads\AzureRoleMembers.xlsx" -FreezeTopRow -TableName $role.displayname -AutoSize -Append -ErrorAction 'SilentlyContinue'
        }
    }

    end {
        Write-Host " "
        Write-Host "The file has been exported to $env:USERPROFILE\downloads\AzureRoleMembers.xlsx" -ForegroundColor Green
        Start-Process $env:USERPROFILE\downloads\AzureRoleMembers.xlsx
    }
}