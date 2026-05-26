<#
.SYNOPSIS
    Standard user accounts must not be granted elevated privileges. 
    Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.

.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000315/

.USAGE
    Example syntax:
    PS C:\> .\WN11-CC-000315.ps1
#>

#Run this code in elevated PowerShell console.
#Create the path if it doesn't exist
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
If (!(Test-Path $path)) { New-Item -Path $path -Force }

# Set the value
Set-ItemProperty -Path $path -Name "AlwaysInstallElevated" -Type DWord -Value 0

#Verify the script is successful. Expected Value is 0.
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" -Name AlwaysInstallElevated
