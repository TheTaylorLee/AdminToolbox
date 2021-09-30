<#
    .Description
    Creates a spreadsheet of printer information for change log tracking. The excel spreadsheet is saved to the local desktop.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>
Function Get-PrintBackup {

    Import-Module ImportExcel

    if (Get-Module ImportExcel) {

    }

    else {
        Install-Module importexcel -Force
    }

    Set-Location $env:USERPROFILE\desktop

    Get-PrinterPort |
    Select-Object * |
    Export-Excel -WorksheetName Ports -Path .\printers.xlsx -FreezeTopRow -TableName Ports -AutoSize

    Get-PrinterDriver |
    Select-Object * |
    Export-Excel -WorksheetName Drivers -Path .\printers.xlsx -FreezeTopRow -TableName Drivers -AutoSize

    Get-Printer |
    Select-Object * |
    Export-Excel -WorksheetName Printers -Path .\printers.xlsx -FreezeTopRow -TableName printers -AutoSize

    Get-Printer |
    Get-PrintConfiguration |
    Select-Object * |
    Export-Excel -WorksheetName PrintConfiguration -Path .\printers.xlsx -FreezeTopRow -TableName PrintConfiguration

    Start-Process $env:USERPROFILE\desktop\printers.xlsx
}