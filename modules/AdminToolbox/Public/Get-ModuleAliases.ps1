Function Get-ModuleAliases {
    <#
    .Description
    Gets aliases for AdminToolbox Modules

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>
    Get-Alias | Where-Object { $_.source -like 'admintool*' } | Select-Object Name, Definition
}