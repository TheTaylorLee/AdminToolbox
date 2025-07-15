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
* **2.13.2** Update Icon URI in Manifest
* **2.13.3** Format output of write-sslvpnconfig [#74](https://github.com/TheTaylorLee/AdminToolbox/issues/74)
* **2.14.4** Increment Manifest to resolve missing manifest version in github timeline
* **2.15.0** Push any small changes
* **2.16.0** Add 3 SAML functions
* **2.16.1** Correct function name Add-SSLVPNSAMLUsersSelection
* **2.16.2** Fix Test-SAMLFunctionRequirements function logic. Was copied from similar function and untested.
* **2.16.3** Maintenance Release
* **2.16.4** Maintenance Release
* **2.16.5** Maintenance Release
* **2.16.6** Maintenance Release
* **2.16.7** fix: missing manifest from workflow writeback
* **2.16.8** Maintenance Release
* **2.16.9** Maintenance Release
* **2.16.10** Maintenance Release
* **2.16.11** Workflow Fix
* **2.16.12** Workflow Fix
* **2.16.13** Workflow Fix
* **2.16.14** CI Maintenance Release
* **2.16.70** CI Maintenance Release
* **2.17.0** Update the tunnel functions to split parameters for P1 and P2 TTL
* **2.17.1** fix: New-FormTunnel private functions
* **2.17.2** CI Maintenance Release
* **2.17.26** CI Maintenance Release
* **2.18.00** Modify New-AddressObject to accept an array. Issue [#138](https://github.com/TheTaylorLee/AdminToolbox/issues/138)
* **2.18.1** CI Maintenance Release
* **2.18.45** CI Maintenance Release
* **2.18.46** Fix new-localinpolicy address objects inserting the cidr twice into address object names
* **2.18.47** CI Maintenance Release
* **2.18.52** CI Maintenance Release
* **2.19.00** Add functionality for wildcard selectors when building tunnels
* **2.19.1** CI Maintenance Release
* **2.19.16** CI Maintenance Release
* **2.19.17** Remove set route enable for creating dialup vpn phase1 interfaces.
* **2.19.18** CI Maintenance Release
* **2.19.30** CI Maintenance Release
* **2.20.0.0** Add workflow versioning
* **2.20.0.1** CI Maintenance Release
* **2.20.0.11** CI Maintenance Release
* **2.20.1.0** Fix New-P2PTunnelNat firewall policy output when only a single local cidr is provided.
* **2.20.1.1** CI Maintenance Release
* **2.20.1.4** CI Maintenance Release
* **2.21.0.0** Add functions for converting key-value faz logs into csv format.
* **2.21.0.1** CI Maintenance Release
* **2.21.1.0** Update get-fortiwizard
* **2.21.2.0** Export the new faz log functions in the manifest.
* **2.21.2.1** CI Maintenance Release
* **2.21.2.12** CI Maintenance Release
* **2.22.0.0** Update SAML functions to bring them inline with deprecating modules and updated MFA standards, before Microsoft deprecates old methods.
* **2.22.0.1** CI Maintenance Release
* **2.22.0.32** CI Maintenance Release
* **2.22.0.33** CI Maintenance Release
* **2.22.0.34** CI Maintenance Release
* **2.22.0.35** CI Maintenance Release
* **2.22.0.36** CI Maintenance Release
* **2.22.0.37** CI Maintenance Release
* **2.22.0.38** CI Maintenance Release
* **2.22.0.39** CI Maintenance Release
* **2.22.0.40** CI Maintenance Release