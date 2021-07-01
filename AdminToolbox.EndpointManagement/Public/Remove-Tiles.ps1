function Remove-Tiles {
    <#
    .DESCRIPTION
    Removes all start menu tiles

    .EXAMPLE
    Remove-Tiles

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>
    [CmdletBinding()]
    param (
    )

    #Check for Admin Privleges
    Get-Elevation

    (New-Object -Com Shell.Application).
    NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').
    Items() |
    ForEach-Object { $_.Verbs() } |
    Where-Object { $_.Name -match 'Un.*pin from Start' } |
    ForEach-Object { $_.DoIt() }
}