<#
.SYNOPSIS
    Extracts the parent OU path from a distinguished name.
.DESCRIPTION
    This function extracts the parent OU path from a distinguished name.
    The parent OU path is the path to the immediate parent OU of the object.
    The function returns the parent OU path as a string.
.PARAMETER DistinguishedName
    The distinguished name of the object.
.EXAMPLE
    Get-ParentOUPath -DistinguishedName "CN=John Doe,OU=Users,OU=Marketing,OU=New York,DC=contoso,DC=com"
    Returns: "Users/Marketing/New York"
#>

function Get-ParentOUPath {
    param (
        [Parameter(Mandatory = $true)]
        [string]$DistinguishedName
    )

    # Extract all OU parts from the DN
    $OUParts = ($DistinguishedName -split ',') | Where-Object { $_ -like 'OU=*' }

    if ($OUParts.Count -gt 0) {
        # Remove the 'OU=' prefix from each part
        $OUNames = $OUParts | ForEach-Object { $_ -replace 'OU=', '' }

        # Join the OU names to form the path
        return $OUNames -join '/'
    }
    else {
        # No OU parts found
        return $null
    }
}