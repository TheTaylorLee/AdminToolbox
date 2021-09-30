<#
    .Description
    Gets aliases for AdminToolbox Modules

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-ModuleAliases {
    Get-Alias | Where-Object { $_.source -like 'admintool*' } | Select-Object Name, Definition
}