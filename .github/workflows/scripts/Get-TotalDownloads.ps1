# Must be run using powershell 5.1 on a windows system that supports .net methods.
# Can this be done with a github workflow?


Function Get-TotalDownloads {
    <#
     .Description
     Gets a count of module installs from Powershell Gallery                                                                                                                                                                                    #>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    [CmdletBinding()]                                                                                                                                                                                                                          [Alias('gec')]
    param (
    )

    $WebResponse = Invoke-WebRequest "https://www.powershellgallery.com/profiles/TaylorLee"
    $GetTag = $WebResponse.AllElements | Where-Object { $_.TagName -eq "h2" }
    $FindText = $GetTag | Where-Object { $_.outertext -like "*total*" }
    $Write = $FindText.outertext -replace ("Total downloads of packages", '')
    $total = $write.trim()
    $date = Get-Date -Format yyyy-MM-dd
    Write-Output "##### [$total downloads as of $date](https://www.powershellgallery.com/profiles/TaylorLee)"
}

#$old = [string](Get-Content .\readme.md | Select-String "downloads as of ")
#$new = get-totaldownloads
#$content = [System.IO.File]::ReadAllText(".\readme.md").Replace("$old", "$new")
#[System.IO.File]::WriteAllText(".\readme.md", $content)
