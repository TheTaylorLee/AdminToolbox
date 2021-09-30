<#
    .DESCRIPTION
    Convert an Exchange Online Mailbox to a Shared Mailbox without the need of maintaining a license.

    .NOTES
    Requirements:
        1. This Function is used for an Active Directory Synced account that is being disabled and the mailbox converted to an Exchange Online Shared Mailbox.
        2. This Function must be run from the server that hosts Azure AD Connect and the on-premise Account must be synced to an Exchange Online Mailbox.
        3. The Exchange online Module must be imported into the console before this function is run.
        4. The account associated with the Exchange Online Mailbox must be disabled and moved to an OU that is not Azure AD Synced

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Convert-MailboxToShared {

    [CmdletBinding()]
    Param (
    )

    begin {
        #Provide menu functions for Do-Until loops
        function Show-Menu {
            param (
                [string]$Title = 'My Menu'
            )
            Clear-Host
            Write-Host " "
            Write-Host "================ $Title ================"                       -ForegroundColor Magenta

            Write-Host "1: Press '1' Start Azure Sync."                                 -ForegroundColor Green
            Write-Host "2: Press '2' Check that disabled Mailbox is not active"         -ForegroundColor Green
            Write-Host "3: Press '3' Stage Shared Mailbox"                              -ForegroundColor Green
            Write-Host "4: Press '4' Copy Disabled Mailbox to the Shared Mailbox"       -ForegroundColor Green
            Write-Host "5: Press '5' Monitor Progress of copy to shared mailbox"        -ForegroundColor Green
            Write-Host "6: Press '6' Add SMTP addresses for the Shared Mailbox"         -ForegroundColor Green
            Write-Host "Q: Press 'q' to quit."                                          -ForegroundColor Green
        }

        function Show-Menu2 {
            param (
                [string]$Title = 'My Menu'
            )
            Clear-Host
            Write-Host " "
            Write-Host "================ $Title ================"              -ForegroundColor Magenta

            Write-Host "1: Press '1' Check for Mailbox Disabled"               -ForegroundColor Green
            Write-Host "Q: Press 'q' If the mailbox shows after pressing 1"  -ForegroundColor Green
        }

        function Show-Menu3 {
            param (
                [string]$Title = 'My Menu'
            )
            Clear-Host
            Write-Host " "
            Write-Host "================ $Title ================"       -ForegroundColor Magenta

            Write-Host "1: Press '1' Add Access for a user"             -ForegroundColor Green
            Write-Host "Q: Press 'q' to quit step 3"                  -ForegroundColor Green
        }

        function Show-Menu5 {
            param (
                [string]$Title = 'My Menu'
            )
            Clear-Host
            Write-Host " "
            Write-Host "================ $Title ================"       -ForegroundColor Magenta

            Write-Host "1: Press '1' Check Mailbox copy Progress"       -ForegroundColor Green
            Write-Host "2: Press '2' Kickstart Stalled Progress"        -ForegroundColor Green
            Write-Host "3: Press '3' Remove Completed Copy Job"         -ForegroundColor Green
            Write-Host "Q: Press 'q' to quit step 5"                  -ForegroundColor Green
        }

        #Begin function by declaring prerequisites and providing a chance to abort the function
        Clear-Host

        Write-Host " "
        Write-Warning "The following requirements must be met. If they are not then abort this function!"

        Write-Host " "
        Write-Host "
Prerequisites:
1. This Function is used for an Active Directory Synced account that is being disabled and the mailbox converted to an Exchange Online Shared Mailbox.
2. This Function must be run from the server that hosts Azure AD Connect and the on-premise Account must be synced to an Exchange Online Mailbox.
3. The Exchange online Module must be imported into the console before this function is run.
4. The account associated with the Exchange Online Mailbox must be disabled and moved to an OU that is not Azure AD Synced
5. Powershell version 5 is required
        " -ForegroundColor Green

        Write-Host " "
        Write-Host "If requirements are met the menu is worked through in chronological order" -ForegroundColor Yellow
        Write-Host " "

        $RequirementsMet = Read-Host "Have you Read and Completed the prerequisites? (yes/no)"

        if ($RequirementsMet -eq 'yes') {
        }
        else {
            Write-Host "Function has been Aborted." -ForegroundColor Yellow
            break
        }
    }

    process {

        #Start a do-until loop for processing the creation of the shared mailbox and managing it.
        do {
            #Menu that is returned until the function is ended
            Show-Menu -Title Convert-MailboxToShared

            #Switch that does the work for the menu's selected options
            $selection = Read-Host "Please make a selection"
            switch ($selection) {
                '1' {
                    #Start an azure sync to disconnect the disabled mailbox
                    Write-Host "Syncing the disabled account to Azure AD." -ForegroundColor Yellow

                    Start-ADSyncSyncCycle -PolicyType Delta

                } '2' {
                    #Check for the disabled mailbox before moving to the next step
                    do {
                        Show-Menu2 -Title "Check Mailbox Disabled"

                        $selection2 = Read-Host "Please make a selection"
                        switch ($selection2) {
                            '1' {
                                get-mailbox -softdeletedmailbox |
                                Select-Object DisplayName, IsSoftDeletedByRemove, IsSoftDeletedByDisable, IsInactiveMailbox |
                                Sort-Object DisplayName | Format-Table
                            }
                        }
                        Pause
                    } until ($selection2 -eq 'Q')

                } '3' {
                    #Create a shared mailbox and grant permissions to it
                    Write-Host "Respond to Prompts to create the shared mailbox" -ForegroundColor Yellow
                    Write-Host "The Names used for the mailbox must not match the disabled mailbox" -ForegroundColor Yellow

                    #Prompt variable for Creating the mailbox and asking if anyone should be granted permission to it.
                    $MailboxName = Read-Host "Type a Unique name for the Mailbox (ex: John Smith Archive)"
                    $MailboxAlias = Read-Host "Type a Unique Alias for the Mailbox (ex: JSMith)"
                    $PromptAccess = Read-Host "Do you wish to grant someone access to the mailbox? (yes/no)"

                    #Creates the Shared Mailbox
                    Write-Host "Creating the Shared Mailbox" -ForegroundColor Cyan
                    New-Mailbox -Shared -Name "$MailboxName" -DisplayName "$MailboxName" -Alias "$MailboxAlias"

                    if ($PromptAccess -eq 'yes') {
                        ##Grant access to the shared mailbox
                        Write-Host " "
                        Write-Host "Time to grant Full Access to the Shared Mailbox" -ForegroundColor Yellow
                        Pause

                        #Start a do-until loop to grant access
                        do {
                            Show-Menu3 -Title "Grant User Access to Shared Mailbox"

                            $selection3 = Read-Host "Please make a selection"
                            switch ($selection3) {
                                '1' {
                                    Write-Host "When the Popup appears, select a mailbox, and hit ok." -ForegroundColor Yellow
                                    $AccessPermission = get-mailbox | Out-GridView -PassThru -Title "Select a Mailbox and Hit Ok"
                                    Add-MailboxPermission -Identity "$MailboxName" -User $AccessPermission.name -AccessRights FullAccess -InheritanceType All
                                }
                            }
                            Pause
                        } until ($selection3 -eq 'Q')
                    }

                } '4' {
                    ##Perform a mailbox copy from the disabled mailbox to the new mailbox

                    #Get GUID of new shared mailbox:
                    Write-Host "Select the Shared Mailbox and Hit Ok" -ForegroundColor Yellow
                    $SharedMailbox = Get-Mailbox | Where-Object { $_.RecipientTypeDetails -eq 'SharedMailbox' } | Out-GridView -PassThru -Title "Select the Shared Mailbox and Hit Ok"
                    Write-Host "The Shared Mailbox Guid is" -ForegroundColor Cyan
                    $SharedMailbox.ExchangeGuid

                    #Get GUID of old inactive mailbox:
                    Write-Host "Select the disconnected/disabled Mailbox and Hit Ok" -ForegroundColor Yellow
                    $DisconnectedMailbox = Get-Mailbox -softdeletedmailbox | Out-GridView -PassThru -Title "Select the disconnected/disabled Mailbox and Hit Ok"
                    Write-Host "The Disconnected/disabled Mailbox Guid is" -ForegroundColor Cyan
                    $DisconnectedMailbox.ExchangeGuid

                    $TargetMailbox = Read-Host "Paste the Shared Mailbox guid here without spaces"
                    $SourceMailbox = Read-Host "Paste the disconnected/disabled mailbox guid here without spaces"

                    #Copy inactive mailbox content to the new active or shared mailbox:
                    Write-Host "The Disconnected Mailbox's emails will be copied to the Shared Mailbox. The Job name matches the Target Guid."
                    New-MailboxRestoreRequest -SourceMailbox $SourceMailbox -TargetMailbox $TargetMailbox -TargetRootFolder "Inactive Mailbox Archive" -AllowLegacyDNMismatch -BatchName $TargetMailbox

                } '5' {
                    ##Monitor progress of the mailbox copy and remove completed requests
                    do {
                        Show-Menu5 -Title "Grant User Access to Shared Mailbox"

                        $selection5 = Read-Host "Please make a selection"
                        switch ($selection5) {
                            '1' {
                                Get-MailboxRestoreRequest | Get-MailboxRestoreRequestStatistics | Format-Table
                            } '2' {
                                Get-MailboxRestoreRequest | Resume-MailboxRestoreRequest
                            } '3' {
                                Get-MailboxRestoreRequest | Where-Object { $_.status -eq "completed" } | Remove-MailboxRestoreRequest
                            }
                        } Pause
                    } until ($selection5 -eq 'Q')

                } '6' {
                    #Add SMTP Addresses to the Shared Mailbox
                    Write-Host " "
                    Write-Host "Select the Shared Mailbox and Hit Ok" -ForegroundColor Yellow
                    $SharedMailbox = Get-Mailbox | Where-Object { $_.RecipientTypeDetails -eq 'SharedMailbox' } | Out-GridView -PassThru -Title "Select the Shared Mailbox and Hit Ok"
                    Write-Host " "
                    Write-Host "Current Mailbox Addresses are..." -ForegroundColor Green
                    $SharedMailbox.EmailAddresses
                    Write-Host " "
                    Write-Host "For Addresses to add, write them out like so. Use SMTP: for the Primary SMTP Address." -ForegroundColor Yellow
                    Write-Host '"SMTP:John.Smith@company.com", "smtp:John.Smith@mail.onmicrosoft.company.com", "smtp:JohnS@company.com"' -ForegroundColor Cyan
                    Write-Host " "
                    $SMTPAddresses = Read-Host "Specify SMTP Address and the primary using SMTP as shown in the above example"
                    Set-Mailbox $SharedMailbox.name -EmailAddresses $SMTPAddresses
                }
            }
            Pause
        } until ($selection -eq 'q')
    }

    #Final statements and cleanup
    end {
        Write-Host "Don't Forget to tell those with permission to the Shared Mailbox, to look for it in outlook." -ForegroundColor Yellow
    }
}