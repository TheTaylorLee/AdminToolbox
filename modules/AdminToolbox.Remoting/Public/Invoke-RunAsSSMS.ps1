<#
    .Synopsis
    Chosen credentials will be passed to remote SQL server when windows authentication is chosen. This allows connecting to a SQL server using windows authentication when you are not on that domain.

    .Parameter Account
    Specify the account that should be used for the SQL server you will be connecting to.

    .Parameter SSMSPath
    Specify the Full UNC path to SQL Server Studio Managers ssms.exe. SSMSPath is only required on the first run of this function and then a user environment variable is set for persistence.

    .Example
    Invoke-RunAsSSMS -account domain\account -SSMSPath "C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe"

    This example will run SQL Server Studio Manager with the remote credentials specified and set the needed path variable.

    .Example
    Invoke-RunAsSSMS -account domain\account

    This example will run SQL Server Studio Manager with the remote credentials specified

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Invoke-RunAsSSMS {

    [CmdletBinding()]
    param(
        # The query to send to WHOIS servers
        [Parameter(Mandatory = $true)]$account,
        [Parameter(Mandatory = $false)]$SSMSPath
    )



    if ($SSMSPath) {
        #Apply Environment variable to the current session so a console restart isn't required
        $env:SSMSPath = $SSMSPath

        #Set Persistent Environment Variables
        [Environment]::SetEnvironmentVariable("SSMSPath", "$SSMSPath", "User")
    }

    if ($env:SSMSPath) {
        if (Test-Path $env:SSMSPath) {
            runas.exe /netonly /user:$account $env:SSMSPath
        }
        else {
            Write-Warning "It appears that the existing environment path for $env:SSMSPath could not be validated. Run this function again and specify the file path for Sql Server Studio Manager ssms.exe using the SSMSPath Parameter"
        }
    }
    else {
        Write-Warning "The path for the Sql Server Studio Manager ssms.exe is not known. Run this function again using the SSMSPath Parameter"
    }
}