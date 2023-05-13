function Get-MSGraph {

    Get-IntroMSGraph

    Write-Host "Microsoft native Graph Functions"                                                               -ForegroundColor green
    Write-Host "Find-MgGraphCommand                 ..Find MSGraph functions by name and api equivalent URI"    -ForegroundColor cyan
    Write-Host "Get-MGContext                       ..Gets applied API permission scopes"                       -ForegroundColor cyan
    Write-Host " "

    Write-Host "MSGraph Manage Functions"                                                                       -ForegroundColor green
    Write-Host "Register-msgScopes                  ..Registers API permission scopes"                          -ForegroundColor cyan
    Write-Host "Show-AllMSGFunctions                ..Shows available MSGraph functions"                        -ForegroundColor cyan
    Write-Host " "

    Write-Host "Security Functions"                                                                             -ForegroundColor green
    Write-Host "Get-msgAuthenticationRegistration   ..Gets registered MFA and SSPR for users"                   -ForegroundColor cyan
    Write-Host "Get-msgDirectoryRoleMembers         ..Gets Azure AD Role Members"                               -ForegroundColor cyan
    Write-Host "Get-msgGuestUsers                   ..Gets Azure guest users and their team memberships"        -ForegroundColor cyan
    Write-Host "Get-msgMFAStatus                    ..Gets User MFA status and devices"                         -ForegroundColor cyan
    Write-Host "Get-msgSignIns                      ..Gets and audit log of sign ins"                           -ForegroundColor cyan
    Write-Host " "
}