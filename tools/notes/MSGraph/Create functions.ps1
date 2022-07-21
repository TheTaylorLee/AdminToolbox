# need to use custom properties to handle arrays
AuditLog.Read.All
Get-MgReportAuthenticationMethodUserRegistrationDetail -Property * |
Select-Object Id, DefaultMfaMethod, IsMfaCapable, IsMfaRegistered, IsPasswordlessCapable, IsSsprCapable, IsSsprEnabled, IsSsprRegistered, { $_.MethodsRegistered }, UserDisplayName, UserPrincipalName, { $_.additionalproperties } |
Out-GridView



AuditLog.Read.All
Get-MgAuditLogSignIn -All -Property * | Select-Object *
