function Convert-Subnetmask {

    ###############################################################################################################
    # Language     :  PowerShell 4.0
    # Filename     :  Convert-Subnetmask.ps1
    # Author       :  BornToBeRoot (https://github.com/BornToBeRoot)
    # Description  :  Convert a subnetmask to CIDR and vise versa
    # Repository   :  https://github.com/BornToBeRoot/PowerShell
    # License      : This single function is licensed under - GPL-3.0 License
    # Link         : https://github.com/BornToBeRoot/PowerShell/blob/master/Documentation/Function/Convert-Subnetmask.README.md
    ###############################################################################################################

    <#
    .SYNOPSIS
    Convert a subnetmask to CIDR and vise versa

    .DESCRIPTION
    Convert a subnetmask like 255.255.255 to CIDR (/24) and vise versa.

    .EXAMPLE
    Convert-Subnetmask -CIDR 24
    Mask          CIDR
    ----          ----
    255.255.255.0   24

    .EXAMPLE
    Convert-Subnetmask -Mask 255.255.0.0
    Mask        CIDR
    ----        ----
    255.255.0.0   16
    #>
    [CmdLetBinding(DefaultParameterSetName = 'CIDR')]
    param(
        [Parameter(
            ParameterSetName = 'CIDR',
            Position = 0,
            Mandatory = $true,
            HelpMessage = 'CIDR like /24 without "/"')]
        [ValidateRange(0, 32)]
        [Int32]$CIDR,

        [Parameter(
            ParameterSetName = 'Mask',
            Position = 0,
            Mandatory = $true,
            HelpMessage = 'Subnetmask like 255.255.255.0')]
        [ValidateScript( {
                if ($_ -match "^(254|252|248|240|224|192|128).0.0.0$|^255.(254|252|248|240|224|192|128|0).0.0$|^255.255.(254|252|248|240|224|192|128|0).0$|^255.255.255.(255|254|252|248|240|224|192|128|0)$") {
                    return $true
                }
                else {
                    throw "Enter a valid subnetmask (like 255.255.255.0)!"
                }
            })]
        [String]$Mask
    )

    Begin {

    }

    Process {
        switch ($PSCmdlet.ParameterSetName) {
            "CIDR" {
                # Make a string of bits (24 to 11111111111111111111111100000000)
                $CIDR_Bits = ('1' * $CIDR).PadRight(32, "0")

                # Split into groups of 8 bits, convert to Ints, join up into a string
                $Octets = $CIDR_Bits -split '(.{8})' -ne ''
                $Mask = ($Octets | ForEach-Object -Process { [Convert]::ToInt32($_, 2) }) -join '.'
            }

            "Mask" {
                # Convert the numbers into 8 bit blocks, join them all together, count the 1
                $Octets = $Mask.ToString().Split(".") | ForEach-Object -Process { [Convert]::ToString($_, 2) }
                $CIDR_Bits = ($Octets -join "").TrimEnd("0")

                # Count the "1" (111111111111111111111111 --> /24)
                $CIDR = $CIDR_Bits.Length
            }
        }

        [pscustomobject] @{
            Mask = $Mask
            CIDR = $CIDR
        }
    }

    End {

    }
}