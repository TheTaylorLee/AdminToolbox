<#
    .DESCRIPTION
    Install one or Multiple Choclatey Packages

    .PARAMETER Install
    Specify applications to install

    .EXAMPLE
    Install-ChocoPackages -install firefox

    Install a single application

    .EXAMPLE
    Install-ChocoPackages -install firefox, chrome, nmap

    Install Multiple Applications.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Install-ChocoPackages {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]$Install
    )

    #Check for Admin Privleges
    Get-Elevation

    #Start Transcript
    $username = $env:UserName
    Start-Transcript "c:\users\$username\desktop\Choco Install.txt" -Append

    #Install Choco Packages
    Write-Host 'Installing Software with Chocolatey...' -ForegroundColor Green
    choco.exe install -y -r $Install

    #Stop Transcript
    Stop-Transcript
}
