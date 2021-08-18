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

#The line below this one is used strictly by a github action. That action is responsible for publishing new versions of this module to Powershell Gallery, upon pushing an iterative version to Github.
2.4.0