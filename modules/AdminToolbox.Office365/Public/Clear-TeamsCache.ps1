Function Clear-TeamsCache {

    <#
    .Description
    This function will clear all teams cache files. This can resolve common issues like images taking a long time to show in Teams.

    .EXAMPLE
    Clear-TeamsCache

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    Write-Warning "This function will close Teams & Outlook, Teams Personalization settings will be lost, and requires signing back into Teams."
    $query = Read-Host "Do you wish to continue (yes/no)"
    if ($query -eq 'yes') {
        taskkill /im teams.exe /f
        taskkill /im outlook.exe /f
        Get-ChildItem "C:\Users\taylo\AppData\Roaming\Microsoft\Teams" -Recurse -Force | Remove-Item -Force -Recurse
    }
    else {
        Write-Output "Clear teams cache aborted"
    }

}