<#
    .SYNOPSIS
        Converts a plain text string to a Base64 encoded string.

    .DESCRIPTION
        The Convert-StringtoBase64 function takes a plain text string input and converts it to a Base64 encoded string using UTF-8 encoding.

    .PARAMETER InputString
        The plain text string to be converted to Base64.

    .EXAMPLE
        Convert-StringtoBase64 "Hello World"
        SGVsbG8gV29ybGQ=

    .EXAMPLE
        "Test String" | Convert-StringtoBase64
        VGVzdCBTdHJpbmc=

    .INPUTS
        System.String
        You can pipe a string value to Convert-StringtoBase64.

    .OUTPUTS
        System.String
        Returns the Base64 encoded string.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Convert-StringtoBase64 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$InputString
    )

    process {
        try {
            $bytes = [System.Text.Encoding]::UTF8.GetBytes($InputString)
            $encodedText = [System.Convert]::ToBase64String($bytes)
            Write-Output $encodedText
        }
        catch {
            Write-Error "Failed to encode string to Base64: $_"
        }
    }
}
