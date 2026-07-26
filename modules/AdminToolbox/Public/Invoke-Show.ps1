<#
    .Description
    Gets functions for all AdminToolbox Modules and then allows selecting one for show-command

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-Show {

    [cmdletbinding()]
    [Alias ('show')]
    param (
    )

    $Command = Get-Command -Module AdminToolbo* | Out-GridView -PassThru
    Show-Command $command.Name
}