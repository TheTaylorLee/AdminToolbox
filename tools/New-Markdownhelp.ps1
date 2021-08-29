#First set environment variable. This will be the path where repository docs folder is located.
#Be sure not to include a backslash at the end.
$gitdocspath = "G:\Github\AdminToolbox\docs"

#Set variable for current session
$env:gitdocspath = $gitdocspath

#Set Persistent Environment Variables
[Environment]::SetEnvironmentVariable("gitdocspath" , "$gitdocspath", "User")

#Generate Help using Platyps Module
Import-Module platyPS

$Modules = Get-Module Admintool*

foreach ($ModuleName in $modules.name) {
    New-MarkdownHelp -Module $ModuleName -OutputFolder "$env:gitdocspath\$ModuleName" -Force
}