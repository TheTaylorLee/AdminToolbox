Function Get-VirtualDirectories {

    <#
    .DESCRIPTION
    Returns a list of Virtual Directories

    .Parameter server
    Specifies the server to pull directories for

    .NOTES
    Requires the Microsoft Exchange module.

    .Link
    Set-VirtualDirectories
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]$server
    )

    Write-Host "Powershell Virtual Directories"   -Foregroundcolor Green
    Get-PowerShellVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "Active-Sync Virtual Directories"  -Foregroundcolor Green
    Get-ActiveSyncVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "Web Services Virtual Directories"    -Foregroundcolor Green
    Get-WebServicesVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "OWA Virtual Directories"    -Foregroundcolor Green
    Get-OwaVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "AutoDiscover Virtual Directories"   -Foregroundcolor Green
    Get-AutodiscoverVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "ECP Virtual Directories"    -Foregroundcolor Green
    Get-EcpVirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "OAB Virtual Directories"    -Foregroundcolor Green
    Get-OABvirtualDirectory -server $server | Format-List internalurl, externalurl
    Write-Host "MAPI Virtual Directories"    -Foregroundcolor Green
    get-mapivirtualdirectory -server $server | Format-List internalurl, externalurl
}
