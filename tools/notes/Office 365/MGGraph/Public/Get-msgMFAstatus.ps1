### [Get-MFAStatus](https://docs.microsoft.com/en-us/powershell/module/microsoft.graph.reports/get-mgreportcredentialuserregistrationdetail?view=graph-powershell-beta)

function Get-msgMFAstatus {

    #Confirm pre-requisites are met.
    Test-MSGraphRequirements -scopes 'Reports.Read.All'

    #Output MFA Statuses
    Get-MgReportCredentialUserRegistrationDetail
}