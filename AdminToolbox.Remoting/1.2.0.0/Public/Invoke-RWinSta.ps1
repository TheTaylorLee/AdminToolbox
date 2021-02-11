function Invoke-RWinSta {
    <#
    .DESCRIPTION
    Wrapper function for rwinsta to get rdp sessions

    .Parameter ID
    specify the target server to run qwinsta against

    .Parameter Server
    specify the target server to run qwinsta against

    .EXAMPLE
    Find remote sessions

    Invoke-RWinSta -ID 2 -Server name.domain.tld

    .Link
    Invoke-QWinSta
    #>

    [CmdletBinding()]
    Param (
        [Parameter(Position = 1, Mandatory = $true)]$ID,
        [Parameter(Position = 2, Mandatory = $true)]$Server
    )

    rwinsta.exe $ID /server:$Server
}