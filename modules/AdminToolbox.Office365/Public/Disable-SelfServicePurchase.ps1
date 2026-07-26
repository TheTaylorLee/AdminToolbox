<#
    .DESCRIPTION
    Disables self-service purchase for all or selected products using MSCommerce.

    .EXAMPLE
    Disable-SelfServicePurchase

    .Notes
    Requires MSCommerce module and appropriate permissions.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Disable-SelfServicePurchase {

    [CmdletBinding()]
    param (
    )

    try {
        $test = Get-MSCommercePolicies
        $test = $null
        $test
    }
    catch {
        $test = $null
        if ($host.version -gt 5.1) {
            Import-Module MSCommerce -UseWindowsPowerShell -Force
            Connect-MSCommerce
        }
        else {
            Connect-MSCommerce
        }
    }

    $products = Get-MSCommerceProductPolicies -PolicyId AllowSelfServicePurchase | Out-GridView -PassThru -Title "Select Products to Disable Self-Service Purchase"

    foreach ($product in $products) {
        Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId $product.ProductId -Value "Disabled"
    }
}