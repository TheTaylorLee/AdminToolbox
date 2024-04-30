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
* **2.16.15** CI Maintenance Release
* **2.16.16** CI Maintenance Release
* **2.16.17** CI Maintenance Release
* **2.16.18** CI Maintenance Release
* **2.16.19** CI Maintenance Release
* **2.16.20** CI Maintenance Release
* **2.16.21** CI Maintenance Release
* **2.16.22** CI Maintenance Release
* **2.16.23** CI Maintenance Release
* **2.16.24** CI Maintenance Release
* **2.16.25** CI Maintenance Release
* **2.16.26** CI Maintenance Release
* **2.16.27** CI Maintenance Release
* **2.16.28** CI Maintenance Release
* **2.16.29** CI Maintenance Release
* **2.16.30** CI Maintenance Release
* **2.16.31** CI Maintenance Release
* **2.16.32** CI Maintenance Release
* **2.16.33** CI Maintenance Release
* **2.16.34** CI Maintenance Release
* **2.16.35** CI Maintenance Release
* **2.16.36** CI Maintenance Release
* **2.16.37** CI Maintenance Release
* **2.16.38** CI Maintenance Release
* **2.16.39** CI Maintenance Release
* **2.16.40** CI Maintenance Release
* **2.16.41** CI Maintenance Release
* **2.16.42** CI Maintenance Release
* **2.16.43** CI Maintenance Release
* **2.16.44** CI Maintenance Release
* **2.16.45** CI Maintenance Release
* **2.16.46** CI Maintenance Release
* **2.16.47** CI Maintenance Release
* **2.16.48** CI Maintenance Release
* **2.16.49** CI Maintenance Release
* **2.16.50** CI Maintenance Release
* **2.16.51** CI Maintenance Release
* **2.16.52** CI Maintenance Release
* **2.16.53** CI Maintenance Release
* **2.16.54** CI Maintenance Release
* **2.16.55** CI Maintenance Release
* **2.16.56** CI Maintenance Release
* **2.16.57** CI Maintenance Release
* **2.16.58** CI Maintenance Release
* **2.16.59** CI Maintenance Release
* **2.16.60** CI Maintenance Release
* **2.16.61** CI Maintenance Release
* **2.16.62** CI Maintenance Release
* **2.16.63** CI Maintenance Release
* **2.16.64** CI Maintenance Release
* **2.16.65** CI Maintenance Release
* **2.16.66** CI Maintenance Release
* **2.16.67** CI Maintenance Release
* **2.16.68** CI Maintenance Release
* **2.16.69** CI Maintenance Release
* **2.16.70** CI Maintenance Release
* **2.17.0** Update the tunnel functions to split parameters for P1 and P2 TTL
* **2.17.1** fix: New-FormTunnel private functions
* **2.17.2** CI Maintenance Release
* **2.17.3** CI Maintenance Release
* **2.17.4** CI Maintenance Release
* **2.17.5** CI Maintenance Release
* **2.17.6** CI Maintenance Release
* **2.17.7** CI Maintenance Release
* **2.17.8** CI Maintenance Release
* **2.17.9** CI Maintenance Release
* **2.17.10** CI Maintenance Release
* **2.17.11** CI Maintenance Release
* **2.17.12** CI Maintenance Release
* **2.17.13** CI Maintenance Release
* **2.17.14** CI Maintenance Release
* **2.17.15** CI Maintenance Release
* **2.17.16** CI Maintenance Release
* **2.17.17** CI Maintenance Release
* **2.17.18** CI Maintenance Release
* **2.17.19** CI Maintenance Release
* **2.17.20** CI Maintenance Release
* **2.17.21** CI Maintenance Release
* **2.17.22** CI Maintenance Release
* **2.17.23** CI Maintenance Release
* **2.17.24** CI Maintenance Release
* **2.17.25** CI Maintenance Release
* **2.17.26** CI Maintenance Release
* **2.18.00** Modify New-AddressObject to accept an array. Issue [#138](https://github.com/TheTaylorLee/AdminToolbox/issues/138)
* **2.18.1** CI Maintenance Release
* **2.18.2** CI Maintenance Release
* **2.18.3** CI Maintenance Release
* **2.18.4** CI Maintenance Release
* **2.18.5** CI Maintenance Release
* **2.18.6** CI Maintenance Release
* **2.18.7** CI Maintenance Release
* **2.18.8** CI Maintenance Release
* **2.18.9** CI Maintenance Release
* **2.18.10** CI Maintenance Release
* **2.18.11** CI Maintenance Release
* **2.18.12** CI Maintenance Release
* **2.18.13** CI Maintenance Release
* **2.18.14** CI Maintenance Release
* **2.18.15** CI Maintenance Release
* **2.18.16** CI Maintenance Release
* **2.18.17** CI Maintenance Release
* **2.18.18** CI Maintenance Release
* **2.18.19** CI Maintenance Release
* **2.18.20** CI Maintenance Release
* **2.18.21** CI Maintenance Release
* **2.18.22** CI Maintenance Release
* **2.18.23** CI Maintenance Release
* **2.18.24** CI Maintenance Release
* **2.18.25** CI Maintenance Release
* **2.18.26** CI Maintenance Release
* **2.18.27** CI Maintenance Release
* **2.18.28** CI Maintenance Release
* **2.18.29** CI Maintenance Release
* **2.18.30** CI Maintenance Release
* **2.18.31** CI Maintenance Release
* **2.18.32** CI Maintenance Release
* **2.18.33** CI Maintenance Release
* **2.18.34** CI Maintenance Release
* **2.18.35** CI Maintenance Release
* **2.18.36** CI Maintenance Release
* **2.18.37** CI Maintenance Release
* **2.18.38** CI Maintenance Release
* **2.18.39** CI Maintenance Release
* **2.18.40** CI Maintenance Release
* **2.18.41** CI Maintenance Release
* **2.18.42** CI Maintenance Release
* **2.18.43** CI Maintenance Release
* **2.18.44** CI Maintenance Release
* **2.18.45** CI Maintenance Release
* **2.18.46** Fix new-localinpolicy address objects inserting the cidr twice into address object names
* **2.18.47** CI Maintenance Release
* **2.18.48** CI Maintenance Release
* **2.18.49** CI Maintenance Release
* **2.18.50** CI Maintenance Release
* **2.18.51** CI Maintenance Release
* **2.18.52** CI Maintenance Release
* **2.19.00** Add functionality for wildcard selectors when building tunnels
* **2.19.1** CI Maintenance Release
* **2.19.2** CI Maintenance Release