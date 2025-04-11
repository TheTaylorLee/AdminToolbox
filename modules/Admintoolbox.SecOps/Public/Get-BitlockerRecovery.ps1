<#
    .SYNOPSIS
    Retrieves detailed BitLocker recovery information for all volumes.

    .DESCRIPTION
    The Get-BitlockerRecovery function retrieves detailed information about BitLocker-protected volumes,
    including recovery passwords, key protector types, and other related details.

    .EXAMPLE
    Get-BitlockerRecovery

    This command retrieves and displays detailed BitLocker recovery information for all volumes.

    .OUTPUTS
    System.Management.Automation.PSCustomObject
    The function outputs a custom object containing detailed BitLocker recovery information for each volume.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-BitlockerRecovery {
    # Output full detailed keyprotect information for each mountpoint
    $BitlockerVolumes = Get-BitLockerVolume
    foreach ($volume in $BitlockerVolumes) {
        $keyprotector = ($volume.KeyProtector)
        foreach ($protector in $keyprotector) {
            [pscustomobject]@{
                MountPoint          = $volume.Mountpoint
                VolumeStatus        = $volume.volumestatus
                KeyprotectorId      = $protector.keyprotectorid
                AutoUnlockProtector = $protector.autounlockprotector
                KeyProtectorType    = $protector.KeyProtectorType
                KeyFileName         = $protector.KeyFileName
                RecoveryPassword    = $protector.RecoveryPassword
                KeyCertificateType  = $protector.keycertificatetype
                Thumbprint          = $protector.thumbprint
            }
        }
    }
}