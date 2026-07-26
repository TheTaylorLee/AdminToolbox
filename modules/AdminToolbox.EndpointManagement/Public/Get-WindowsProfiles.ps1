<#
    .DESCRIPTION
    Retrieves Windows user profiles from one or more computers.

    .Parameter ComputerName
    The name of the computer(s) to query for user profiles.

    .EXAMPLE
    get-windowsprofiles -ComputerName "COMPUTER01"

    .Notes
    Returns profile details including type, path, and status.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox

    Sourced from Sitaram Pamarthi shared script:
    https://4sysops.com/archives/remotely-query-user-profile-information-with-powershell/#:~:text=Querying%20using%20the%20Win32_UserProfile%20class%20will%20return%20a,the%20profile%20belongs%20and%20the%20type%20of%20profile.
#>

function get-windowsprofiles {
    [cmdletbinding()]
    param (
        [parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string[]]$ComputerName = $env:computername
    )

    foreach ($Computer in $ComputerName) {
        $Profiles = Get-WmiObject -Class Win32_UserProfile -Computer $Computer -ea 0
        foreach ($prof in $profiles) {
            try {
                $objSID = New-Object System.Security.Principal.SecurityIdentifier($prof.sid)
                $objuser = $objsid.Translate([System.Security.Principal.NTAccount])
                $objusername = $objuser.value
            }
            catch {
                $objusername = $prof.sid
            }
            switch ($prof.status) {
                1 { $profileType = "Temporary" }
                2 { $profileType = "Roaming" }
                4 { $profileType = "Mandatory" }
                8 { $profileType = "Corrupted" }
                default { $profileType = "LOCAL" }
            }
            #$User = $objUser.Value
            #$ProfileLastUseTime = ([WMI]"").Converttodatetime($prof.lastusetime)
            $OutputObj = New-Object -TypeName PSobject
            $OutputObj | Add-Member -MemberType NoteProperty -Name ComputerName -Value $Computer.toUpper()
            $OutputObj | Add-Member -MemberType NoteProperty -Name ProfileName -Value $objusername
            $OutputObj | Add-Member -MemberType NoteProperty -Name ProfilePath -Value $prof.localpath
            $OutputObj | Add-Member -MemberType NoteProperty -Name ProfileType -Value $ProfileType
            $OutputObj | Add-Member -MemberType NoteProperty -Name IsinUse -Value $prof.loaded
            $OutputObj | Add-Member -MemberType NoteProperty -Name IsSystemAccount -Value $prof.special
            $OutputObj

        }
    }
}