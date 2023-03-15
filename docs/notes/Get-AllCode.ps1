$modules = Get-Module Admintoolbo*

foreach ($mod in $modules) {
    $base = (Get-Module $mod.name).ModuleBase
    Get-ChildItem $base -Include "*.ps1" -Recurse |
    ForEach-Object {
        Get-Content $_.FullName |
        Out-File $env:USERPROFILE\downloads\all.ps1 -Append
    }
}