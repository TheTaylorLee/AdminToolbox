---
external help file: AdminToolbox.Office365Manifest-help.xml
Module Name: AdminToolbox.Office365
online version: https://github.com/TheTaylorLee/AdminToolbox
schema: 2.0.0
---

# Set-AuthPolicy

## SYNOPSIS

## SYNTAX

### Apply All Modern
```
Set-AuthPolicy [-ApplyAllModern] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Apply All Basic
```
Set-AuthPolicy [-ApplyAllBasic] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Apply Policy Single Account
```
Set-AuthPolicy [-ApplyPolicySingle] -DisplayNameLike <Object> -Policy <Object> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Apply Policy for Null
```
Set-AuthPolicy -Policy <Object> [-ApplyToNull] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Used to secure Exchange Online Authentication by applying authentication policies

Use of Modern Authentication Only is important for securing against Password Spray Attacks.
New attacks on Basic authentication allow for taking control of an Exchange Online account by simply sending a malicious link to a target.

## EXAMPLES

### EXAMPLE 1
```
Set-AuthPolicy -ApplyAllModern
```

Apply "Modern Auth Only" To all Exchange Online Mailboxes

### EXAMPLE 2
```
Set-AuthPolicy -ApplyPolicySingle -DisplayNameLike "John Smith" -Policy "Modern Auth Only"
```

Apply "Modern Auth Only" Policy to a single Mailbox or multiple that have a Display Name Like "John Smith".

### EXAMPLE 3
```
Set-AuthPolicy -ApplytoNull -Policy "Modern Auth Only"
```

Apply "Modern Auth Only" Policy to all mailboxes with a $null policy

## PARAMETERS

### -ApplyAllModern
Apply Modern Auth Policy to all

```yaml
Type: SwitchParameter
Parameter Sets: Apply All Modern
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApplyAllBasic
Apply Basic Auth Policy to all

```yaml
Type: SwitchParameter
Parameter Sets: Apply All Basic
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApplyPolicySingle
Apply a specified policy to a single account

```yaml
Type: SwitchParameter
Parameter Sets: Apply Policy Single Account
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayNameLike
Full or partial displayname of account a policy is to be applied to

```yaml
Type: Object
Parameter Sets: Apply Policy Single Account
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Policy
Specify a policy for the Null or Single account Parameter Sets

```yaml
Type: Object
Parameter Sets: Apply Policy Single Account, Apply Policy for Null
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApplyToNull
Apply policy to accounts with a null policy

```yaml
Type: SwitchParameter
Parameter Sets: Apply Policy for Null
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Requires the Exchange Online module be installed, imported, and Connected.

## RELATED LINKS

[https://github.com/TheTaylorLee/AdminToolbox](https://github.com/TheTaylorLee/AdminToolbox)

