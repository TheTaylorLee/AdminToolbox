@{
    AliasesToExport      = 'Write-WinEvent', 'Write-Events'
    Author               = 'Przemyslaw Klys'
    CompanyName          = 'Evotec'
    CompatiblePSEditions = 'Desktop', 'Core'
    Copyright            = '(c) 2011 - 2019 Przemyslaw Klys. All rights reserved.'
    Description          = 'Simple module allowing parsing of event logs. Has its own quirks...'
    FunctionsToExport    = 'Get-Events', 'Get-EventsFilter', 'Get-EventsInformation', 'Get-EventsSettings', 'Set-EventsSettings', 'Write-Event'
    GUID                 = '5df72a79-cdf6-4add-b38d-bcacf26fb7bc'
    ModuleVersion        = '1.0.17'
    PowerShellVersion    = '5.1'
    PrivateData          = @{
        PSData = @{
            Tags                       = 'Events', 'Viewer', 'Windows', 'XML', 'XPATH', 'EVTX'
            ProjectUri                 = 'https://github.com/EvotecIT/PSEventViewer'
            ExternalModuleDependencies = 'Microsoft.PowerShell.Utility', 'Microsoft.PowerShell.Diagnostics', 'Microsoft.PowerShell.Management'
            IconUri                    = 'https://evotec.xyz/wp-content/uploads/2018/10/PSEventViewer.png'
        }
    }
    RequiredModules      = 'Microsoft.PowerShell.Utility', 'Microsoft.PowerShell.Diagnostics', 'Microsoft.PowerShell.Management'
    RootModule           = 'PSEventViewer.psm1'
}