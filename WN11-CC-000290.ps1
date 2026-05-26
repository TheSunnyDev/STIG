<#
.SYNOPSIS
  Remote connections must be encrypted to prevent interception of data or sensitive information. 
  Selecting "High Level" ensures encryption of RDS sessions in both directions.
  
.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000290
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000290/

.USAGE
    Example syntax:
    PS C:\> .\WN11-CC-000290.ps1
#>

#Run this code in elevated PowerShell console.
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
If (!(Test-Path $path)) { New-Item -Path $path -Force }
Set-ItemProperty -Path $path -Name "MinEncryptionLevel" -Type DWord -Value 3

#Verify the script is successful. Expected Value is 3.
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -Name MinEncryptionLevel
