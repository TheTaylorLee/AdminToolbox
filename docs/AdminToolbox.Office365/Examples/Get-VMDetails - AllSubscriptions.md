This allows looping through all subscriptions, pulling vm details, and exporting results to Excel.

```Powershell
#requires -version 5.1
Install-Module Admintoolbox
Install-Module AZ
Install-Module ImportExcel
Connect-AzAccount


#Loop through subscriptions and run commands against all.
$Subscriptions = Get-AzSubscription | Sort-Object Name
foreach ($sub in $Subscriptions) {
    Get-AzSubscription -SubscriptionName $sub.Name | Set-AzContext
    Get-VMDetails |
    Sort-Object VMName |
    Select-Object VMName, ipaddress, NetworkSecurityGroup, ResourceGroup, Location, VMSize |
    Export-Excel $env:USERPROFILE\downloads\AzureVMs.xlsx -Append -WorksheetName $sub.Name -TableName $sub.name -FreezeTopRow -AutoSize
}
```