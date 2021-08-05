function Update-PowerCLIConfiguration {
    <#
    .DESCRIPTION
    Updates the PowerCLI Configuration to ignore certificate warnings and to not participate in the Customer Experience Program.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    #IgnoreCertificate
    Set-PowerCLIConfiguration -Scope User -InvalidCertificateAction Ignore -Confirm:$false

    #Don't participate in the customer experience program
    Set-PowerCLIConfiguration -Scope User -ParticipateInCeip $false
}