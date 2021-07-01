function Reset-EndpointPassword {
    <#
    .Description
    This function rebuilds the trust relationship for a workstation or server to a Domain

    .PARAMETER Server
    Used to specify a domain controller in the domain

    .PARAMETER User
    Used to specify a domain admin account

    .Example
    Reaches out to a specified domain controller using a domain admin account to rebuild the trust relationship

    Reset-EndpintPassword CompanyDC01 Domain\Username

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 1)]$Server,
        [Parameter(Mandatory = $true, Position = 2)]$User
    )

    #Check for Admin Privleges
    Get-Elevation

    netdom.exe resetpwd /s:$Server /ud:$User /pd:*
}