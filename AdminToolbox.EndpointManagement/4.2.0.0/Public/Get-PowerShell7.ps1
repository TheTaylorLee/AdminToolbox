function Get-PowerShell7 {
    <#
    .DESCRIPTION
    Install Powershell 7

    .Link
    https://aka.ms/install-powershell.ps1

    #>
    [CmdletBinding()]
    param (
    )
    #Check for Admin Privleges
    Get-Elevation

    Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Preview"
}