<#
    .DESCRIPTION
    Launch most applications using powershell and the name of the executable

    .Parameter Application
    Specify all or part of the name for an applications EXE or msc file

    .Parameter Index
    Used to build an index of application executables and msc files

    .Example
    Start-Application -Application outlook

    Launch and Application

    .Example
    app outlook

    Launch an application using the function alias and without specifying the application parameter

    .Example
    Start-Application -index

    Build the index used for launching applications. Can be run again to update the index when needed

    .Notes
    Uses the private function Get-Elevation

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Start-Application {

    [cmdletbinding(DefaultParameterSetName = 'Application')]
    [Alias ('app')]
    param (
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = 'Application')]
        [String]$Application,
        [Parameter (Mandatory = $true, ParameterSetName = 'Index')]
        [Switch]$Index
    )

    #Check that admin privleges are used
    Get-Elevation

    #Build an index of Executables for querying when launching applications
    if ($Index) {
        $ErrorActionPreference = 'silentlycontinue'
        $path = @(
            "C:\Program Files\"
            "C:\Program Files (x86)\"
            "C:\programdata\chocolatey"
            "C:\Windows\System32"
            "$env:USERPROFILE\appdata"
        )
        Get-ChildItem $path -Include *.exe, *.msc -Recurse | Where-Object { $_.FullName -notlike '*en-us*' } | Select-Object FullName, PSChildName | Export-Clixml $env:USERPROFILE\Documents\ApplicationIndex.xml
        $ErrorActionPreference = 'continue'

    }

    #Launch an application
    else {
        #Check that the index exists, Import it, and execute a specific function based off how many executables are returned
        if (Test-Path $env:USERPROFILE\Documents\ApplicationIndex.xml) {
            $IndexImport = Import-Clixml $env:USERPROFILE\Documents\ApplicationIndex.xml
            $Program = $IndexImport | Where-Object { ($_.PSChildName -like "*$Application*.exe") -or ($_.PSChildName -like "*$Application*.msc") }

            if ($Program.FullName.count -eq '0' ) {
                Write-Warning "Program Not Found! Try changing your application parameter or rebuild the index using the index parameter"
            }

            elseif ($Program.FullName.count -gt '1' ) {
                Write-Host " "
                Write-Warning "More than one application found! Next time try reducing the number of found applications to 1, by being more specific with the Application Name."
                Write-Host " "
                Write-Host "You can use the gridview to open the application you desire." -ForegroundColor Green

                $Selection = $Program.FullName | Out-GridView -PassThru -Title "Select Your desired Application to Open"
                Start-Process $Selection
            }

            else {
                Start-Process $Program.FullName
            }
        }

        #If the index doesn't exist, warn to build it.
        else {
            Write-Host
            Write-Warning "No index file found. First build the index using: Start-Application -index"
        }
    }
}