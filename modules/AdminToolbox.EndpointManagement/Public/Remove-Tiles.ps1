<#
    .DESCRIPTION
    Removes all start menu tiles in Windows 10. Not tested in Windows 11.

    .EXAMPLE
    Remove-Tiles

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-Tiles {

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