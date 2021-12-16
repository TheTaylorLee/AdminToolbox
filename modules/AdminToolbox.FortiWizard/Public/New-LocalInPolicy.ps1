
# Figure logic then write functions

# New-LocalInPolicyTrusthosts Private function is called to set trusthosts for listed admins. Max integer loops are used to count up for all trusthosts and apply for all admins comma delimited. figure out a way to handle the variable amount of trust hosts that can be added.
##New-LocalInPolicyTrustHosts -administrator Admin1, Admin2 -trustedhosts 192.168.0.0/16, 172.16.0.0/12, 10.0.0.0/8
# Trusted Hosts generate firewall objects and each of those are added to a object group.
# Service parameter takes x number of services, creates service objects, and puts them in a service group
# Create local-in allow policy
# Create local-in block policy