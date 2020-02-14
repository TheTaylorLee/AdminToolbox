Function Get-PrintBackup {
    <#
    .Description
    Creates a spreadsheet of printer information for change log tracking. The excel spreadsheet is saved to the local desktop.
    #>

    Import-Module ImportExcel

    if (Get-Module ImportExcel) {

    }

    else {
        Install-Module importexcel -Force
    }

    Set-Location $env:USERPROFILE\desktop

    Get-PrinterPort |
    Select-Object * |
    Export-Excel -WorksheetName Ports -path .\printers.xlsx -FreezeTopRow -tablename Ports -autosize

    Get-PrinterDriver |
    Select-Object * |
    Export-Excel -WorksheetName Drivers -path .\printers.xlsx -FreezeTopRow -tablename Drivers -autosize

    Get-Printer |
    Select-Object * |
    Export-Excel -WorksheetName Printers -path .\printers.xlsx -FreezeTopRow -tablename printers -autosize

    Get-Printer |
    Get-PrintConfiguration |
    Select-Object * |
    Export-Excel -WorksheetName PrintConfiguration -path .\printers.xlsx -FreezeTopRow -tablename PrintConfiguration

    Start-Process $env:USERPROFILE\desktop\printers.xlsx
}