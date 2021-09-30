<#
    .DESCRIPTION
    Get Multifactor Authentication Status for Microsoft Online users

    .NOTES
    Requires the Exchange Online module be installed, imported, and Connected.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-MFAStatus {

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

    #Get all accounts for filtering
    $MSOLUsers = Get-MsolUser -all | Where-Object { $_.IsLicensed -eq 'True' }

    #Process results into a PSCustom Object with relevant info
    ForEach ($User in $MSOLUsers) {

        #Get the UserPrinicipalname for precise object Filtering
        $UPN = $User.UserprincipalName

        #Filter Msol Users using their UPN object data
        $UserObject = get-msoluser -SearchString $UPN | Select-Object DisplayName, UserprincipalName, islicensed
        $UserObject2 = get-msoluser -SearchString $UPN | Select-Object -Expand StrongAuthenticationRequirements
        $UserObject3 = get-msoluser -SearchString $UPN | Select-Object -Expand StrongAuthenticationMethods | Where-Object { $_.IsDefault -eq "True" }

        <#Pull Administrator Statuses
        $ca = Get-MsolRole -RoleName "Company Administrator"
        $CompanyAdministrator = Get-MsolRoleMember -RoleObjectId  $ca.objectid | Where-Object { $_.EmailAddress -eq "$upn" }
        if ($null -ne $CompanyAdministrator) {
            $CaResult = $True
        }
        else {
            $CaResult = $False
        }

        $Ba = Get-MsolRole -RoleName "Company Administrator"
        $BillingAdministrator = Get-MsolRoleMember -RoleObjectId  $ba.objectid | Where-Object { $_.EmailAddress -eq "$upn" }
        if ($null -ne $BillingAdministrator) {
            $BiResult = $True
        }
        else {
            $BiResult = $False
        }#>


        #Output Custom Object Info
        [pscustomobject]@{
            DisplayName       = $UserObject.DisplayName
            UserprincipalName = $UserObject.UserprincipalName
            IsLicensed        = $UserObject.islicensed
            MFAState          = $UserObject2.State
            MFAMethodDefault  = $UserObject3.Methodtype
            #IsCompanyAdministrator = $CaResult
            #IsBillingAdministrator = $BiResult
        }
    }
}