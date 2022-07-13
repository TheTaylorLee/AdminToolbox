<#
    .DESCRIPTION
    This function will provide a list of guest users accounts from Azure AD, and groups they are a member of.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-GuestUsers {

    [CmdletBinding()]
    Param
    (
    )

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'Directory.Read.All'

    get-mguser | Where-Object { $_.usertype -eq 'guest' }

    ########################################################
    # Replicate what is below this line to some extent anyways.
    # Replicate what is below this line to some extent anyways.
    # Replicate what is below this line to some extent anyways.
    # Replicate what is below this line to some extent anyways.
    ########################################################
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
    catch {}

}