- If actions are failing do to broken action modules, these scripts can be leveraged to manually publish the module.
- Clone admintoolbox to the downloads directory, launch powershell with -noprofile paste the invoke-publishmodules and new-manifest functions into the console, and then run the below script.
# Do Not Use Powershell 5 it will corrupt the versioning.
```pwsh
set-location $env:userprofile/downloads
git clone https://github.com/TheTaylorLee/AdminToolbox
pwsh -noprofile
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.Networking/AdminToolbox.Networking.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.ActiveDirectory/AdminToolbox.ActiveDirectory.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.EndpointManagement/AdminToolbox.EndpointManagement.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.Exchange/AdminToolbox.Exchange.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.FFTools/AdminToolbox.FFTools.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.FileManagement/AdminToolbox.FileManagement.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.FortiWizard/AdminToolbox.FortiWizard.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.Fun/AdminToolbox.Fun.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.MSGraph/AdminToolbox.MSGraph.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.Office365/AdminToolbox.Office365.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.Remoting/AdminToolbox.Remoting.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/Admintoolbox.SecOps/Admintoolbox.SecOps.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox.VMWareAutomate/AdminToolbox.VMWareAutomate.psd1
import-module $env:userprofile/downloads/admintoolbox/modules/AdminToolbox/AdminToolbox.psd1
Invoke-PublishModules
```
- When done commit the updated manifests to github.
```pwsh
set-location $env:userprofile/downloads/admintoolbox
git commit -am "rel: Manifest update"
git push
```