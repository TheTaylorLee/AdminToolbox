<#
    .DESCRIPTION
    Parse Logs 4740 and 4776 on the PDCEmulator for workstations causing a lockout. Null lockout location events are filtered. Best if run shortly after a lockout.

    .Parameter Identity
    Account that is being searched for lockout events

    .EXAMPLE
    Get-DCLockoutEvents -identity Joe

    .Notes
    Requires The Active Directory Module

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-DCLockoutEvents {

    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $True)]
        [String]$Identity
    )

    #Getting the PDCEmulator
    $DomainControllers = Get-ADDomainController -Filter *
    $PDCEmulator = ($DomainControllers | Where-Object { $_.OperationMasterRoles -contains "PDCEmulator" })

    #Parsing Event Log 4740
    Write-Host "Querying event id 4740 on $PDCEmulator." -BackgroundColor Black -ForegroundColor Yellow
    $PDCEmulator | ForEach-Object {
        Get-WinEvent -ComputerName $_ -FilterHashtable @{LogName = 'Security'; Id = 4740 } |
        Where-Object { ($_.Properties[1].Value -notlike $null -and $_.Properties[0].Value -eq $Identity) } |
        Select-Object -Property @(
            @{Label = 'User'; Expression = { $_.Properties[0].Value } }
            @{Label = 'LockedOutLocation'; Expression = { $_.Properties[1].Value } }
            @{Label = 'LockedOutTimeStamp'; Expression = { $_.TimeCreated } }
            @{Label = 'DomainController'; Expression = { $_.MachineName } }
            @{Label = 'EventId'; Expression = { $_.Id } }
        ) |
        Format-Table
    }#endforeach

    #Parsing Event Log 4776
    Write-Host "Querying event id 4776 on $PDCEmulator; this will take awhile. Use ctrl+c to end at any time." -BackgroundColor Black -ForegroundColor Yellow
    $PDCEmulator | ForEach-Object {
        Get-WinEvent -ComputerName $_ -FilterHashtable @{LogName = 'Security'; Id = 4776 } |
        Where-Object { ($_.Properties[2].Value -notlike $null -and $_.Properties[1].Value -eq $Identity -and $_.KeywordsDisplayNames -contains "Audit Failure") } |
        Select-Object -Property @(
            @{Label = 'User'; Expression = { $_.Properties[1].Value } }
            @{Label = 'BadPasswordLocation'; Expression = { $_.Properties[2].Value } }
            @{Label = 'BadPasswordAttemptTime'; Expression = { $_.TimeCreated } }
            @{Label = 'DomainController'; Expression = { $_.MachineName } }
            @{Label = 'EventID'; Expression = { $_.ID } }
        ) |
        Format-Table
    }#endforeach
}#endfunction