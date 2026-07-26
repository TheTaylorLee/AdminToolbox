<#
    .SYNOPSIS
        Returns memory dimms configuration for esxi

    .DESCRIPTION
        This function utilizes wsman / cim in order to download configuration of memory dims in ESXi.

    .PARAMETER  VMHost
        Specify esxi host for which you want to get the report

    .PARAMETER  rootpw
        Password for user root inside esxi

    .EXAMPLE
    get-HostMemoryDimms -VMHost 'Esxi048.domain.local' -rootpw 'password.123' | ft *
        BankLabel               Manufacturer Description SizeGB MemoryType MemoryDef
        ---------               ------------ ----------- ------ ---------- ---------
        P0_Node0_Channel0_Dimm0 Samsung      P1-DIMMA1       16 24         DDR3
        P0_Node0_Channel0_Dimm1 Samsung      P1-DIMMA2       16 24         DDR3
        P0_Node0_Channel1_Dimm0 Samsung      P1-DIMMB1       16 24         DDR3
        P0_Node0_Channel1_Dimm1 Samsung      P1-DIMMB2       16 24         DDR3
        P0_Node0_Channel2_Dimm0 Samsung      P1-DIMMC1       16 24         DDR3
        P1_Node1_Channel2_Dimm0 Samsung      P2-DIMMG1       16 24         DDR3
        P1_Node1_Channel2_Dimm1 Samsung      P2-DIMMG2       16 24         DDR3
        P1_Node1_Channel3_Dimm0 Samsung      P2-DIMMH1       16 24         DDR3
        P1_Node1_Channel3_Dimm1 Samsung      P2-DIMMH2       16 24         DDR3
                                Winbond                  ...625 11         Flash

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Get-HostMemoryDimms {

    param(
        [Parameter(Mandatory = $true)][String]$VMHost,
        [Parameter(Mandatory = $true)][String]$rootpw
    )

    #MemoryTypes from: https://msdn.microsoft.com/en-us/library/aa394347(v=vs.85).aspx
    $MemHash = @{
        '0'  = 'Unknown';
        '1'  = 'Other';
        '2'  = 'DRAM';
        '3'  = 'Synchronous DRAM';
        '4'  = 'Cache DRAM';
        '5'  = 'EDO';
        '6'  = 'EDRAM';
        '7'  = 'VRAM';
        '8'  = 'SRAM';
        '9'  = 'RAM';
        '10' = 'ROM';
        '11' = 'Flash';
        '12' = 'EEPROM';
        '13' = 'FEPROM';
        '14' = 'EPROM';
        '15' = 'CDRAM';
        '16' = '3DRAM';
        '17' = 'SDRAM';
        '18' = 'SGRAM';
        '19' = 'RDRAM';
        '20' = 'DDR';
        '21' = 'DDR2';
        '22' = 'DDR2 FB-DIMM';
        '23' = 'DDR2 FB-DIMM';
        '24' = 'DDR3';
        '25' = 'FBD2'
    }


    $pass = ConvertTo-SecureString $rootpw -Force
    $cred = New-Object System.Management.Automation.PSCredential ('root', $pass)
    $CIMOpt = New-CimSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck -Encoding Utf8 -UseSsl
    $Session = New-CimSession -Authentication Basic -Credential $cred -ComputerName $VMHost -Port 443 -SessionOption $CIMOpt
    Get-CimInstance -CimSession $Session CIM_PhysicalMemory | Select-Object BankLabel, Manufacturer, Description , @{n = 'SizeGB'; e = { $_.Capacity / 1GB } }, MemoryType, @{n = 'MemoryDef'; e = { $MemHash[$_.MemoryType] } } | Format-Table

}