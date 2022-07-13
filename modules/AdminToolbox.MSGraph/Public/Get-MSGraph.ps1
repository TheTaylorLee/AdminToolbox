function Get-MSGraph {

    Get-IntroMSGraph

    Write-Host "MSGraph Manage Functions"                                                              -ForegroundColor green
    Write-Host "Get-MGContext              ..Gets applied API permission scopes"                       -ForegroundColor cyan
    Write-Host "Register-msgScopes         ..Registers API permission scopes"                          -ForegroundColor cyan
    Write-Host "Show-AllMSGFunctions       ..Shows available MSGraph functions"                        -ForegroundColor cyan
    Write-Host " "

    Write-Host "Reports Functions"                                                                     -ForegroundColor green
    Write-Host "Get-msgMFAStatus           ..Gets User MFA status and devices"                         -ForegroundColor cyan
    Write-Host " "
}