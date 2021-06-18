Function Install-PSPortableLight {

    <#
    .DESCRIPTION
    A smaller version of PSPortable that contains less packaged modules. Downloads and Deploys a portable PowerShell 7 package, an included custom profile, and multiple useful modules. Used by the developer of the Admintoolbox modules as a repeatable Powershell environment with little effort.

    .EXAMPLE
    Downloads the PSPortableLight package, unzips it to programdata, and launces it.

    Install-PSPortableLight

    .LINK
    Install-PSPortable
    #>

    [CmdletBinding()]
    [Alias("PSPortableLight", "PSPL")]
    param (
    )

    try {
        #Remove old package
        if (Test-Path $env:ProgramData\PS7x64Light) {
            Remove-Item $env:ProgramData\PS7x64Light -Recurse -Force
        }

        #Download new package as zip
        Write-Host "[*] Downloading PSPortableLight Package" -ForegroundColor Yellow
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $url = "https://github.com/TheTaylorLee/PSPortableLight/archive/main.zip"
        $output = "$env:ProgramData\PS7x64Light.zip"
        $wc = New-Object System.Net.WebClient
        $wc.DownloadFile($url, $output)
        Write-Host "[+] PSPortableLight Package Download Complete" -ForegroundColor Green


        #Unzip to path download package
        Write-Host "[*] Unzipping PSPortableLight Package" -ForegroundColor Yellow
        Invoke-Unzip -zipfile "$env:ProgramData\PS7x64Light.zip" -outpath "$env:ProgramData"
        Rename-Item "$env:ProgramData\PSPortableLight-Main" "$env:ProgramData\PS7x64Light"
        Write-Host "[+] PSPortableLight Package unzipped to path $env:ProgramData\PS7x64Light" -ForegroundColor Green
        try {
            Remove-Item "$env:ProgramData\PS7x64Light.zip" -Force
        }
        catch {
        }
        Write-Host "[+] PSPortableLight Package zip file deleted" -ForegroundColor Green

        #Pin shortcut to taskbar
        Invoke-Item "$env:ProgramData\PS7x64Light\PS7-x64\pwsh.exe.lnk"
        Write-Host "[+] PSPortableLight Package launched" -ForegroundColor Green
        Write-Host " "

        Function Show-Statement {
            Write-Host "
    ***************************************************
    *                                                 *
    *" -ForegroundColor Green -NoNewline
            Write-Host "  Pin the open PSPortable window to the Taskbar" -ForegroundColor Yellow -NoNewline
            Write-Host "  *
    *                                                 *
    ***************************************************
    " -ForegroundColor Green
        }; Show-Statement
    }
    catch {
        $_.Exception.Message
    }
}