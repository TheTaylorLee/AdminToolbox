<#
    .DESCRIPTION
    Added a graphic uninstaller using Out-Gridview.

    This makes it easy to call the uninstall string for applications from an elevated command prompt.

    This removes the requirement to change accounts for uninstalling an application when otherwise it would of been faster to do so.

    .EXAMPLE
    Uninstall-Application

    Run the command, Select and application from the list, and click ok.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Uninstall-Application {

    [Cmdletbinding()]
    [alias("Remove-Application")]
    Param (
    )

    #Check For Admin Privleges
    Get-Elevation

    #Provide the application to be uninstalled
    Write-Host ""
    Write-Host "Find the Out-Gridview window and select an application to uninstall!" -ForegroundColor Yellow
    $out = Get-Applications | Out-GridView -PassThru -Title "Select an Application to Uninstall"

    #If the uninstaller uses msiexec, this will parse the string to be readable by the console.
    if ($out.uninstallstring -like "msiexec*") {
        $out1 = $out.uninstallstring -replace ('{', ' "{')
        $out2 = $out1 -replace ('}', '}"')
        $arguments = $out2 -replace ('msiexec.exe', '')
        Write-Host "Find the uninstall window if exists to finish the uninstall" -ForegroundColor green
        Write-Host ""
        Start-Process -FilePath msiexec.exe -ArgumentList $arguments
    }

    #If not an msiexec installer, this will add quatation marks to avoid issues caused by spaces in the path.
    else {
        $out1 = $out.uninstallstring + '"'
        $filepath = '"' + $out1
        Write-Host "Find the uninstall window if exists to finish the uninstall" -ForegroundColor green
        Write-Host ""
        Start-Process -FilePath $filepath
    }
}
