function Invoke-PublishModules {
    $ErrorActionPreference = 'Stop'

    #ActiveDirectory
    $ActiveDirectoryPSGallery = (Find-Module "AdminToolbox.ActiveDirectory" -Repository PSGallery).version
    $ActiveDirectoryGithub = Get-Content "$workingdirectory/modules/AdminToolbox.ActiveDirectory/ChangeLog.md" | Select-Object -Last 1
    if ([version]$ActiveDirectoryGithub -gt [version]$ActiveDirectoryPSGallery ) {
        New-Manifest -ActiveDirectory #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.ActiveDirectory" -NuGetApiKey $env:NUGET_KEY
        $ActiveDirectory = Write-Output "[+] AdminToolbox.ActiveDirectory published to PSGalley"
    }
    else {
        $ActiveDirectory = Write-Output "[-] AdminToolbox.ActiveDirectory not published"
    }

    #EndpointManagement
    $EndpointManagementPSGallery = (Find-Module "AdminToolbox.EndpointManagement" -Repository PSGallery).version
    $EndpointManagementGithub = Get-Content "$workingdirectory/modules/AdminToolbox.EndpointManagement/ChangeLog.md" | Select-Object -Last 1
    if ([version]$EndpointManagementGithub -gt [version]$EndpointManagementPSGallery ) {
        New-Manifest -EndpointManagement #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.EndpointManagement" -NuGetApiKey $env:NUGET_KEY
        $EndpointManagement = Write-Output "[+] AdminToolbox.EndpointManagement published to PSGalley"
    }
    else {
        $EndpointManagement = Write-Output "[-] AdminToolbox.EndpointManagement not published"
    }

    #Exchange
    $ExchangePSGallery = (Find-Module "AdminToolbox.Exchange" -Repository PSGallery).version
    $ExchangeGithub = Get-Content "$workingdirectory/modules/AdminToolbox.Exchange/ChangeLog.md" | Select-Object -Last 1
    if ([version]$ExchangeGithub -gt [version]$ExchangePSGallery ) {
        New-Manifest -Exchange #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Exchange" -NuGetApiKey $env:NUGET_KEY
        $Exchange = Write-Output "[+] AdminToolbox.Exchange published to PSGalley"
    }
    else {
        $Exchange = Write-Output "[-] AdminToolbox.Exchange not published"
    }

    #FFTools
    $FFToolsPSGallery = (Find-Module "AdminToolbox.FFTools" -Repository PSGallery).version
    $FFToolsGithub = Get-Content "$workingdirectory/modules/AdminToolbox.FFTools/ChangeLog.md" | Select-Object -Last 1
    if ([version]$FFToolsGithub -gt [version]$FFToolsPSGallery ) {
        New-Manifest -FFTools #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.FFTools" -NuGetApiKey $env:NUGET_KEY
        $FFTools = Write-Output "[+] AdminToolbox.FFTools published to PSGalley"
    }
    else {
        $FFTools = Write-Output "[-] AdminToolbox.FFTools not published"
    }

    #FileManagement
    $FileManagementPSGallery = (Find-Module "AdminToolbox.FileManagement" -Repository PSGallery).version
    $FileManagementGithub = Get-Content "$workingdirectory/modules/AdminToolbox.FileManagement/ChangeLog.md" | Select-Object -Last 1
    if ([version]$FileManagementGithub -gt [version]$FileManagementPSGallery ) {
        New-Manifest -FileManagement #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.FileManagement" -NuGetApiKey $env:NUGET_KEY
        $FileManagement = Write-Output "[+] AdminToolbox.FileManagement published to PSGalley"
    }
    else {
        $FileManagement = Write-Output "[-] AdminToolbox.FileManagement not published"
    }

    #Fun
    $FunPSGallery = (Find-Module "AdminToolbox.Fun" -Repository PSGallery).version
    $FunGithub = Get-Content "$workingdirectory/modules/AdminToolbox.Fun/ChangeLog.md" | Select-Object -Last 1
    if ([version]$FunGithub -gt [version]$FunPSGallery ) {
        New-Manifest -Fun #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Fun" -NuGetApiKey $env:NUGET_KEY
        $Fun = Write-Output "[+] AdminToolbox.Fun published to PSGalley"
    }
    else {
        $Fun = Write-Output "[-] AdminToolbox.Fun not published"
    }

    #Networking
    $NetworkingPSGallery = (Find-Module "AdminToolbox.Networking" -Repository PSGallery).version
    $NetworkingGithub = Get-Content "$workingdirectory/modules/AdminToolbox.Networking/ChangeLog.md" | Select-Object -Last 1
    if ([version]$NetworkingGithub -gt [version]$NetworkingPSGallery ) {
        New-Manifest -Networking #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Networking" -NuGetApiKey $env:NUGET_KEY
        $Networking = Write-Output "[+] AdminToolbox.Networking published to PSGalley"
    }
    else {
        $Networking = Write-Output "[-] AdminToolbox.Networking not published"
    }

    #Office365
    $Office365PSGallery = (Find-Module "AdminToolbox.Office365" -Repository PSGallery).version
    $Office365Github = Get-Content "$workingdirectory/modules/AdminToolbox.Office365/ChangeLog.md" | Select-Object -Last 1
    if ([version]$Office365Github -gt [version]$Office365PSGallery ) {
        New-Manifest -Office365 #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Office365" -NuGetApiKey $env:NUGET_KEY
        $Office365 = Write-Output "[+] AdminToolbox.Office365 published to PSGalley"
    }
    else {
        $Office365 = Write-Output "[-] AdminToolbox.Office365 not published"
    }

    #Remoting
    $RemotingPSGallery = (Find-Module "AdminToolbox.Remoting" -Repository PSGallery).version
    $RemotingGithub = Get-Content "$workingdirectory/modules/AdminToolbox.Remoting/ChangeLog.md" | Select-Object -Last 1
    if ([version]$RemotingGithub -gt [version]$RemotingPSGallery ) {
        New-Manifest -Remoting #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Remoting" -NuGetApiKey $env:NUGET_KEY
        $Remoting = Write-Output "[+] AdminToolbox.Remoting published to PSGalley"
    }
    else {
        $Remoting = Write-Output "[-] AdminToolbox.Remoting not published"
    }

    #VMWareAutomate
    $VMWareAutomatePSGallery = (Find-Module "AdminToolbox.VMWareAutomate" -Repository PSGallery).version
    $VMWareAutomateGithub = Get-Content "$workingdirectory/modules/AdminToolbox.VMWareAutomate/ChangeLog.md" | Select-Object -Last 1
    if ([version]$VMWareAutomateGithub -gt [version]$VMWareAutomatePSGallery ) {
        New-Manifest -VMWareAutomate #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.VMWareAutomate" -NuGetApiKey $env:NUGET_KEY
        $VMWareAutomate = Write-Output "[+] AdminToolbox.VMWareAutomate published to PSGalley"
    }
    else {
        $VMWareAutomate = Write-Output "[-] AdminToolbox.VMWareAutomate not published"
    }

    #FortiWizard
    $PSGalleryVersion = (Find-Module Admintoolbox.FortiWizard -Repository PSGallery).version
    $GithubVersion = Get-Content "$workingdirectory/modules/Admintoolbox.FortiWizard/ChangeLog.md" | Select-Object -Last 1
    if ([version]$GithubVersion -gt [version]$PSGalleryVersion ) {
        New-Manifest -FortiWizard #Generate each modules manifest files
        Install-Module AdminToolbox.Networking -AllowClobber -Force; Import-Module AdminToolbox.Networking -Force -Global
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.FortiWizard" -NuGetApiKey $env:NUGET_KEY
        $FortiWizard = Write-Output "[+] Admintoolbox.FortiWizard published to PSGalley"
    }
    else {
        $FortiWizard = Write-Output "[-] Admintoolbox.FortiWizard not published"
    }

    #AdminToolbox
    $AdminToolboxPSGallery = (Find-Module AdminToolbox -Repository PSGallery).version
    $AdminToolboxGithub = Get-Content "$workingdirectory/modules/AdminToolbox/ChangeLog.md" | Select-Object -Last 1
    if ([version]$AdminToolboxGithub -gt [version]$AdminToolboxPSGallery ) {
        New-Manifest -AdminToolbox #Generate each modules manifest files
        Install-Module AdminToolbox.ActiveDirectory -AllowClobber -Force; Import-Module AdminToolbox.ActiveDirectory -Force -Global
        Install-Module AdminToolbox.EndpointManagement -AllowClobber -Force; Import-Module AdminToolbox.EndpointManagement -Force -Global
        Install-Module AdminToolbox.Exchange -AllowClobber -Force; Import-Module AdminToolbox.Exchange -Force -Global
        Install-Module AdminToolbox.FFTools -AllowClobber -Force; Import-Module AdminToolbox.FFTools -Force -Global
        Install-Module AdminToolbox.FileManagement -AllowClobber -Force; Import-Module AdminToolbox.FileManagement -Force -Global
        Install-Module AdminToolbox.FortiWizard -AllowClobber -Force; Import-Module AdminToolbox.FortiWizard -Force -Global
        Install-Module AdminToolbox.Fun -AllowClobber -Force; Import-Module AdminToolbox.Fun -Force -Global
        Install-Module AdminToolbox.Networking -AllowClobber -Force; Import-Module AdminToolbox.Networking -Force -Global
        Install-Module AdminToolbox.Office365 -AllowClobber -Force; Import-Module AdminToolbox.Office365 -Force -Global
        Install-Module AdminToolbox.Remoting -AllowClobber -Force; Import-Module AdminToolbox.Remoting -Force -Global
        Install-Module AdminToolbox.VMWareAutomate -AllowClobber -Force; Import-Module AdminToolbox.VMWareAutomate -Force -Global
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox" -NuGetApiKey $env:NUGET_KEY
        $AdminToolbox = Write-Output "[+] AdminToolbox published to PSGalley"
    }
    else {
        $AdminToolbox = Write-Output "[-] AdminToolbox not published"
    }

    $ActiveDirectory
    $EndpointManagement
    $Exchange
    $FFTools
    $FileManagement
    $FortiWizard
    $Fun
    $Networking
    $Office365
    $Remoting
    $VMWareAutomate
    $AdminToolbox
}