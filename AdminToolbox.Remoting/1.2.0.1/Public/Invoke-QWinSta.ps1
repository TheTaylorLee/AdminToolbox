function Invoke-QWinSta {
    <#
    .DESCRIPTION
    Wrapper function for qwinsta to get rdp sessions

    .Parameter Server
    specify the target server to run qwinsta against

    .EXAMPLE
    Find remote sessions

    Invoke-QWinSta -Server name.domain.tld

    .Link
    Invoke-RWinSta
    #>

    [CmdletBinding()]
    [Alias('qwin')]
    Param (
        [Parameter(Mandatory = $true)]$Server
    )

    qwinsta.exe /server:$Server
}