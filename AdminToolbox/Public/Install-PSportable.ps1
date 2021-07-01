Function Install-PSPortable {

    <#
    .DESCRIPTION
    Downloads and Deploys a portable PowerShell 7 package, an included custom profile, and multiple useful modules. Used by the developer of the Admintoolbox modules as a repeatable Powershell environment with little effort.

    .EXAMPLE
    Downloads the PSPortable package, unzips it to programdata, and launces it.

    Install-PSPortable

    .LINK
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    [CmdletBinding()]
    [Alias("PSPortable", "PSP")]
    param (
    )

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (Invoke-WebRequest https://raw.githubusercontent.com/TheTaylorLee/PSPortable/master/Deploy-PSPortable.ps1 -UseBasicParsing).content | Invoke-Expression

}