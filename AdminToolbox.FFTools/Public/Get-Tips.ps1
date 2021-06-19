function Get-Tips {
    #Load Tips File
    $tipspath = $PSScriptRoot + "\support\ffmpeg tips.txt"
    Get-Content $tipspath
}