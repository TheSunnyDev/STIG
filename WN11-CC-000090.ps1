<#
.SYNOPSIS
    Enabling this setting ensures that policies will be reprocessed even if none have been changed, so any unauthorized changes are forced to match the domain-based group policy settings again.

.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000090
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000090/

 .EXAMPLE 
    PS C:\> .\WN11-CC-000090.ps1
    Note: Must be run in an elevated PowerShell console (Run as Administrator). 
#>

# Create the path if it doesn't exist
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
If (!(Test-Path $path)) { New-Item -Path $path -Force }

# Set the value
Set-ItemProperty -Path $path -Name "NoGPOListChanges" -Type DWord -Value 0

#Verify the script is successful. Expected Value is 0.
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name NoGPOListChanges
