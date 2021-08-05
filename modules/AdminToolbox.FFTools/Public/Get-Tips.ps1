function Get-Tips {
    <#
    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    #Load Tips File
    $tipspath = $PSScriptRoot + "\support\ffmpeg tips.txt"
    Get-Content $tipspath
}