<#
    .SYNOPSIS
    Converts between Base64 and plain text strings.

    .DESCRIPTION
    This function provides bi-directional conversion between Base64 encoded strings and plain text.
    It can either decode a Base64 string to plain text or encode a plain text string to Base64.

    .PARAMETER Base64
    The Base64 encoded string to decode into plain text.

    .PARAMETER Plainstring
    The plain text string to encode into Base64.

    .EXAMPLE
    Convert-Base64 -Base64 "SGVsbG8gV29ybGQ="
    Decodes the Base64 string to: "Hello World"

    .EXAMPLE
    Convert-Base64 -Plainstring "Hello World"
    Encodes the plain text to Base64: "SGVsbG8gV29ybGQ="

    .OUTPUTS
    System.String
    Returns either a decoded plain text string or an encoded Base64 string.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Convert-Base64 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Base64')]
        [string]$Base64,
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'Plainstring')]
        [string]$Plainstring
    )

    process {
        if ($base64) {
            try {
                $bytes = [System.Convert]::FromBase64String($Base64)
                $decodedText = [System.Text.Encoding]::UTF8.GetString($bytes)
                Write-Output $decodedText
            }
            catch {
                Write-Error "Failed to decode Base64 string: $_"
            }
        }

        if ($Plainstring) {
            try {
                $bytes = [System.Text.Encoding]::UTF8.GetBytes($Plainstring)
                $encodedText = [System.Convert]::ToBase64String($bytes)
                Write-Output $encodedText
            }
            catch {
                Write-Error "Failed to encode string to Base64: $_"
            }
        }
    }
}