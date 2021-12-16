# **FortiWizard**

* **1.0.0.0** Created the Module
* **1.1.0.0** Added to Workflow
* **1.2.0.0** Updated Enable-Management to add trustedhost parametersets. [Github Issue #5](https://github.com/TheTaylorLee/AdminToolbox/issues/5)
* **1.2.1.0** Fixed incorrectly name private function that would replace New-FirewallPolicyTunnel when some functions were run.
* **1.2.2.0** Updated Private function New-StaticRouteDialupTunnel
* **1.3.0.0** Added Parameters to private functions for future use. [Github Issue #11](https://github.com/TheTaylorLee/AdminToolbox/issues/11)
* **1.4.0.0** Added Help Messages to private function parameters. [Github Issue #11](https://github.com/TheTaylorLee/AdminToolbox/issues/11)
* **1.5.0.0** Added required modules and implemented us of CIDR conversions [Github Issue #9](https://github.com/TheTaylorLee/AdminToolbox/issues/9)
* **1.6.0.0** Added Parameters and help to VPN Wizard Functions [Github Issue #11](https://github.com/TheTaylorLee/AdminToolbox/issues/11)
* **2.0.0** Published release of all change made since Dev version 1.3.0.0 [Github Issue #11](https://github.com/TheTaylorLee/AdminToolbox/issues/11)
* **2.1.0** Add Function New-FormTunnel
* **2.1.1** Added Dependency comments for each function.
* **2.2.0** Fix for null services parameter on function New-FormTunnel
* **2.3.0** Fixes for Github issue #26 that address improperly named source and remote address when there is a single source and remore cidr provided.
* **2.4.0** Updated required modules
* **2.5.0** Updated VPN form and tunnel functions [Github Issue #30](https://github.com/TheTaylorLee/AdminToolbox/issues/30)
* **2.6.0** Updated VPN config comments
* **2.7.0** dhgroups parameter fix for function new-formtunnel. Resolves type issue when single DH group is supplied.
* **2.8.0** Added support for multiple proposals and multiple interfaces  [Github Issue #34](https://github.com/TheTaylorLee/AdminToolbox/issues/34)
* **2.9.0** Removed unnecessary write-host output.
* **2.10.0** Changed default ssl inspection profile from no-inspection to certificate inspection for firewall policies.
* **2.10.1** Move comment based help outside function block
* **2.11.0** Add comments to config output identifying which version a tunnel was created with
* **2.11.1** Update comment block structure
* **2.11.2** Remove broken helpinfouri from the manifest [Github Issue #59](https://github.com/TheTaylorLee/AdminToolbox/issues/59)
* **2.12.0** Add comment parameters for Tunnel Functions [Github Issue #37](https://github.com/TheTaylorLee/AdminToolbox/issues/37)
* **2.12.1** Add comment parameters for Tunnel Functions [Github Issue #65](https://github.com/TheTaylorLee/AdminToolbox/issues/65)
* **2.12.2** Fix bad examples
* **2.13.0** [#64](https://github.com/TheTaylorLee/AdminToolbox/issues/64)
* **2.13.1** Github Workflow Fix

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
2.13.1