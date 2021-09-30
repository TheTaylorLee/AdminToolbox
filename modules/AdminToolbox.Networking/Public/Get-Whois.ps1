<#
    .Synopsis
    Does a raw WHOIS query and returns the results

    .Example
    Get-Whois poshcode.org

    The simplest whois search
    .Example
    Get-Whois poshcode.com

    This example is one that forwards to a second whois server ...

    .Example
    Get-Whois poshcode.com -NoForward

    Returns the partial results you get when you don't follow forwarding to a new whois server

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-WhoIs {

    [CmdletBinding()]
    param(
        # The query to send to WHOIS servers
        [Parameter(Position = 0, ValueFromRemainingArguments = $true)]
        [string]$query,

        # A specific whois server to search
        [string]$server,

        # Disable forwarding to new whois servers
        [switch]$NoForward
    )
    end {
        $TLDs = DATA {
            @{
                ".br.com" = "whois.centralnic.net"
                ".cn.com" = "whois.centralnic.net"
                ".eu.org" = "whois.eu.org"
                ".com"    = "whois.crsnic.net"
                ".net"    = "whois.crsnic.net"
                ".org"    = "whois.publicinterestregistry.net"
                ".edu"    = "whois.educause.net"
                ".gov"    = "whois.nic.gov"
            }
        }

        $EAP, $ErrorActionPreference = $ErrorActionPreference, "Stop"

        $query = $query.Trim()

        if ($query -match "(?:\d{1,3}\.){3}\d{1,3}") {
            Write-Verbose "IP Lookup!"
            if ($query -notmatch " ") {
                $query = "n $query"
            }
            if (!$server) { $server = "whois.arin.net" }
        }
        elseif (!$server) {
            $server = $TLDs.GetEnumerator() |
            Where-Object { $query -like ("*" + $_.name) } |
            Select-Object -Expand Value -First 1
        }

        if (!$server) { $server = "whois.arin.net" }
        $maxRequery = 3

        do {
            Write-Verbose "Connecting to $server"
            $client = New-Object System.Net.Sockets.TcpClient $server, 43

            try {
                $stream = $client.GetStream()

                Write-Verbose "Sending Query: $query"
                $data = [System.Text.Encoding]::Ascii.GetBytes( $query + "`r`n" )
                $stream.Write($data, 0, $data.Length)

                Write-Verbose "Reading Response:"
                $reader = New-Object System.IO.StreamReader $stream, [System.Text.Encoding]::ASCII

                $result = $reader.ReadToEnd()

                if ($result -match "(?s)Whois Server:\s*(\S+)\s*") {
                    Write-Warning "Recommended WHOIS server: ${server}"
                    if (!$NoForward) {
                        Write-Verbose "Non-Authoritative Results:`n${result}"
                        # cache, in case we can't get an answer at the forwarder
                        if (!$cachedResult) {
                            $cachedResult = $result
                            $cachedServer = $server
                        }
                        $server = $matches[1]
                        $query = ($query -split " ")[-1]
                        $maxRequery--
                    }
                    else { $maxRequery = 0 }
                }
                else { $maxRequery = 0 }
            }
            finally {
                if ($stream) {
                    $stream.Close()
                    $stream.Dispose()
                }
            }
        } while ($maxRequery -gt 0)

        $result

        if ($cachedResult -and ($result -split "`n").count -lt 5) {
            Write-Warning "Original Result from ${cachedServer}:"
            $cachedResult
        }

        $ErrorActionPreference = $EAP
    }
}