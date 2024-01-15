function Invoke-PublishModules {
    $ErrorActionPreference = 'Stop'

    #ActiveDirectory
    $ActiveDirectoryPSGallery = (Find-Module "AdminToolbox.ActiveDirectory" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.ActiveDirectory/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $ActiveDirectoryGithub = $step3 | Select-Object -First 1
    if ([version]$ActiveDirectoryGithub -gt [version]$ActiveDirectoryPSGallery ) {
        New-Manifest -ActiveDirectory #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.ActiveDirectory" -NuGetApiKey $env:NUGET_KEY
        $ActiveDirectory = Write-Output "[+] AdminToolbox.ActiveDirectory published to PSGallery"
    }
    else {
        $ActiveDirectory = Write-Output "[-] AdminToolbox.ActiveDirectory not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #EndpointManagement
    $EndpointManagementPSGallery = (Find-Module "AdminToolbox.EndpointManagement" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.EndpointManagement/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $EndpointManagementGithub = $step3 | Select-Object -First 1
    if ([version]$EndpointManagementGithub -gt [version]$EndpointManagementPSGallery ) {
        New-Manifest -EndpointManagement #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.EndpointManagement" -NuGetApiKey $env:NUGET_KEY
        $EndpointManagement = Write-Output "[+] AdminToolbox.EndpointManagement published to PSGallery"
    }
    else {
        $EndpointManagement = Write-Output "[-] AdminToolbox.EndpointManagement not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #Exchange
    $ExchangePSGallery = (Find-Module "AdminToolbox.Exchange" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Exchange/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $ExchangeGithub = $step3 | Select-Object -First 1
    if ([version]$ExchangeGithub -gt [version]$ExchangePSGallery ) {
        New-Manifest -Exchange #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Exchange" -NuGetApiKey $env:NUGET_KEY
        $Exchange = Write-Output "[+] AdminToolbox.Exchange published to PSGallery"
    }
    else {
        $Exchange = Write-Output "[-] AdminToolbox.Exchange not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #FFTools
    $FFToolsPSGallery = (Find-Module "AdminToolbox.FFTools" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.FFTools/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $FFToolsGithub = $step3 | Select-Object -First 1
    if ([version]$FFToolsGithub -gt [version]$FFToolsPSGallery ) {
        New-Manifest -FFTools #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.FFTools" -NuGetApiKey $env:NUGET_KEY
        $FFTools = Write-Output "[+] AdminToolbox.FFTools published to PSGallery"
    }
    else {
        $FFTools = Write-Output "[-] AdminToolbox.FFTools not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #FileManagement
    $FileManagementPSGallery = (Find-Module "AdminToolbox.FileManagement" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.FileManagement/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $FileManagementGithub = $step3 | Select-Object -First 1
    if ([version]$FileManagementGithub -gt [version]$FileManagementPSGallery ) {
        New-Manifest -FileManagement #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.FileManagement" -NuGetApiKey $env:NUGET_KEY
        $FileManagement = Write-Output "[+] AdminToolbox.FileManagement published to PSGallery"
    }
    else {
        $FileManagement = Write-Output "[-] AdminToolbox.FileManagement not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #Fun
    $FunPSGallery = (Find-Module "AdminToolbox.Fun" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Fun/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $FunGithub = $step3 | Select-Object -First 1
    if ([version]$FunGithub -gt [version]$FunPSGallery ) {
        New-Manifest -Fun #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Fun" -NuGetApiKey $env:NUGET_KEY
        $Fun = Write-Output "[+] AdminToolbox.Fun published to PSGallery"
    }
    else {
        $Fun = Write-Output "[-] AdminToolbox.Fun not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #msgraph
    $msgraphPSGallery = (Find-Module "AdminToolbox.msgraph" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.MSGraph/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $MSGraphGithub = $step3 | Select-Object -First 1
    if ([version]$msgraphGithub -gt [version]$msgraphPSGallery ) {
        New-Manifest -MSGraph #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.MSGraph" -NuGetApiKey $env:NUGET_KEY
        $MSGraph = Write-Output "[+] AdminToolbox.MSGraph published to PSGallery"
    }
    else {
        $MSGraph = Write-Output "[-] AdminToolbox.MSGraph not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #Networking
    $NetworkingPSGallery = (Find-Module "AdminToolbox.Networking" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Networking/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $NetworkingGithub = $step3 | Select-Object -First 1
    if ([version]$NetworkingGithub -gt [version]$NetworkingPSGallery ) {
        New-Manifest -Networking #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Networking" -NuGetApiKey $env:NUGET_KEY
        $Networking = Write-Output "[+] AdminToolbox.Networking published to PSGallery"
    }
    else {
        $Networking = Write-Output "[-] AdminToolbox.Networking not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #Office365
    $Office365PSGallery = (Find-Module "AdminToolbox.Office365" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Office365/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $Office365Github = $step3 | Select-Object -First 1
    if ([version]$Office365Github -gt [version]$Office365PSGallery ) {
        New-Manifest -Office365 #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Office365" -NuGetApiKey $env:NUGET_KEY
        $Office365 = Write-Output "[+] AdminToolbox.Office365 published to PSGallery"
    }
    else {
        $Office365 = Write-Output "[-] AdminToolbox.Office365 not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #Remoting
    $RemotingPSGallery = (Find-Module "AdminToolbox.Remoting" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Remoting/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $RemotingGithub = $step3 | Select-Object -First 1
    if ([version]$RemotingGithub -gt [version]$RemotingPSGallery ) {
        New-Manifest -Remoting #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.Remoting" -NuGetApiKey $env:NUGET_KEY
        $Remoting = Write-Output "[+] AdminToolbox.Remoting published to PSGallery"
    }
    else {
        $Remoting = Write-Output "[-] AdminToolbox.Remoting not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #VMWareAutomate
    $VMWareAutomatePSGallery = (Find-Module "AdminToolbox.VMWareAutomate" -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.VMWareAutomate/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $VMWareAutomateGithub = $step3 | Select-Object -First 1
    if ([version]$VMWareAutomateGithub -gt [version]$VMWareAutomatePSGallery ) {
        New-Manifest -VMWareAutomate #Generate each modules manifest files
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.VMWareAutomate" -NuGetApiKey $env:NUGET_KEY
        $VMWareAutomate = Write-Output "[+] AdminToolbox.VMWareAutomate published to PSGallery"
    }
    else {
        $VMWareAutomate = Write-Output "[-] AdminToolbox.VMWareAutomate not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #FortiWizard
    $FortiwizardPSGallery = (Find-Module Admintoolbox.FortiWizard -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/Admintoolbox.FortiWizard/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $FortiWizardGithub = $step3 | Select-Object -First 1
    if ([version]$FortiwizardGithub -gt [version]$FortiwizardPSGallery ) {
        New-Manifest -FortiWizard #Generate each modules manifest files
        Copy-Item $workingdirectory/modules/AdminToolbox.Networking -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.Networking -Force -Global
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox.FortiWizard" -NuGetApiKey $env:NUGET_KEY
        $FortiWizard = Write-Output "[+] Admintoolbox.FortiWizard published to PSGallery"
    }
    else {
        $FortiWizard = Write-Output "[-] Admintoolbox.FortiWizard not published"
    }

    # Added sleep to  to allow for the module to be indexed PSGallery first. This is an attempt to avoid dependency issues on publish.
    # Start-Sleep -Seconds 30

    #AdminToolbox
    $AdminToolboxPSGallery = (Find-Module AdminToolbox -Repository PSGallery).version
    $step = Get-Content "$workingdirectory/modules/AdminToolbox/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $AdminToolboxGithub = $step3 | Select-Object -First 1
    if ([version]$AdminToolboxGithub -gt [version]$AdminToolboxPSGallery ) {
        New-Manifest -AdminToolbox #Generate each modules manifest files
        Copy-Item $workingdirectory/modules/AdminToolbox.ActiveDirectory -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.ActiveDirectory -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.EndpointManagement -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.EndpointManagement -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.Exchange -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.Exchange -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.FFTools -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.FFTools -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.FileManagement -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.FileManagement -Force -Global
        if ((Test-Path $env:ProgramFiles\WindowsPowerShell\Modules\AdminToolbox.Networking) -eq $false) { Copy-Item $workingdirectory/modules/AdminToolbox.Networking -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse }; Import-Module $workingdirectory/modules/AdminToolbox.Networking -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.FortiWizard -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.FortiWizard -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.Fun -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.Fun -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.MSGraph -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.MSGraph -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.Office365 -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.Office365 -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.Remoting -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.Remoting -Force -Global
        Copy-Item $workingdirectory/modules/AdminToolbox.VMWareAutomate -Destination $env:ProgramFiles\WindowsPowerShell\Modules -Force -Recurse ; Import-Module $workingdirectory/modules/AdminToolbox.VMWareAutomate -Force -Global
        Publish-Module -Path "$workingdirectory/modules/AdminToolbox" -NuGetApiKey $env:NUGET_KEY
        $AdminToolbox = Write-Output "[+] AdminToolbox published to PSGallery"
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
    $MSGraph
    $Networking
    $Office365
    $Remoting
    $VMWareAutomate
    $AdminToolbox
}