<#
    .DESCRIPTION
    This function will create an Excel report of guest users accounts from Azure AD, and groups they are a member of.

    .PARAMETER StaleGuests
    Get a list of guest users older than the given days old

    .PARAMETER RecentlyCreatedGuests
    Get a list of guest users older no older than x days

    .Example
    Get-GuestUsers -StaleGuest 90

    Shows all guest users accounts older than 90 days old

    .Notes
    Requires the AzureAD and Import excel modules be imported and the AzureAD module connected

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-GuestUsers {

    Param
    (
        [Parameter(Mandatory = $false)][int]$StaleGuests,
        [Parameter(Mandatory = $false)][int]$RecentlyCreatedGuests
    )

    try {
        $Result = ""
        $PrintedGuests = 0
        $date = ((Get-Date -Format MM-dd-yyyy).ToString())

        #Output file declaration
        $Exportxlsx = "$env:USERPROFILE\downloads\GuestUserReport_$date.xlsx"
        Write-Host Exporting Guest User Report -ForegroundColor Green
        #Getting guest users
        Get-AzureADUser -All $true -Filter "UserType eq 'Guest'" | ForEach-Object {
            $DisplayName = $_.DisplayName
            $Upn = $_.UserPrincipalName
            $GetCreationTime = $_.ExtensionProperty
            $CreationTime = $GetCreationTime.createdDateTime
            $AccountAge = (New-TimeSpan -Start $CreationTime).Days

            #Check for stale guest users
            if (($StaleGuests -ne "") -and ([int]$AccountAge -lt $StaleGuests)) {
                return
            }

            #Check for recently created guest users
            if (($RecentlyCreatedGuests -ne "") -and ([int]$AccountAge -gt $RecentlyCreatedGuests)) {
                return
            }

            $ObjectId = $_.ObjectId
            $Mail = $_.Mail
            $Company = $_.CompanyName
            if ($null -eq $Company) {
                $Company = "-"
            }
            $CreationType = $_.CreationType
            $InvitationAccepted = $_.UserState

            #Getting guest user's group membership
            $Groups = (Get-AzureADUserMembership -ObjectId $ObjectId).DisplayName
            #$Groups
            $GroupMembership = ""
            foreach ($Group in $Groups) {
                #$Group
                if ($GroupMembership -ne "") {
                    $GroupMembership = $GroupMembership + ","
                }
                $GroupMembership = $GroupMembership + $Group
            }
            if ($GroupMembership -eq "") {
                $GroupMembership = "-"
            }


            #Export result to xlsx file
            $PrintedGuests++
            $Result = @{'UserPrincipalName' = $upn; 'DisplayName' = $DisplayName; 'EmailAddress' = $Mail; 'Company' = $Company; 'CreationTime' = $CreationTime; 'AccountAge(days)' = $AccountAge; 'InvitationAccepted' = $InvitationAccepted; 'CreationType' = $CreationType; 'GroupMembership' = $GroupMembership }
            $Output = New-Object PSObject -Property $Result
            $Output | Select-Object DisplayName, UserPrincipalName, Company, EmailAddress, CreationTime, AccountAge'(Days)', CreationType, InvitationAccepted, GroupMembership | Export-Excel -Path $Exportxlsx -FreezeTopRow -WorksheetName GuestUserReport -Append -TableName GuestUserReport
        }

        #Open output file after execution
        Invoke-Item "$Exportxlsx"
    }
    catch {
        Write-Warning "An Error Occurred because you are not connected to AzureAD. Connect to AzureAD and try again."
        Write-Host $_
        Import-Module AzureAD
        Connect-AzureAD
    }
}