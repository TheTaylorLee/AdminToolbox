function Invoke-Show {
    <#
.Description
Gets functions for all AdminToolbox Modules and then allows selecting one for show-command
#>

    [cmdletbinding()]
    [Alias ('show')]
    param (
    )

    $Command = Get-Command -module AdminToolbo* | Out-GridView -PassThru
    Show-Command $command.Name
}