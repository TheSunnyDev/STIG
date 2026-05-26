<#
.SYNOPSIS
  Remote assistance allows another user to view or take control of the local session. 
  Solicited assistance is help specifically requested by the local user, which may allow unauthorized parties access to the resources on the computer.

.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000110/

 .EXAMPLE 
    PS C:\> .\WN11-CC-000110.ps1
    Note: Must be run in an elevated PowerShell console (Run as Administrator). 
#>


# Create the path if it doesn't exist
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
If (!(Test-Path $path)) { New-Item -Path $path -Force }
Set-ItemProperty -Path $path -Name "fAllowToGetHelp" -Type DWord -Value 0

#Verify the script is successful. Expected Value is 0/failure of script.
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name fAllowToGetHelp
