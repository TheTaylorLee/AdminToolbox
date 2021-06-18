function Remove-PrintQueue {

    <#
    .DESCRIPTION
    This command clears print queues for all printers
    #>

    [CmdletBinding(SupportsShouldProcess)]
    param (
    )

    $printers = Get-Printer
    foreach ($printer in $printers) {
        $printjobs = Get-PrintJob -PrinterObject $printer
        foreach ($printjob in $printjobs) {
            Remove-PrintJob -InputObject $printjob
        }
    }
}