
# Figure logic then write function

# New-LocalInPolicyTrusthosts Private function is called to set trusthosts for listed admins. Max integer loops are used to count up for all trusthosts and apply for all admins comma delimited. figure out a way to handle the variable amount of trust hosts that can be added.
# Trusted Hosts generate firewall objects and each of those are added to a object group.
# Service parameter takes x number of services, creates service objects, and puts them in a service group
# Create local-in allow policy
# Create local-in block policy