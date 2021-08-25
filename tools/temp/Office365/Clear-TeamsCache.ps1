Function Clear-TeamsCache {

    $query = Read-Host "This function will close teams and require signing back in. Do you wish to continue (yes/no)"
    if ($query -eq 'yes') {
        taskkill /im teams.exe
        Get-ChildItem "C:\Users\taylo\AppData\Roaming\Microsoft\Teams" -Recurse | Remote-Item -force
    }
    else {
        Write-Output "Clear teams cache aborted"
    }

}