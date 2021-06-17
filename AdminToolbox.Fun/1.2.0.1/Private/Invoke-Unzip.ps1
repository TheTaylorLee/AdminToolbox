function Invoke-Unzip {
    <#
    .DESCRIPTION
    Provides robust zip file extraction by attempting 3 possible methods.

    .Parameter zipfile
    Specify the zipfile location and name

    .Parameter outpath
    Specify the extract path for extracted files

    .EXAMPLE
    Extracts folder.zip to c:\folder

    Invoke-Unzip -zipfile c:\folder.zip -outpath c:\folder

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
    #>

    [cmdletbinding()]
    param(
        [string]$zipfile,
        [string]$outpath
    )

    if (Get-Command expand-archive -ErrorAction silentlycontinue) {
        $ErrorActionPreference = 'SilentlyContinue'
        Expand-Archive -Path $zipfile -DestinationPath $outpath
        $ErrorActionPreference = 'Continue'
    }



    else {
        try {
            #Allows for unzipping folders in older versions of powershell if .net 4.5 or newer exists
            Add-Type -AssemblyName System.IO.Compression.FileSystem
            [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
        }

        catch {
            #If .net 4.5 or newer not present, com classes are used. This process is slower.
            [void] (New-Item -Path $outpath -ItemType Directory -Force)
            $Shell = New-Object -com Shell.Application
            $Shell.Namespace($outpath).copyhere($Shell.NameSpace($zipfile).Items(), 4)
        }
    }
}