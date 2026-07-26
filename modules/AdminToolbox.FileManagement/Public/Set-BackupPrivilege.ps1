<#
    .DESCRIPTION
    Enables or disables the SeBackupPrivilege for the current process.

    SeBackupPrivilege allows file content retrieval, even if the security descriptor on the file might not grant such access. A caller with SeBackupPrivilege enabled obviates the need for any ACL-based security check.

    .Parameter Enable
    Specifies whether to enable ($true) or disable ($false) the SeBackupPrivilege.

    .EXAMPLE
    Set-BackupPrivilege -Enable $true

    .Notes
    Requires administrative privileges.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Set-BackupPrivilege {
    param (
        [Parameter(Mandatory = $true)]
        [bool]$Enable
    )

    begin {
        get-elevation
        Add-Type @"
using System;
using System.Runtime.InteropServices;
public class BackupPriv {
    [DllImport("advapi32.dll", SetLastError = true)]
    public static extern bool AdjustTokenPrivileges(IntPtr TokenHandle, bool DisableAll, ref TOKEN_PRIVILEGES NewState, uint BufferLength, ref TOKEN_PRIVILEGES PreviousState, out uint ReturnLength);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetCurrentProcess();
    [DllImport("advapi32.dll", SetLastError = true)]
    public static extern bool OpenProcessToken(IntPtr ProcessHandle, uint DesiredAccess, out IntPtr TokenHandle);
    [DllImport("advapi32.dll", SetLastError = true)]
    public static extern bool LookupPrivilegeValue(string lpSystemName, string lpName, out LUID lpLuid);
    [StructLayout(LayoutKind.Sequential)]
    public struct TOKEN_PRIVILEGES { public uint PrivilegeCount; public LUID Luid; public uint Attributes; }
    [StructLayout(LayoutKind.Sequential)]
    public struct LUID { public uint LowPart; public int HighPart; }
    public const uint TOKEN_ADJUST_PRIVILEGES = 0x20;
    public const uint TOKEN_QUERY = 0x8;
    public const uint SE_PRIVILEGE_ENABLED = 0x2;
    public const uint SE_PRIVILEGE_DISABLED = 0x0;
}
"@
    }
    process {
        $process = [BackupPriv]::GetCurrentProcess()
        $token = [IntPtr]::Zero
        $success = [BackupPriv]::OpenProcessToken($process, [BackupPriv]::TOKEN_ADJUST_PRIVILEGES -bor [BackupPriv]::TOKEN_QUERY, [ref]$token)
        if (-not $success) {
            Write-Error "Failed to open process token. Error: $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error()). SeBackupPrivilege not set."
        }

        $luid = New-Object BackupPriv+LUID
        $success = [BackupPriv]::LookupPrivilegeValue($null, "SeBackupPrivilege", [ref]$luid)
        if (-not $success) {
            Write-Error "Failed to open process token. Error: $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error()). SeBackupPrivilege not set."
        }

        $tp = New-Object BackupPriv+TOKEN_PRIVILEGES
        $tp.PrivilegeCount = 1
        $tp.Luid = $luid
        $tp.Attributes = if ($Enable) { [BackupPriv]::SE_PRIVILEGE_ENABLED } else { [BackupPriv]::SE_PRIVILEGE_DISABLED }

        $prevTp = New-Object BackupPriv+TOKEN_PRIVILEGES
        $returnLength = 0
        $success = [BackupPriv]::AdjustTokenPrivileges($token, $false, [ref]$tp, [System.Runtime.InteropServices.Marshal]::SizeOf($prevTp), [ref]$prevTp, [ref]$returnLength)
        if (-not $success) {
            Write-Error "Failed to open process token. Error: $([System.Runtime.InteropServices.Marshal]::GetLastWin32Error()). SeBackupPrivilege not set."
        }
    }

    end {
    }

}