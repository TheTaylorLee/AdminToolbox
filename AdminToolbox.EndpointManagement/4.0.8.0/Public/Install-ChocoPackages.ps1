function Install-ChocoPackages {
    <#
    .DESCRIPTION
    Install one or Multiple Choclatey Packages

    .PARAMETER Install
    Specify applications to install

    .EXAMPLE
    Install a single application

    Install-ChocoPackages -install firefox

    .EXAMPLE
    Install Multiple Applications.

    Install-ChocoPackages -install firefox, chrome, nmap

    .Link
    Get-ChocoInstalls
    Get-ChocoOutdated
    Install-Chocolatey
    Invoke-ChocoUpgrade
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]$Install
    )

    #Check for Admin Privleges
    Get-Elevation

    #Start Transcript
    $username = $env:UserName
    Start-Transcript "c:\users\$username\desktop\Choco Install.txt" -append

    #Install Choco Packages
    Write-Host 'Installing Software with Chocolatey...' -ForegroundColor Green
    choco.exe install -y -r $Install

    #Stop Transcript
    Stop-Transcript
}
