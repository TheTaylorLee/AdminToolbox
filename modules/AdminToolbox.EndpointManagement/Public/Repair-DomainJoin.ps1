Function Repair-DomainJoin {
    <#
    .DESCRIPTION
    Run this command to rebuild an endpoints domain trust

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    Test-ComputerSecureChannel -Repair -Credential (Get-Credential)
}