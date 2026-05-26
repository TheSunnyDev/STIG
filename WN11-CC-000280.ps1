<#
.SYNOPSIS
    This controls the ability of users to supply passwords automatically as part of their remote desktop connection.
    Disabling this would allow anyone to use stored credentials to connect.

.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000280
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000280/

.EXAMPLE
    PS C:\> .\WN11-CC-000280.ps1
    Note: Must be run in an elevated PowerShell console (Run as Administrator). 

#>

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
If (!(Test-Path $path)) { New-Item -Path $path -Force }
Set-ItemProperty -Path $path -Name "fPromptForPassword" -Type DWord -Value 1

#Verify the script is successful. Expected Value is 1.
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fPromptForPassword
