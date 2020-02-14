Function Repair-DomainJoin {
    <#
    .DESCRIPTION
    Run this command to rebuild an endpoints domain trust
    #>

    Test-ComputerSecureChannel -Repair -Credential (Get-Credential)
}