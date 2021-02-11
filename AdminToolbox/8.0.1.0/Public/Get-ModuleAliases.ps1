Function Get-ModuleAliases {
    <#
    .Description
    Gets aliases for AdminToolbox Modules
    #>
    Get-Alias | Where-Object { $_.source -like 'admintool*' } | Select-Object Name, Definition
}