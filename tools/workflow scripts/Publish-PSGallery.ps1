$API = "FalseAPI"

#Publish Module .ActiveDirectory
$Name = "AdminToolBox.ActiveDirectory"
$RequiredVersion = "1.3.2.1"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .EndpointManagement
$Name = "AdminToolbox.EndpointManagement"
$RequiredVersion = "4.5.0.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .Exchange
$Name = "AdminToolbox.Exchange"
$RequiredVersion = "1.5.0.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .FFTools
$Name = "AdminToolbox.FFTools"
$RequiredVersion = "4.4.0.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .FileManagement
$Name = "AdminToolbox.FileManagement"
$RequiredVersion = "1.4.0.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .Fortiwizard
$Name = "AdminToolbox.Fortiwizard"
$RequiredVersion = "1.0.0.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .Fun
$Name = "AdminToolbox.Fun"
$RequiredVersion = "1.2.0.1"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .Networking
$Name = "AdminToolbox.Networking"
$RequiredVersion = "2.6.0.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .Office365
$Name = "AdminToolbox.Office365"
$RequiredVersion = "2.2.2.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .Remoting
$Name = "AdminToolbox.Remoting"
$RequiredVersion = "1.5.0.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module .VmwareAutomate
$Name = "AdminToolbox.VmwareAutomate"
$RequiredVersion = "4.3.1.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion

#Publish Module AdminToolbox
$Name = "AdminToolbox"
$RequiredVersion = "8.4.1.0"
Publish-Module -Name $Name -NuGetApiKey $API -RequiredVersion $RequiredVersion