<#
    .DESCRIPTION
    This funcion expands on the AZViz module by PrateekSingh. That module can export Azure resourcegroups to create dependency diagrams. This function will loop through all resource groups to create a diagram for all in a tenant and export them into a logical folder structure.

    .EXAMPLE
    Get-TenantDiagrams -theme light -OutputFilePath (Get-FolderName) -Direction left-to-right -CategoryDepth 3 -LabelVerbosity 1

    .NOTES
    Tested and compatible with AZViz version 1.0.9 and PSGraph version 2.1.38.27. If not working in the future look for changes in those modules versions

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-TenantDiagrams {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateSet('light', 'dark', 'neon')]$theme,
        [Parameter(Mandatory = $true)][ValidateScript( { Test-Path -Path $_ -IsValid })][string] $OutputFilePath,
        [Parameter(Mandatory = $false)][ValidateSet(1, 2, 3)][int] $LabelVerbosity = 1,
        [Parameter(Mandatory = $false)][ValidateSet(1, 2, 3)][int] $CategoryDepth = 3,
        [Parameter(Mandatory = $false)][ValidateSet('png', 'svg')][string] $OutputFormat = 'png',
        [Parameter(Mandatory = $false)][ValidateSet('left-to-right', 'top-to-bottom')][string] $Direction = 'left-to-right'
    )


    # verify dependent modules are loaded and available
    $DependentModules = 'PSGraph', 'az', 'AzViz'
    $Installed = Import-Module $DependentModules -PassThru -ErrorAction SilentlyContinue | Where-Object { $_.name -In $DependentModules }
    $Missing = $DependentModules | Where-Object { $_ -notin $Installed.name }
    if ($Missing) {
        Write-Verbose "[+] Module dependencies not found [$Missing]. Attempting to install."
        $prompt = Read-Host "Do you want to install Missing Modules? (yes/no)"
        if ($prompt) {
            Install-Module $Missing -Force -AllowClobber -Confirm:$false -Scope CurrentUser
            Import-Module $Missing
        }
    }

    $script:dateis = Get-Date -Format MM-dd-yyyy

    if ($OutputFormat -eq 'svg') {
        $script:extension = '.svg'
    }
    else {
        $script:extension = '.png'
    }


    $Subscriptions = Get-AzSubscription | Out-GridView -PassThru -Title 'Select the Subscriptions you wish to generate graphs of'

    foreach ($sub in $Subscriptions) {
        Get-AzSubscription -SubscriptionName $sub.Name | Set-AzContext | Out-Null
        $script:name = $sub.name
        New-Item -Path $OutputFilePath\$dateis\$name -ItemType Directory | Out-Null
        $AZResourcegroups = Get-AzResourceGroup

        foreach ($RGName in $AZResourcegroups) {

            $RG = $RGName.resourcegroupname
            $filename = $RG + $extension

            $Params = @{
                ResourceGroup  = $RG
                OutputFilePath = "$OutputFilePath\$dateis\$name\$filename"
                Theme          = $Theme
                OutputFormat   = $OutputFormat
                CategoryDepth  = $CategoryDepth
                Direction      = $Direction
                LabelVerbosity = $LabelVerbosity
            }

            Export-AzViz @params

        }
    }
}