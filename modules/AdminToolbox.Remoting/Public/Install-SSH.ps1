<#
    .DESCRIPTION
    Use this function on a local or remote endpoint to enable openssh.

    Use PSRemoting to run the command on a remote endpoint.

    .Parameter InstallFromScript
    Specifies to install from a script

    .Parameter InstallAsFeature
    Specifies to install as a feature

    .Parameter Autoservices
    Sets ssh services automatic

    .Parameter StartServices
    Started the ssh services

    .EXAMPLE
    Install-OpenSSH

    Enable-OpenSSH features but don't set the services to Automatic

    .EXAMPLE
    Install-OpenSSH -AutoServices

    Enable-OpenSSH features and set the services to Automatic

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Install-SSH {

    [CmdletBinding(SupportsShouldProcess)]
    [Alias ('Install-OpenSSH')]

    Param (
        [Parameter(Mandatory = $true, ParameterSetName = 'InstallFromFile')]
        [switch]$InstallFromScript,
        [Parameter(Mandatory = $true, ParameterSetName = 'InstallAsFeature')]
        [switch]$InstallAsFeature,
        [Parameter(Mandatory = $false, ParameterSetName = 'InstallAsFeature')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InstallFromFile')]
        [switch]$AutoServices,
        [Parameter(Mandatory = $false, ParameterSetName = 'InstallAsFeature')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InstallFromFile')]
        [Parameter(Mandatory = $false, ParameterSetName = 'StartServices')]
        [switch]$StartServices
    )

    #Check For Admin Privleges
    Get-Elevation

    if ($InstallAsFeature) {
        # Install the OpenSSH Client
        Add-WindowsCapability -Online -Name OpenSSH.Client*
        # Install the OpenSSH Server
        Add-WindowsCapability -Online -Name OpenSSH.Server*
    }

    if ($InstallFromScript) {
        #Install winssh from github
        Write-Host "Installing from Github" -ForegroundColor Green
        $url = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.0.0.0p1-Beta/OpenSSH-Win32.zip"
        $zipfile = "c:\winssh.zip"
        $outpath = "c:\Winssh"
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::TLS12
        Invoke-WebRequest -Uri $url -OutFile $zipfile -UseBasicParsing
        Invoke-Unzip $zipfile $outpath
        Remove-Item $zipfile -Force
        . $outpath\OpenSSH-Win32\install-sshd.ps1
    }

    if ($StartServices) {
        #Enable the openssh server services
        Start-Service sshd
        Start-Service SSH-Agent
    }

    if ($AutoServices) {
        #Set services to start Automatically
        Set-Service -Name sshd -StartupType 'Automatic'
        Set-Service -Name SSH-Agent -StartupType 'Automatic'
    }

    #Set default openssh shell to powershell
    $ErrorActionPreference = 'Silentlycontinue'
    New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
    $ErrorActionPreference = 'Continue'

}