<#
    .DESCRIPTION
    Returns a list of Virtual Directories

    .Parameter server
    Specifies the server to pull directories for

    .NOTES
    Requires the Microsoft Exchange module.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-VirtualDirectories {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]$server
    )

    Write-Host "Powershell Virtual Directories"   -ForegroundColor Green
    Get-PowerShellVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "Active-Sync Virtual Directories"  -ForegroundColor Green
    Get-ActiveSyncVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "Web Services Virtual Directories"    -ForegroundColor Green
    Get-WebServicesVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "OWA Virtual Directories"    -ForegroundColor Green
    Get-OwaVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "AutoDiscover Virtual Directories"   -ForegroundColor Green
    Get-AutodiscoverVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "ECP Virtual Directories"    -ForegroundColor Green
    Get-EcpVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "OAB Virtual Directories"    -ForegroundColor Green
    Get-OABvirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "MAPI Virtual Directories"    -ForegroundColor Green
    get-mapivirtualdirectory -server $server | Format-List internalurl, externalurl
}