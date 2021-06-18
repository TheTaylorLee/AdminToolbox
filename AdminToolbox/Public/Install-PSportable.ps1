Function Install-PSPortable {

    <#
    .DESCRIPTION
    Downloads and Deploys a portable PowerShell 7 package, an included custom profile, and multiple useful modules. Used by the developer of the Admintoolbox modules as a repeatable Powershell environment with little effort.

    .EXAMPLE
    Downloads the PSPortable package, unzips it to programdata, and launces it.

    Install-PSPortable

    .LINK
    Install-PSPortableLight
    #>

    [CmdletBinding()]
    [Alias("PSPortable", "PSP")]
    param (
    )

    Try {
        #Remove old package
        if (Test-Path $env:ProgramData\PS7x64) {
            Remove-Item $env:ProgramData\PS7x64 -Recurse -Force
        }


        #Download new package as zip file
        Write-Host "[*] Downloading PSPortable Package" -ForegroundColor Yellow
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $url = "https://github.com/thetaylorlee/psportable/archive/master.zip"
        $output = "$env:ProgramData\PS7x64.zip"
        $wc = New-Object System.Net.WebClient
        $wc.DownloadFile($url, $output)
        Write-Host "[+] PSPortable Package Download Complete" -ForegroundColor Green

        #Unzip to path download package
        Write-Host "[*] Unzipping PSPortable Package" -ForegroundColor Yellow
        Invoke-Unzip -zipfile "$env:ProgramData\PS7x64.zip" -outpath "$env:ProgramData"
        Rename-Item "$env:ProgramData\PSPortable-master" "$env:ProgramData\PS7x64"
        Write-Host "[+] PSPortable Package unzipped to path $env:ProgramData\PS7x64" -ForegroundColor Green
        try {
            Remove-Item "$env:ProgramData\PS7x64.zip" -Force -ErrorAction SilentlyContinue
        }
        catch {
        }
        Write-Host "[+] PSPortable Package zip file deleted" -ForegroundColor Green

        #Pin shortcut to taskbar
        Invoke-Item "$env:ProgramData\PS7x64\PS7-x64\pwsh.exe.lnk"
        Write-Host "[+] PSPortable Package launched" -ForegroundColor Green
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
        Write-Host $_.Exception.Message
    }
}