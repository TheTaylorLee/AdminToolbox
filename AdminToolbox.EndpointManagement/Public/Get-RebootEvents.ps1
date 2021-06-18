function Get-RebootEvents {
    <#
    .Description
    Returns reboot history for specified Computer or Server

    .Parameter Server
    Specify a remote computer to get info for

    .EXAMPLE
    Get-RebootEvents -Server server.domain.tld
    #>

    [CmdletBinding()]

    #Prompts for Computer Name
    Param (
        [parameter(Mandatory = $false)]$Server
    )


    if ($server) {
        Get-Events -ID 1074 -LogName System -Machine $Server
    }

    else {
        Get-Events -ID 1074 -LogName System
    }
}