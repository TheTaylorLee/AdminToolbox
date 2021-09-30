<#
    .Description
    Get the relative Download speed for the in use Wan Circuit. Function borrowed from the Speedtest PSGallery Module.

    Author information is: velecky@velecky.onmicrosoft.com

    .Link
    https://www.powershellgallery.com/packages/Speedtest/2.0/Content/Speedtest.ps1
#>

function Start-Speedtest {

    Write-Warning "Please be patient while results are returned"
    Write-Host "This is a rough speedtest dependent on remote servers." -ForegroundColor Green


    Function downloadSpeed($strUploadUrl) {
        $topServerUrlSpilt = $strUploadUrl -split 'upload'
        $url = $topServerUrlSpilt[0] + 'random2000x2000.jpg'
        $col = New-Object System.Collections.Specialized.NameValueCollection
        $wc = New-Object system.net.WebClient
        $wc.QueryString = $col
        $downloadElaspedTime = (Measure-Command { $webpage1 = $wc.DownloadData($url) }).totalmilliseconds
        $downSize = ($webpage1.length + $webpage2.length) / 1Mb
        $downloadSize = [Math]::Round($downSize, 2)
        $downloadTimeSec = $downloadElaspedTime * 0.001
        $downSpeed = ($downloadSize / $downloadTimeSec) * 8
        $downloadSpeed = [Math]::Round($downSpeed, 2)
        return $downloadSpeed
    }

    $objXmlHttp = New-Object -ComObject MSXML2.ServerXMLHTTP
    $objXmlHttp.Open("GET", "http://www.speedtest.net/speedtest-config.php", $False)
    $objXmlHttp.Send()


    [xml]$content = $objXmlHttp.responseText

    $oriLat = $content.settings.client.lat
    $oriLon = $content.settings.client.lon

    #Making another request. This time to get the server list from the site.
    $objXmlHttp1 = New-Object -ComObject MSXML2.ServerXMLHTTP
    $objXmlHttp1.Open("GET", "http://www.speedtest.net/speedtest-servers.php", $False)
    $objXmlHttp1.Send()

    #Retrieving the content of the response.
    [xml]$ServerList = $objXmlHttp1.responseText

    $cons = $ServerList.settings.servers.server

    foreach ($val in $cons) {
        $R = 6371;
        [float]$dlat = ([float]$oriLat - [float]$val.lat) * 3.14 / 180;
        [float]$dlon = ([float]$oriLon - [float]$val.lon) * 3.14 / 180;
        [float]$a = [math]::Sin([float]$dLat / 2) * [math]::Sin([float]$dLat / 2) + [math]::Cos([float]$oriLat * 3.14 / 180 ) * [math]::Cos([float]$val.lat * 3.14 / 180 ) * [math]::Sin([float]$dLon / 2) * [math]::Sin([float]$dLon / 2);
        [float]$c = 2 * [math]::Atan2([math]::Sqrt([float]$a ), [math]::Sqrt(1 - [float]$a));
        [float]$d = [float]$R * [float]$c;

        $ServerInformation +=
        @([pscustomobject]@{Distance = $d; Country = $val.country; Sponsor = $val.sponsor; Url = $val.url })

    }

    $serverinformation = $serverinformation | Sort-Object -Property distance

    $DLResults1 = downloadSpeed($serverinformation[0].url)
    $SpeedResults += @([pscustomobject]@{Speed = $DLResults1; })

    $DLResults2 = downloadSpeed($serverinformation[1].url)
    $SpeedResults += @([pscustomobject]@{Speed = $DLResults2; })

    $DLResults3 = downloadSpeed($serverinformation[2].url)
    $SpeedResults += @([pscustomobject]@{Speed = $DLResults3; })

    $DLResults4 = downloadSpeed($serverinformation[3].url)
    $SpeedResults += @([pscustomobject]@{Speed = $DLResults4; })

    $UnsortedResults = $SpeedResults | Sort-Object -Property speed
    $WanSpeed = $UnsortedResults[3].speed

    Write-Host " "
    Write-Host "Wan Speed is $($Wanspeed) Mbit/Sec" -ForegroundColor Cyan
}