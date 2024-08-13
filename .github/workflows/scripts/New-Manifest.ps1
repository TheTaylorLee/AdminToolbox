#This is used by a workflow to generate manifest files. Only needs to be updated manually when exported functions or other static variables need changing. Otherwise can be left as is.

Function New-Manifest {
    #Must Be run each time a new module version is created.
    #Version folder name must be the same as the moduleversion parameter
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $false)][Switch]$AdminToolbox,
        [Parameter(Mandatory = $false)][Switch]$ActiveDirectory,
        [Parameter(Mandatory = $false)][Switch]$EndpointManagement,
        [Parameter(Mandatory = $false)][Switch]$Exchange,
        [Parameter(Mandatory = $false)][Switch]$FFTools,
        [Parameter(Mandatory = $false)][Switch]$FileManagement,
        [Parameter(Mandatory = $false)][Switch]$FortiWizard,
        [Parameter(Mandatory = $false)][Switch]$Fun,
        [Parameter(Mandatory = $false)][Switch]$Networking,
        [Parameter(Mandatory = $false)][Switch]$MSGraph,
        [Parameter(Mandatory = $false)][Switch]$Office365,
        [Parameter(Mandatory = $false)][Switch]$Remoting,
        [Parameter(Mandatory = $false)][Switch]$VMWareAutomate
    )

    $step = Get-Content "$workingdirectory/modules/AdminToolbox.ActiveDirectory/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:ActiveDirectoryGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.EndpointManagement/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:EndpointManagementGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Exchange/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:ExchangeGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.FFTools/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:FFToolsGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.FileManagement/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:FileManagementGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Fun/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:FunGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.MSGraph/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:MSGraphGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Networking/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:NetworkingGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Office365/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:Office365GithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.Remoting/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:RemotingGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox.VMWareAutomate/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:VMWareAutomateGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/Admintoolbox.FortiWizard/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:FortiWizardGithubVersion = $step3 | Select-Object -First 1
    $step = Get-Content "$workingdirectory/modules/AdminToolbox/ChangeLog.md" | Select-Object -Last 1; $step2 = $step.trimstart('* **'); $step3 = ($step2).split('*'); $script:AdminToolboxGithubVersion = $step3 | Select-Object -First 1

    if ($AdminToolbox) {
        ##Create Manifests
        #AdminToolbox
        $savepath = "$workingdirectory\modules\AdminToolbox"
        #Old iconurl. Maybe bad now if profile image has changed. 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-All', 'Get-Info', 'Get-Full', 'Start-Application', 'Get-ModuleAliases', 'Invoke-Show'
            Path                 = "$savepath\AdminToolbox.psd1"
            Author               = "Taylor Lee"
            Description          = "Master module for a collection of modules. These modules are varied in their tasks. The overall purpose of them being to provide a powerfull Toolset to improve IT Admin workflows."
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:AdminToolboxGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox'
            RequiredModules      = (
                @{ModuleName = 'AdminToolbox.ActiveDirectory'; ModuleVersion = $script:ActiveDirectoryGithubVersion; },
                @{ModuleName = 'AdminToolbox.EndpointManagement'; ModuleVersion = $script:EndpointManagementGithubVersion; },
                @{ModuleName = 'AdminToolbox.Exchange'; ModuleVersion = $script:ExchangeGithubVersion; },
                @{ModuleName = 'AdminToolbox.FFTools'; ModuleVersion = $script:FFToolsGithubVersion; },
                @{ModuleName = 'AdminToolbox.FileManagement'; ModuleVersion = $script:FileManagementGithubVersion; },
                @{ModuleName = 'AdminToolbox.FortiWizard'; ModuleVersion = $script:FortiWizardGithubVersion; },
                @{ModuleName = 'AdminToolbox.Fun'; ModuleVersion = $script:FunGithubVersion; },
                @{ModuleName = 'AdminToolbox.Networking'; ModuleVersion = $script:NetworkingGithubVersion; },
                @{ModuleName = 'AdminToolbox.MSGraph'; ModuleVersion = $script:MSGraphGithubVersion; },
                @{ModuleName = 'AdminToolbox.Office365'; ModuleVersion = $script:Office365GithubVersion; },
                @{ModuleName = 'AdminToolbox.Remoting'; ModuleVersion = $script:RemotingGithubVersion; },
                @{ModuleName = 'AdminToolbox.VMWareAutomate'; ModuleVersion = $script:VMWareAutomateGithubVersion; },
                @{ModuleName = 'ImportExcel'; ModuleVersion = '7.0.1'; },
                @{ModuleName = 'posh-ssh'; ModuleVersion = '2.3.0' },
                @{ModuleName = 'PSEventViewer'; ModuleVersion = '1.0.17'; }
            )
            RootModule           = "AdminToolboxManifest.psm1"
            ReleaseNotes         = "The release notes can be found in the ChangeLog.md file at the scriptroot path."
            Tags                 = '365', 'Active', 'ActiveDirectory', 'Automate', 'Application', 'Crescendo', 'Directory', 'Exchange', 'FileManagement', 'Fortinet', 'FortiGate', 'FortiOS', 'GraphAPI', 'Iperf', 'MSGraph', 'Network', 'Networking', 'NetworkScan', 'Office', 'Office365', 'OpenSSH', 'PC', 'PCSetup', 'Print', 'Printer', 'Remoting', 'Robocopy', 'Setup', 'SSH', 'vmware', 'Windows'
        }

        New-ModuleManifest @Params
    }

    if ($ActiveDirectory) {
        #ActiveDirectory
        $savepath = "$workingdirectory\modules\AdminToolbox.ActiveDirectory"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Copy-GroupMembersToGroup', 'Get-ActiveDirectory', 'Get-ADInfo', 'Get-DCLockoutEvents', 'Get-EndpointReport', 'Get-LockedAccounts', 'Get-PasswordExpired', 'Get-ReplicationStatus', 'Get-UserReport', 'Set-Password', 'Start-Replication', 'Unlock-Account', 'Unlock-AllAccounts', 'Get-GroupMemberships', 'Get-GroupMembers', 'Import-ActiveDirectory', 'Get-MailEnabledMembers'
            Path                 = "$savepath\AdminToolbox.ActiveDirectory.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions for Active Directory"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:ActiveDirectoryGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.ActiveDirectoryManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'Active', 'ActiveDirectory', 'Directory', 'Groups', 'Users'
        }

        New-ModuleManifest @Params
    }

    if ($EndpointManagement) {
        #EndpointManagement
        $savepath = "$workingdirectory\modules\AdminToolbox.EndpointManagement"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Add-LocalAdmin', 'Disable-Firewall', 'Disable-PasswordPeek', 'Disable-ShakeToMinimize', 'Disable-Standby', 'Dismount-ProfileRegistry', 'Enable-Firewall', 'Enable-RSATFeatures', 'Get-Applications', 'Get-ChocoOutdated', 'Get-IntroPCS', 'Get-Management', 'Get-PCInfo', 'Get-PrintBackup', 'Get-Printers', 'Get-PrintManagement', 'Get-EndpointManagement', 'Install-Chocolatey', 'Install-ChocoPackages', 'Invoke-ChocoUpgrade', 'Invoke-PrinterServerRenew', 'Join-Domain', 'Mount-ProfileRegistry', 'Remove-PrintQueue', 'Remove-Shortcuts', 'Remove-StoreApps', 'Remove-Tiles', 'Restart-Endpoint', 'Get-ChocoInstalls', 'Set-UAC', 'Uninstall-Application', 'Get-PowerShell7', 'Reset-EndpointPassword', 'Repair-DomainJoin', 'Disable-Cortana', 'Get-MonitorSizes', 'Get-RebootEvents', 'Get-RemoteDesktopLogins', 'Get-LocalLogonHistory'
            Path                 = "$savepath\AdminToolbox.EndpointManagement.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions for management of endpoints"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:EndpointManagementGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" },
                @{ ModuleName = "PSEventViewer" ; ModuleVersion = "1.0.17" }
            )
            RootModule           = "AdminToolbox.EndpointManagementManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'Chocolatey', 'PC', 'PCSetup', 'Print', 'Printer', 'Setup', 'UAC', 'Windows'
        }

        New-ModuleManifest @Params
    }

    if ($Exchange) {
        #Exchange
        $savepath = "$workingdirectory\modules\AdminToolbox.Exchange"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-Exchange', 'Add-DistributionMember', 'Get-MailLog', 'Get-UserDisabledMailboxes', 'Get-VirtualDirectories', 'Set-VirtualDirectories', 'Get-MailboxScaleReport', 'Get-MailboxAccessOWAOnly', 'Enable-365MailboxExistingUser', 'Connect-ExchangeServer', 'Disconnect-ExchangeServer', 'get-mailboxreport'
            Path                 = "$savepath\AdminToolbox.Exchange.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions for Exchange Management"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:ExchangeGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.ExchangeManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'Exchange'
        }

        New-ModuleManifest @Params
    }

    if ($FFTools) {
        #FFTools
        $savepath = "$workingdirectory\modules\AdminToolbox.FFTools"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-FFTools', 'Get-Tips', 'Install-FFTools', 'Set-FFToolsVariables', 'Start-BurnSubtitles', 'Start-Remux', 'Start-Transcode', 'Get-Streams', 'Start-TranscodeMap'
            Path                 = "$savepath\AdminToolbox.FFTools.psd1"
            Author               = "Taylor Lee"
            Description          = "Expedite simple ffmpeg actions"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:FFToolsGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.FFToolsManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'FFMpeg', 'Remux', 'Transcode'
        }

        New-ModuleManifest @Params
    }

    if ($FileManagement) {
        #FileManagement
        $savepath = "$workingdirectory\modules\AdminToolbox.FileManagement"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-FileManagement', 'Find-ComputersFiles', 'Get-FileOwner', 'Get-FolderSize', 'Invoke-Robocopy', 'Remove-All', 'Remove-DisabledADProfiles', 'Remove-OlderThan', 'Get-ShareReport', 'Get-FolderName', 'Get-FileName', 'Use-WSLnano', 'Get-EmptyDirectory', 'Get-LastUsedDirectory'
            Path                 = "$savepath\AdminToolbox.FileManagement.psd1"
            Author               = "Taylor Lee"
            Description          = "File Management Functions"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:FileManagementGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.FileManagementManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'File', 'Robocopy'
        }

        New-ModuleManifest @Params
    }

    if ($FortiWizard) {
        #FortiWizard
        $savepath = "$workingdirectory\modules\AdminToolbox.FortiWizard"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Disable-SipALG', 'Enable-Management', 'Enable-PushNotifications', 'Get-FortiWizard', 'New-AddressObject', 'New-AddressGroup', 'Write-SSLVPNConfig', 'New-IPPoolOverload', 'New-IPPoolFixedRange', 'New-VIPHost', 'New-VIPRange', 'New-ServiceObject', 'New-ServiceGroup', 'New-P2PTunnel', 'Show-Docs', 'New-P2PTunnelNAT', 'New-DialUPTunnelRemoteNAT', 'New-DialUPTunnelBehindNAT', 'New-FormTunnel', 'New-LocalInPolicy', 'Add-SSLVPNSAMLUsersMFAEnforced', 'Add-SSLVPNSAMLUsersAzureDefaultSecurity', 'Add-SSLVPNSAMLUsersSelection'
            Path                 = "$savepath\AdminToolbox.FortiWizard.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions that generate configuration scripts and manage FortiOS."
            ModuleVersion        = "$script:FortiWizardGithubVersion"
            Powershellversion    = "5.1"
            RootModule           = "AdminToolbox.FortiWizardManifest.psm1"
            ReleaseNotes         = "Full ChangeLog contained in bundled ChangeLog"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            Tags                 = 'Fortinet', 'FortiGate', 'FortiOS', 'Network', 'Networking', 'VPN', 'Wizard'
            RequiredModules      = (
                @{ModuleName = 'AdminToolbox.Networking'; ModuleVersion = $script:NetworkingGithubVersion; },
                @{ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" },
                @{ModuleName = 'posh-ssh'; ModuleVersion = '2.3.0' }
            )
        }

        New-ModuleManifest @Params
    }

    if ($fun) {
        #Fun
        $savepath = "$workingdirectory\modules\AdminToolbox.Fun"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-Fun', 'Get-CloseEncounters', 'Get-Excuse', 'Get-ImperialMarch', 'Get-MissionImpossible', 'Get-Mario', 'Get-Tetris', 'Get-Weather', 'Invoke-EjectTray', 'Invoke-Speak', 'Get-Creed', 'Get-Emote'
            Path                 = "$savepath\AdminToolbox.Fun.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions that have no purpose"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:FunGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.FunManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'Pranks', 'ConsoleMusic'
        }

        New-ModuleManifest @Params
    }

    if ($Networking) {
        #Networking
        $savepath = "$workingdirectory\modules\AdminToolbox.Networking"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-Networking', 'Clear-Arp', 'Get-NetworkStatistics', 'Get-PublicIP', 'Get-MacVendor', 'Invoke-NetworkScan', 'Reset-NetworkAdapter', 'Reset-NetworkStack', 'Invoke-Iperf', 'Start-SpeedTest', 'Get-Whois', 'Invoke-Monitor', 'Show-IPInfo', 'Invoke-Ethr', 'Invoke-PSIPcalc', 'Get-NICConfig'
            Path                 = "$savepath\AdminToolbox.Networking.psd1"
            Author               = "Taylor Lee"
            Description          = "Network Troubleshooting Functions"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:NetworkingGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RootModule           = "AdminToolbox.NetworkingManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'ARP', 'CIDR', 'ethr', 'iperf', 'MAC', 'Network', 'Networking', 'NetworkScan', 'OUI', 'Scanning', 'Subnet', 'Subnetting', 'Whois'
        }

        New-ModuleManifest @Params
    }

    if ($MSGraph) {
        #MSGraph
        $savepath = "$workingdirectory\modules\AdminToolbox.MSGraph"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-msgMFAStatus', 'Register-msgScopes', 'Get-MSGraph', 'Show-AllMSGFunctions', 'Get-msgDirectoryRoleMembers', 'get-msgguestusers', 'Get-msgSignIns', 'Get-msgAuthenticationRegistration', 'Disable-UserServicePlan'
            Path                 = "$savepath\AdminToolbox.MSGraph.psd1"
            Author               = "Taylor Lee"
            Description          = "Microsoft Graph interactive API Functions"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:MSGraphGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RootModule           = "AdminToolbox.MSGraphManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'GraphAPI', 'MSGraph', 'MicrosoftGraph'
        }

        New-ModuleManifest @Params
    }

    if ($Office365) {
        #Office365
        $savepath = "$workingdirectory\modules\AdminToolbox.Office365"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-Office365', 'Connect-Office365', 'Convert-MailboxToShared', 'Invoke-Sync365', 'Set-365GroupVisibility', 'Unblock-Quarantine', 'Get-Quarantine', 'Set-Subscription', 'Invoke-PowerState', 'Get-VMDetails', 'Get-TenantDiagrams', 'Invoke-EXOSharedSession', 'Enable-MailboxAccess', 'Clear-TeamsCache', 'Get-DistributionGroupMembers', 'Remove-VersionHistoryOlderThan', 'Get-VersionHistoryReport', 'Set-SharepointVersionLimits', 'Set-SiteOwner'
            Path                 = "$savepath\AdminToolbox.Office365.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions for working with Office365 and Azure modules"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:Office365GithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.Office365Manifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'Office365', 'Office', '365'
        }

        New-ModuleManifest @Params
    }

    if ($Remoting) {
        #Remoting
        $savepath = "$workingdirectory\modules\AdminToolbox.Remoting"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Get-Remoting', 'Connect-OpenSSH', 'Enable-Remoting', 'Install-SSH', 'Invoke-ServiceRecovery', 'Invoke-RWinSta', 'Invoke-QWinSta', 'Remove-TerminalSessions', 'Get-TerminalSessions', 'Invoke-RunAsSSMS', 'Invoke-RunAsNetwork'
            Path                 = "$savepath\AdminToolbox.Remoting.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions for remote management and access."
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:RemotingGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.RemotingManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'OpenSSH', 'Remoting', 'SSH'
        }

        New-ModuleManifest @Params
    }

    if ($VMWareAutomate) {
        #VMWareAutomate
        $savepath = "$workingdirectory\modules\AdminToolbox.VMWareAutomate"
        $Params = @{
            CompatiblePSEditions = "Desktop", "Core"
            FunctionsToExport    = 'Enable-ToolsAutoUpgrade', 'Get-DRBackup', 'Get-HostMemoryDimms', 'Get-HostSerialNumber', 'Get-ToolsAutoUpgradeState', 'Get-VMTools', 'Get-VMwareAutomate', 'Invoke-HotAdd', 'Invoke-Power', 'Update-PowerCLIConfiguration', 'Update-VMTools', 'Enable-DatastoreRoundRobin', 'Get-VMFolderPaths'
            Path                 = "$savepath\AdminToolbox.VMWareAutomate.psd1"
            Author               = "Taylor Lee"
            Description          = "Functions to Automate Bulk VMWare Tasks"
            IconUri              = 'https://raw.githubusercontent.com/TheTaylorLee/AdminToolbox/master/images/toolboxShell2.png'
            LicenseUri           = 'https://github.com/TheTaylorLee/AdminToolbox/blob/master/LICENSE.txt'
            ModuleVersion        = "$script:VMWareAutomateGithubVersion"
            Powershellversion    = "5.1"
            ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
            RequiredModules      = (
                @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
            )
            RootModule           = "AdminToolbox.VMWareAutomateManifest.psm1"
            ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
            Tags                 = 'Automate', 'VMware'
        }

        New-ModuleManifest @Params
    }
}
