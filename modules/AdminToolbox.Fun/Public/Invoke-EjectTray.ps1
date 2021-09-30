<#
    .SYNOPSIS
    This script helps in ejecting or closing the CD/DVD Drive

    .DESCRIPTION
    This script helps in ejecting or closing the CD/DVD Drive

    .PARAMETER  Eject
    Ejects the CD/DVD Drive

    .PARAMETER  Close
    Closes the CD/DVD Drive

    .EXAMPLE
    Invoke-EjectTray -Eject

    Ejects the CD Drive

    .EXAMPLE
    Invoke-EjectTray -Close

    Closes the CD Drive

    .EXAMPLE
    Invoke-Command -Computername CoWorkerPC -Scriptblock {Import-Module Admintoolbox -force; Invoke-EjectTray -Eject}

    Closes the CD Drive on another PC

    .Notes
    Author : Sitaram Pamarthi
    WebSite: http://techibee.com
#>

Function Invoke-EjectTray {

    [CmdletBinding()]
    param(
        [switch]$Eject,
        [switch]$Close
    )
    try {
        $Diskmaster = New-Object -ComObject IMAPI2.MsftDiscMaster2
        $DiskRecorder = New-Object -ComObject IMAPI2.MsftDiscRecorder2
        $DiskRecorder.InitializeDiscRecorder($DiskMaster)
        if ($Eject) {
            $DiskRecorder.EjectMedia()
        }
        elseif ($Close) {
            $DiskRecorder.EjectMedia()
        }
    }
    catch {
        Write-Error "Failed to operate the disk. Details : $_"
    }
}