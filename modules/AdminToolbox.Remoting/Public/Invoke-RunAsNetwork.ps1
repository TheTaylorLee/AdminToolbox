<#
    .Synopsis
    Chosen credentials will be passed by defined application when accessing any remote/network resources. Useful when you are trying to access resources in another domain or workgroup.

    .Parameter Account
    Specify the account that should be used.

    .Parameter ExecutePath
    Specify the path to an executeable or program.

    .Example
    Invoke-RunAsNetwork -account domain\account -ExecutePath mmc.exe

    This example will launch mmc.exe and any remote computers you connect to will authentice using the provided account.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Invoke-RunAsNetwork {

    [CmdletBinding()]
    param(
        # The query to send to WHOIS servers
        [Parameter(Mandatory = $true)]$Account,
        [Parameter(Mandatory = $false)]$ExecutePath
    )

    runas.exe /netonly /user:$Account $ExecutePath
}