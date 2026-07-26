<#
    .SYNOPSIS
    Identifies hidden Windows services and provides detailed information about them.

    .DESCRIPTION
    The Get-HiddenServices function compares the list of services retrieved from the Windows Service Manager
    with the services listed in the registry. It identifies services that are present in the registry but
    not visible in the Service Manager. For each hidden service, it retrieves detailed information such as
    the display name, start type, image path, owner, description, and whether a corresponding process is running.

    .OUTPUTS
    PSCustomObject
        Outputs a custom object for each hidden service with the following properties:
        - Name: The name of the service.
        - DisplayName: The display name of the service.
        - StartType: The start type of the service in a human-readable format.
        - IsRunning: Indicates whether a process corresponding to the service is running.
        - ImagePath: The executable path of the service.
        - Owners: The owner(s) of the service.
        - Description: A description of the service.

    .EXAMPLE
    Get-HiddenServices

    This command retrieves and displays information about all hidden services on the system.

    .Link
    https://github.com/TheTaylorLee/AdminToolbox
#>

function Get-HiddenServices {

    [CmdletBinding()]
    param (
    )

    $reference = Get-Service |
        Select-Object -ExpandProperty Name |
        ForEach-Object { $_ -replace "_[0-9a-f]{2,8}$" }
    $difference = Get-ChildItem -Path hklm:\system\currentcontrolset\services |
        ForEach-Object { $_.Name -Replace "HKEY_LOCAL_MACHINE\\", "HKLM:\" } |
        Where-Object { Get-ItemProperty -Path "$_" -Name objectname -ErrorAction 'ignore' } |
        ForEach-Object { $_.substring(40) }

    $hiddenServices = Compare-Object -ReferenceObject $reference -DifferenceObject $difference -PassThru |
        Where-Object { $_.sideIndicator -eq "=>" }

    foreach ($service in $hiddenServices) {
        $servicePath = "HKLM:\system\currentcontrolset\services\$service"
        $serviceDetails = Get-ItemProperty -Path $servicePath -ErrorAction 'Ignore'

        # Translate StartType to human-readable format
        $startTypeReadable = switch ($serviceDetails.Start) {
            0 { "Boot" }
            1 { "System" }
            2 { "Automatic" }
            3 { "Manual" }
            4 { "Disabled" }
            Default { "Unknown" }
        }

        # Check if a process is running based on the ImagePath
        $imagePath = $serviceDetails.ImagePath -replace '"', '' # Remove quotes if present
        $isRunning = Get-Process | Where-Object { $_.Path -eq $imagePath } | ForEach-Object { $_.Name }

        [PSCustomObject]@{
            Name        = $service
            DisplayName = $serviceDetails.DisplayName
            StartType   = $startTypeReadable
            IsRunning   = if ($isRunning) { "Yes ($isRunning)" } else { "No" }
            ImagePath   = $serviceDetails.ImagePath
            Owners      = $serviceDetails.Owners
            Description = $serviceDetails.Description
        }
    }
}