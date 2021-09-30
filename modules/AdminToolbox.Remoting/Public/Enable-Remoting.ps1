<#
    .Description
    This Command will enable PowerShell Remoting on a remote PC.

    .NOTES
    This function requires psexec. If you do not, download it with the sysinternals suite. Add psexec to one of your enviroment variable paths.

    .Parameter Computer
    Computer that PSRemoting is being enabled on

    .Parameter Username
    Username used by PSExec to authenticate with admin privleges

    .Parameter Password
    Password that is associated with the username used

    .EXAMPLE
    Enable-PSRemoting -computer PCName -username domain\username

    This will enable remoting and then prompt for credentials

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Enable-Remoting {

    [CmdletBinding()]

    Param (
        [Parameter(Position = 0, Mandatory = $true)]$Computer,
        [Parameter(Position = 1, Mandatory = $false)]$Username,
        [Parameter(Position = 2, Mandatory = $false)][SecureString]$Password
    )

    #Enabling PSRemoting
    PsExec.exe \\$Computer -s winrm.cmd quickconfig -q
    PsExec.exe \\$Computer -u $Username -p $Password powershell.exe cmd /c "enable-psremoting -force"


    #Testing that PSRemoting is now enabled.
    Write-Host "If an error is presented after this point PSRemoting wasn't enabled" -ForegroundColor Yellow
    Test-WSMan $Computer
}