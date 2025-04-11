<#
    .SYNOPSIS
    Configures and enables BitLocker encryption on system and data drives.

    .DESCRIPTION
    This function applies security policies to ensure BitLocker can be enabled, bypassing default Windows security controls.
    It enables BitLocker encryption using TPM and a recovery password on system and data drives, and enables auto-unlock for data drives.
    If the system is Azure AD joined, recovery keys are backed up to Azure. Otherwise, it is recommended to back up recovery keys manually.

    .PARAMETER quiet
    Suppresses warnings and prompts, running the function in a non-interactive mode.

    .EXAMPLE
    Invoke-BitlockerSetup
    Prompts the user for confirmation and configures BitLocker on eligible drives.

    .EXAMPLE
    Invoke-BitlockerSetup -quiet
    Runs the function without prompts or warnings, enabling BitLocker on eligible drives.

    .NOTES
    Ensure you review the function's code and test it in a non-production environment before use.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Invoke-BitlockerSetup {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)][switch]$quiet
    )

    if ($quiet -ne $true) {
        Write-Output " "
        Write-Warning "This function is opinionated in how it works. This warning should be read in its entirety before proceeding."
        Write-Output " "
        Write-Output "This Function will apply security policies that ensure bitlocker can be enabled regardless of windows default security controls blocking it from being enabled. It will attempt enabling bitlocker encryption using tpm and a recovery password on system and data drives, and enable autounlock of those drives on system boot. If Azure AD joined it will backup the recovery passwords to Azure, otherwise it is recommended to backup the output of the Get-BitlockerRecovery function to ensure you have a copy of the recovery keys."
        Write-Output " "
        Write-Warning "You should review the functions code to understand the changes made and only run in a test environment first."
        Write-Output " "
        [boolean]$getconfirm = Read-Host "Do you want to continue? (Y/N)"
    }

    if ($getconfirm -eq "Y" -or $quiet -eq $true) {
        # Configure Bitlocker GPO keys to force allow the use of a recovery password
        ## Allows Data Recovery
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v FDVRecovery /t REG_DWORD /d 00000001 /f
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v OSRecovery /t REG_DWORD /d 00000001 /f
        ## Allows Data recovery agent
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v FDVManageDRA /t REG_DWORD /d 00000001 /f
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v OSManageDRA /t REG_DWORD /d 00000001 /f
        ## Allows 48 digit recover
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v OSRecoveryPassword /t REG_DWORD /d 00000002 /f
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v FDVRecoveryPassword /t REG_DWORD /d 00000002 /f
        ## Allow 256 bit recovery key
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v OSRecoveryKey /t REG_DWORD /d 00000002 /f
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v FDVRecoveryKey /t REG_DWORD /d 00000002 /f
        ## Do not require AD backup to encrypt
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v OSRequireActiveDirectoryBackup /t REG_DWORD /d 0000000 /f
        reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\FVE /v FDVRequireActiveDirectoryBackup /t REG_DWORD /d 00000000 /f

        # Enable Bitlocker on OS drive
        if ((Get-Tpm).tpmpresent -eq $true) {
            $decryptedvolumes = Get-BitLockerVolume | Where-Object { ($_.volumestatus -eq "fullydecrypted" -and $_.volumetype -eq "operatingsystem") -or ($_.volumestatus -eq "fullyencrypted" -and $_.protectionstatus -eq "off" -and $_.volumetype -eq "operatingsystem") }
            foreach ($mount in $decryptedvolumes) {
                $mountpoint = $mount.mountpoint
                # Attempts to add the mountpoint to the tpm if not already present. Will fail if not the SystemDrive.
                manage-bde -protectors -add $mountpoint -tpm
                # Attempts to encrypt the drive and create a recovery password if tpm encrypt fails. Will fail if it already exists or if group policy gets in the way.
                manage-bde -on $mountpoint -rp -skiphardwaretest
                # If TPM protection occurred, but a recoverypassword is not applied this will add it.
                manage-bde -protectors -add $mountpoint -recoverypassword

                # Attempt to backup recoverykeys to Azure
                $protectorids = (Get-BitLockerVolume -mountpoint $mount.mountpoint).keyprotector.keyprotectorid
                foreach ($protid in $protectorids) {
                    BackupToAAD-BitLockerKeyProtector -mountpoint $mountpoint -keyprotectorid "$protid" -ErrorAction SilentlyContinue
                }
            }
        }

        # Enable Bitlocker on Data Drives
        $decryptedvolumes = Get-BitLockerVolume | Where-Object { ($_.volumestatus -eq "fullydecrypted" -and $_.volumetype -eq "Data") -or ($_.volumestatus -eq "fullyencrypted" -and $_.protectionstatus -eq "off" -and $_.volumetype -eq "Data") }
        foreach ($mount in $decryptedvolumes) {
            $mountpoint = $mount.mountpoint
            # Attempts to encrypt the drive and create a recovery password. Will fail if it already exists or if group policy gets in the way.
            manage-bde -on $mountpoint -rp -skiphardwaretest
            # If the recovery password already exists then it skips that step and will use what existing keyprotector exists if any.
            manage-bde -on $mountpoint -skiphardwaretest

            # Attempt to backup recoverykeys to Azure
            $protectorids = (Get-BitLockerVolume -mountpoint $mount.mountpoint).keyprotector.keyprotectorid
            foreach ($protid in $protectorids) {
                BackupToAAD-BitLockerKeyProtector -mountpoint $mountpoint -keyprotectorid "$protid" -ErrorAction SilentlyContinue
            }
        }


        #Enable Autounlock for non-system drives
        $autounlock = Get-BitLockerVolume | Where-Object { $_.volumestatus -ne "FullyDecrypted" }
        foreach ($volume in $autounlock) {
            Enable-BitLockerAutoUnlock -MountPoint $volume -ErrorAction SilentlyContinue
        }
    }

    if ($quiet -eq $true) {
        Get-BitlockerRecovery
    }

    $quiet = $null
    $getconfirm = $null
}