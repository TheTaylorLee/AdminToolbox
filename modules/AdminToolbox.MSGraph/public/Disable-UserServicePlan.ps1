<#
    .SYNOPSIS
    Disables a specific service plan for selected users in Microsoft 365.

    .DESCRIPTION
    The Disable-UserServicePlan function disables a specific service plan for selected users in Microsoft 365. It prompts the user to select a single service plan name to disable (ex: YAMMER_ENTERPRISE), then retrieves the SKUs containing the selected service plan, provides a list of users with those plans, and allows for selecting which users to remove the plan for. It then disables the service plan for each user who has the plan enabled and was selected to have the plan removed.

    .EXAMPLE
    Connect-Graph -Scopes User.ReadWrite.All, Organization.Read.All
    Disable-UserServicePlan

    This example disables a specific service plan for all users in Microsoft 365.

    .NOTES
    https://learn.microsoft.com/en-us/microsoft-365/enterprise/disable-access-to-services-with-microsoft-365-powershell?view=o365-worldwide

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Disable-UserServicePlan {

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'User.ReadWrite.All', 'Organization.Read.All' | Out-Null

    # List plannames and identify the plan name to disable
    $plantodisable = (Get-MgSubscribedSku | Select-Object ServicePlans).serviceplans.serviceplanname | Out-GridView -PassThru -Title "Select a single service plan name to disable. For example yammer."

    ## Get the skus containing the new service plans that are going to be disabled
    $Skus = Get-MgSubscribedSku | Select-Object SkuId, SkuPartNumber, ServicePlans | Where-Object { $_.ServicePlans.ServicePlanName -eq $plantodisable }

    # Disable the service plans
    foreach ($sku in $Skus) {
        # Get the service plan id of the service plan to be disabled
        $newDisabledPlans = $sku.ServicePlans |
            Where-Object ServicePlanName -EQ $plantodisable |
            Select-Object -ExpandProperty ServicePlanId

        # Get the users to make changes to
        $Users = Get-MgUser -all |
            Where-Object { $_.assignedPlans.servicePlanId -eq $newDisabledPlans -and $_.assignedPlans.capabilitystatus -eq "Enabled" } |
            Out-GridView -PassThru -Title "Select the users to disable the service plan for."

        foreach ($user in $users) {
            ## Get the services that have already been disabled for the user
            $upn = $user.userprincipalname
            $userLicense = Get-MgUserLicenseDetail -UserId $upn
            $userDisabledPlans = $userLicense.ServicePlans |
                Where-Object ProvisioningStatus -EQ "Disabled" |
                Select-Object -ExpandProperty ServicePlanId


            ## Merge the new plans that are to be disabled with the user's current state of disabled plans
            $disabledPlans = ($userDisabledPlans + $newDisabledPlans) | Select-Object -Unique

            $addLicenses = @(
                @{
                    SkuId         = $sku.SkuId
                    DisabledPlans = $disabledPlans
                }
            )
            ## Update user's license
            Set-MgUserLicense -UserId $upn -AddLicenses $addLicenses -RemoveLicenses @()
        }
    }
}