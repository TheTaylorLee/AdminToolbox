<#
    .DESCRIPTION
    This function creates environment variables that persist after powershell closes. The created variables will be used across multiple FFTools Functions.

    Variables created are a source folder for media processed, and an output folder for processed media.

    .PARAMETER Source
    Source path of media to be processed

    .PARAMETER Target
    Target path for processed Media

    .Example
    Set-FFToolsVariables -Source "c:\media\"" -Target "c:\media\out\"

    Creates persistent environment variables. Be sure to include a closing backslash for the parameters.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-FFToolsVariables {

    [Cmdletbinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateScript( { if ( -not (Test-Path $_)) { throw "Path '$_' doesn't exist. Create the Directory First" } else { $true } })]
        [ValidateScript( { if ($_ -notmatch '.+?\\$') { throw "Path '$_' must end with a backslash" } else { $true } })]
        [String]$FFToolsSource,
        [Parameter(Mandatory = $true)]
        [ValidateScript( { if ( -not (Test-Path $_)) { throw "Path '$_' doesn't exist. Create the Directory First" } else { $true } })]
        [ValidateScript( { if ($_ -notmatch '.+?\\$') { throw "Path '$_' must end with a backslash" } else { $true } })]
        [String]$FFToolsTarget
    )

    #Apply Environment variable to the current session so a console restart isn't required
    $env:FFToolsSource = $FFToolsSource
    $env:FFToolsTarget = $FFToolsTarget

    #Set Persistent Environment Variables
    [Environment]::SetEnvironmentVariable("FFToolsSource", "$FFToolsSource", "User")
    [Environment]::SetEnvironmentVariable("FFToolsTarget", "$FFToolsTarget", "User")

    Write-Host " "
    Write-Host "Environment Variables are now set for Source and Target Paths!" -ForegroundColor Green
    Write-Host "When running functions that work with media files, those media files must be placed in the source folder that was specified using this function!" -ForegroundColor Yellow

}