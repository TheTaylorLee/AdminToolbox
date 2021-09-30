<#
    .DESCRIPTION
    Run this command to rebuild an endpoints domain trust

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Repair-DomainJoin {

    Test-ComputerSecureChannel -Repair -Credential (Get-Credential)
}