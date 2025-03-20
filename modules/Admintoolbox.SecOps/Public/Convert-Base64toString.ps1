<#
    .SYNOPSIS
        Converts a Base64 encoded string to a plain text string.

    .DESCRIPTION
        The Convert-Base64toString function takes a Base64 encoded string input and converts it to a plain text string using UTF-8 encoding.

    .PARAMETER Base64String
        The Base64 encoded string to be converted to plain text.

    .EXAMPLE
        Convert-Base64toString "SGVsbG8gV29ybGQ="
        Hello World

    .EXAMPLE
        "VGVzdCBTdHJpbmc=" | Convert-Base64toString
        Test String

    .INPUTS
        System.String
        You can pipe a Base64 encoded string value to Convert-Base64toString.

    .OUTPUTS
        System.String
        Returns the decoded plain text string.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Convert-Base64toString {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$Base64String
    )

    process {
        try {
            $bytes = [System.Convert]::FromBase64String($Base64String)
            $decodedText = [System.Text.Encoding]::UTF8.GetString($bytes)
            Write-Output $decodedText
        }
        catch {
            Write-Error "Failed to decode Base64 string: $_"
        }
    }
}
