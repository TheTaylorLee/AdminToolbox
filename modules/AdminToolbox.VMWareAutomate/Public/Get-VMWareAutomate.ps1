Function Get-VMwareAutomate {

    Get-IntroVAT

    Write-Host " "
    Write-Host "VMWareAutomate Functions"                                                       -Foregroundcolor green
    Write-Host "Enable-ToolsAutoUpgrade        ..Enables AutoUpgrade of VMTools"                -Foregroundcolor cyan
    Write-Host "Enable-DatastoreRoundRobin     ..Enables Round Robin on all datastores"         -Foregroundcolor cyan
    Write-Host "Get-DRBackup                   ..Gets a csv of the VM Enviroment"               -ForegroundColor cyan
    Write-Host "Get-HostMemoryDimms            ..Gets host memory information"                  -Foregroundcolor cyan
    Write-Host "Get-HostSerialNumber           ..Get a host serial number"                      -Foregroundcolor cyan
    Write-Host "Get-ToolsAutoUpgradeState      ..Gets VMtools AutoUpgrade Status"               -Foregroundcolor cyan
    Write-Host "Get-VMFolderPaths              ..Gets VM folder paths report"                   -Foregroundcolor cyan
    Write-Host "Get-VMTools                    ..Gets VMtools Status"                           -Foregroundcolor cyan
    Write-Host "Invoke-HotAdd                  ..Invokes enabling HotAdd CPU or Memory"         -Foregroundcolor cyan
    Write-Host "Invoke-Power                   ..Invokes Power State Changes of Guest or VM"    -Foregroundcolor cyan
    Write-Host "Update-PowerCLIConfiguration   ..Updates the VIServer Connection Settings"      -ForegroundColor cyan
    Write-Host "Update-VMTools                 ..Updates VM tools"                              -Foregroundcolor cyan
    Write-Host " "
}