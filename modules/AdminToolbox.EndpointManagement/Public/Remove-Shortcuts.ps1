<#
    .DESCRIPTION
    Removes desktop shortcuts

    .EXAMPLE
    Remove-Shortcuts

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Remove-Shortcuts {

    [CmdletBinding()]
    param (
        [parameter(Mandatory = $false)]$MyDesktopOnly
    )

    #Check for Admin Privleges
    Get-Elevation

    Write-Host 'Deleting desktop icons...' -ForegroundColor Green
    if ($MyDesktopOnly) {
        Remove-Item C:\Users\$env:USERNAME\Desktop\*.lnk -Force -Verbose
    }

    else {
        Remove-Item C:\Users\$env:USERNAME\Desktop\*.lnk -Force -Verbose
        Remove-Item C:\Users\public\Desktop\*.lnk -Force -Verbose
    }
}