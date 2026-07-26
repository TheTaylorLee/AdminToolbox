<#
    .Description
    Remove all Printers, printer ports, and print drivers. Function is good for providing a clean printer enviroment when starting over or importing a printer configuration file.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Invoke-PrinterServerRenew {

    Write-Warning "STOP and READ! This function will remove all printers, printer ports, and print drivers."
    Write-Host " "
    $query = Read-Host "Do you wish to proceed (yes/no)"

    if ($query -eq 'yes') {
        $ErrorActionPreference = 'silentlycontinue'
        Restart-Service Spooler -Force
        Get-Printer | Remove-Printer
        Get-PrinterDriver | Remove-PrinterDriver -ErrorAction 'silentlycontinue'
        Get-PrinterPort | Remove-PrinterPort
        $ErrorActionPreference = 'Continue'
        Get-Printer
        Get-PrinterDriver
        Get-PrinterPort
        Write-Warning "Check that all printers, ports, and print drivers were removed. Exception for remaining Printers, ports, and print drivers would be if they belong to the system!"
    }
}