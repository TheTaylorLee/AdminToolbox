#Loop through subscriptions and run commands against all.
$Subscriptions = Get-AzSubscription
foreach ($sub in $Subscriptions) {
    Get-AzSubscription -SubscriptionName $sub.Name | Set-AzContext
    #Put commands to do things here
}