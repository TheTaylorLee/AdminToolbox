<#
    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-Tips {

    #Load Tips File
    $tipspath = $env:PSModulePath + "\support\ffmpeg tips.txt"
    Get-Content $tipspath
}