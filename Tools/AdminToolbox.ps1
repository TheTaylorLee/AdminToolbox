#First set environment variable. This will be the root save path where repository folders are cloned to.
#Be sure not to include a backslash at the end.
$gitrootpath = "G:\Github\AdminToolbox"

#Set variable for current session
$env:gitrootpath = $gitrootpath

#Set Persistent Environment Variables
[Environment]::SetEnvironmentVariable("FFToolsTarget", "$gitrootpath", "User")



Function out-manifests {
    #Must Be run each time a new module version is created.
    #Version folder name must be the same as the moduleversion parameter


    ##Create Manifests
    #AdminToolbox
    $savepath = "$env:gitrootpath\AdminToolbox"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-All', 'Get-Info', 'Get-Full', 'Start-Application', 'Get-ModuleAliases', 'Invoke-Show', 'Open-AdminMMC', 'Start-Cmder', 'Install-PSPortableLight', 'Install-PSPortable'
        Path                 = "$savepath\AdminToolbox.psd1"
        Author               = "Taylor Lee"
        Description          = "Parent module for a collection of modules. These modules are varied in their tasks. Review required modules or the project site to better understand this modules capabilities."
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "9.0.6.0"
        Powershellversion    = "5.1"
        ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox'
        RequiredModules      = (
            @{ModuleName = 'AdminToolbox.ActiveDirectory'; ModuleVersion = '1.5.0.0'; },
            @{ModuleName = 'AdminToolbox.EndpointManagement'; ModuleVersion = '4.6.0.0'; },
            @{ModuleName = 'AdminToolbox.Exchange'; ModuleVersion = '1.7.0.0'; },
            @{ModuleName = 'AdminToolbox.FFTools'; ModuleVersion = '4.6.0.0'; },
            @{ModuleName = 'AdminToolbox.FileManagement'; ModuleVersion = '1.6.0.0'; },
            @{ModuleName = 'AdminToolbox.FortiWizard'; ModuleVersion = '1.2.2.0'; },
            @{ModuleName = 'AdminToolbox.Fun'; ModuleVersion = '1.4.0.0'; },
            @{ModuleName = 'AdminToolbox.Networking'; ModuleVersion = '2.8.1.0'; },
            @{ModuleName = 'AdminToolbox.Office365'; ModuleVersion = '2.4.0.0'; },
            @{ModuleName = 'AdminToolbox.Remoting'; ModuleVersion = '1.7.0.0'; },
            @{ModuleName = 'AdminToolbox.VMWareAutomate'; ModuleVersion = '4.5.1.0'; },
            @{ModuleName = 'ImportExcel'; ModuleVersion = '7.0.1'; },
            @{ModuleName = 'PSEventViewer'; ModuleVersion = '1.0.17'; },
            @{ModuleName = 'PSNmap'; ModuleVersion = '1.3.1'; }
        )
        RootModule           = "AdminToolboxManifest.psm1"
        ReleaseNotes         = "The release notes can be found in the ChangeLog.md file at the scriptroot path."
        Tags                 = '365', 'Active', 'ActiveDirectory', 'Automate', 'Application', 'Directory', 'Exchange', 'FileManagement', 'Iperf', 'Network', 'Networking', 'NetworkScan', 'Office', 'Office365', 'OpenSSH', 'PC', 'PCSetup', 'Print', 'Printer', 'Remoting', 'Robocopy', 'Setup', 'SSH', 'vmware', 'Windows'
    }

    New-ModuleManifest @Params

    #ActiveDirectory
    $savepath = "$env:gitrootpath\AdminToolbox.ActiveDirectory"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-ActiveDirectory', 'Get-ADInfo', 'Get-DCLockoutEvents', 'Get-EndpointReport', 'Get-LockedAccounts', 'Get-PasswordExpired', 'Get-ReplicationStatus', 'Get-UserReport', 'Set-Password', 'Start-Replication', 'Unlock-Account', 'Unlock-AllAccounts', 'Get-GroupMemberships', 'Get-GroupMembers', 'Import-ActiveDirectory'
        Path                 = "$savepath\AdminToolbox.ActiveDirectory.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions for Active Directory"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "1.5.0.0"
        Powershellversion    = "5.1"
        ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
        RequiredModules      = (
            @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
        )
        RootModule           = "AdminToolbox.ActiveDirectoryManifest.psm1"
        ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
        Tags                 = 'Active', 'ActiveDirectory', 'Directory'
    }

    New-ModuleManifest @Params

    #EndpointManagement
    $savepath = "$env:gitrootpath\AdminToolbox.EndpointManagement"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Add-LocalAdmin', 'Disable-Firewall', 'Disable-PasswordPeek', 'Disable-ShakeToMinimize', 'Disable-Standby', 'Dismount-ProfileRegistry', 'Enable-Firewall', 'Enable-RSATFeatures', 'Get-Applications', 'Get-ChocoOutdated', 'Get-IntroPCS', 'Get-Management', 'Get-PCInfo', 'Get-PrintBackup', 'Get-Printers', 'Get-PrintManagement', 'Get-EndpointManagement', 'Install-Chocolatey', 'Install-ChocoPackages', 'Invoke-ChocoUpgrade', 'Invoke-PrinterServerRenew', 'Join-Domain', 'Mount-ProfileRegistry', 'Remove-PrintQueue', 'Remove-Shortcuts', 'Remove-StoreApps', 'Remove-Tiles', 'Restart-Endpoint', 'Get-ChocoInstalls', 'Set-UAC', 'Uninstall-Application', 'Get-PowerShell7', 'Reset-EndpointPassword', 'Repair-DomainJoin', 'Disable-Cortana', 'Get-MonitorSizes', 'Get-RebootEvents', 'Get-RemoteDesktopLogins'
        Path                 = "$savepath\AdminToolbox.EndpointManagement.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions for management of endpoints"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "4.6.0.0"
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

    #Exchange
    $savepath = "$env:gitrootpath\AdminToolbox.Exchange"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-Exchange', 'Add-DistributionMember', 'Get-MailLog', 'Get-UserDisabledMailboxes', 'Get-VirtualDirectories', 'Set-VirtualDirectories', 'Get-MailboxScaleReport', 'Get-MailboxAccessOWAOnly', 'Enable-365MailboxExistingUser', 'Connect-ExchangeServer', 'Disconnect-ExchangeServer', 'get-mailboxreport'
        Path                 = "$savepath\AdminToolbox.Exchange.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions for Exchange Management"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "1.7.0.0"
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

    #FFTools
    $savepath = "$env:gitrootpath\AdminToolbox.FFTools"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-FFTools', 'Get-Tips', 'Install-FFTools', 'Set-FFToolsVariables', 'Start-BurnSubtitles', 'Start-Remux', 'Start-Transcode', 'Get-Streams', 'Start-TranscodeMap'
        Path                 = "$savepath\AdminToolbox.FFTools.psd1"
        Author               = "Taylor Lee"
        Description          = "Expedite simple ffmpeg actions"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "4.6.0.0"
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

    #FileManagement
    $savepath = "$env:gitrootpath\AdminToolbox.FileManagement"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-FileManagement', 'Find-ComputersFiles', 'Get-FileOwner', 'Get-FolderSize', 'Invoke-Robocopy', 'Remove-All', 'Remove-DisabledADProfiles', 'Remove-OlderThan', 'Get-ShareReport', 'Get-FolderName', 'Get-FileName'
        Path                 = "$savepath\AdminToolbox.FileManagement.psd1"
        Author               = "Taylor Lee"
        Description          = "File Management Functions"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "1.6.0.0"
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

    #FortiWizard
    $savepath = "$env:gitrootpath\AdminToolbox.FortiWizard"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Disable-SipALG', 'Enable-Management', 'Enable-PushNotifications', 'Get-FortiWizard', 'New-AddressObject', 'New-AddressGroup', 'Write-SSLVPNConfig', 'New-IPPoolOverload', 'New-IPPoolFixedRange', 'New-VIPHost', 'New-VIPRange', 'New-ServiceObject', 'New-ServiceGroup', 'New-P2PTunnel', 'Show-Docs', 'New-P2PTunnelNAT', 'New-DialUPTunnelStatic', 'New-DialUPTunnelDynamic'
        Path                 = "$savepath\AdminToolbox.FortiWizard.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions that generate configuration scripts and manage FortiOS. This Module is unofficial and in no way affiliated with Fortinet."
        ModuleVersion        = "1.2.2.0"
        Powershellversion    = "5.1"
        RootModule           = "AdminToolbox.FortiWizardManifest.psm1"
        ReleaseNotes         = "Full ChangeLog contained in bundled ChangeLog"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
        Tags                 = 'Fortinet', 'FortiGate', 'FortiOS'
        RequiredModules      = (
            @{ModuleName = 'posh-ssh'; ModuleVersion = '2.3.0' }
        )
    }

    New-ModuleManifest @Params

    #Fun
    $savepath = "$env:gitrootpath\AdminToolbox.Fun"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-Fun', 'Get-CloseEncounters', 'Get-Excuse', 'Get-ImperialMarch', 'Get-MissionImpossible', 'Get-Mario', 'Get-Tetris', 'Get-Weather', 'Invoke-EjectTray', 'Invoke-Speak', 'Get-Creed', 'Get-Emote'
        Path                 = "$savepath\AdminToolbox.Fun.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions that have no purpose"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "1.4.0.0"
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

    #Networking
    $savepath = "$env:gitrootpath\AdminToolbox.Networking"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-Networking', 'Clear-Arp', 'Get-NetworkStatistics', 'Get-PublicIP', 'Get-MacVendor', 'Invoke-NetworkScan', 'Reset-NetworkAdapter', 'Reset-NetworkStack', 'Start-Iperf', 'Start-SpeedTest', 'Get-Whois', 'Invoke-Monitor', 'Show-IPInfo', 'Start-Trace'
        Path                 = "$savepath\AdminToolbox.Networking.psd1"
        Author               = "Taylor Lee"
        Description          = "Network Troubleshooting Functions"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "2.8.1.0"
        Powershellversion    = "5.1"
        ProjectUri           = 'https://github.com/TheTaylorLee/AdminToolbox/'
        RequiredModules      = (
            @{ ModuleName = "PSNmap" ; ModuleVersion = "1.3.1" },
            @{ ModuleName = "ImportExcel" ; ModuleVersion = "7.0.1" }
        )
        RootModule           = "AdminToolbox.NetworkingManifest.psm1"
        ReleaseNotes         = "Dependency module for the Module AdminToolbox. Full ChangeLog contained in bundled ChangeLog.txt"
        Tags                 = 'iperf', 'Networking', 'NetworkScan'
    }

    New-ModuleManifest @Params

    #Office365
    $savepath = "$env:gitrootpath\AdminToolbox.Office365"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-Office365', 'Get-MFAStatus', 'Get-RoleMembers', 'Connect-Office365', 'Convert-MailboxToShared', 'Get-AuthPolicy', 'New-AuthPolicy', 'Set-AuthPolicy', 'Start-AzureSync', 'Invoke-Sync365', 'Get-GuestUsers', 'Set-PasswordNeverExpire', 'Set-365GroupVisibility', 'Unblock-Quarantine', 'Get-Quarantine', 'Set-Subscription', 'Invoke-PowerState', 'Get-VMDetails', 'Get-TenantDiagrams', 'Invoke-EXOSharedSession', 'Enable-MailboxAccess'
        Path                 = "$savepath\AdminToolbox.Office365.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions for working with Office365 and Azure modules"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "2.4.0.0"
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

    #Remoting
    $savepath = "$env:gitrootpath\AdminToolbox.Remoting"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Get-Remoting', 'Connect-OpenSSH', 'Enable-Remoting', 'Install-SSH', 'Invoke-ServiceRecovery', 'Invoke-RWinSta', 'Invoke-QWinSta', 'Remove-TerminalSessions', 'Get-TerminalSessions', 'Invoke-RunAsSSMS', 'Invoke-RunAsNetwork'
        Path                 = "$savepath\AdminToolbox.Remoting.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions for remote management an access."
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "1.7.0.0"
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

    #VMWareAutomate
    $savepath = "$env:gitrootpath\AdminToolbox.VMWareAutomate"
    $Params = @{
        CompatiblePSEditions = "Desktop", "Core"
        FunctionsToExport    = 'Enable-ToolsAutoUpgrade', 'Get-DRBackup', 'Get-HostMemoryDimms', 'Get-HostSerialNumber', 'Get-ToolsAutoUpgradeState', 'Get-VMTools', 'Get-VMwareAutomate', 'Invoke-HotAdd', 'Invoke-Power', 'Update-PowerCLIConfiguration', 'Update-VMTools', 'Enable-DatastoreRoundRobin', 'Get-VMFolderPaths'
        Path                 = "$savepath\AdminToolbox.VMWareAutomate.psd1"
        Author               = "Taylor Lee"
        Description          = "Functions to Automate Bulk VMWare Tasks"
        HelpInfoUri          = "https://github.com/TheTaylorLee/AdminToolbox/issues"
        IconUri              = 'https://avatars2.githubusercontent.com/u/53202926?s=460&v=4'
        ModuleVersion        = "4.5.1.0"
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

out-manifests