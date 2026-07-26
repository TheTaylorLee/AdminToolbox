<#
    .DESCRIPTION
    Wrapper function for qwinsta to get rdp sessions

    .Parameter Server
    specify the target server to run qwinsta against

    .EXAMPLE
    Invoke-QWinSta -Server name.domain.tld

    Find remote sessions

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-QWinSta {

    [CmdletBinding()]
    [Alias('qwin')]
    Param (
        [Parameter(Mandatory = $true)]$Server
    )

    qwinsta.exe /server:$Server
}