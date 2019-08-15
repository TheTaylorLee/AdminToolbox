function Set-FFToolsVariables {
    <#
    .DESCRIPTION
    This function creates enviroment variables that persist after powershell closes. The created variables will be used across multiple FFTools Functions.
    
    Variables created are a source folder for media processed, and an output folder for processed media.

    .PARAMETER Source
    Source path of media to be processed

    .PARAMETER Target
    Target path for processed Media

    .Example
    Creates persistent enviroment variables. Be sure to include a closing backslash for the parameters.

    Set-FFToolsVariables -Source "c:\media\"" -Target "c:\media\out\"
    #>

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

    #Apply Enviroment variable to the current session so a console restart isn't required
    $env:FFToolsSource = $FFToolsSource
    $env:FFToolsTarget = $FFToolsTarget

    #Ser Persistent Enviroment Variables
    [Environment]::SetEnvironmentVariable("FFToolsSource", "$FFToolsSource", "User")
    [Environment]::SetEnvironmentVariable("FFToolsTarget", "$FFToolsTarget", "User")

    Write-Host " "
    Write-Host "Enviroment Variables are now set for Source and Target Paths!" -ForegroundColor Green
    Write-Host "When running funcitons that work with media files, those media files must be placed in the source folder that was specified using this function!" -ForegroundColor Yellow

}