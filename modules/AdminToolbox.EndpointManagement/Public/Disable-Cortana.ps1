<#
    .Description
    Simply disables Cortana Functionality

    .Notes
    To undo this change delete the following registry key or change the value to 1 \
    'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana'

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

Function Disable-Cortana {

    New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\' -Name 'Windows Search'
    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search' -Name 'AllowCortana' -PropertyType DWORD -Value '0'
}