 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-01
    Last Modified   : 2026-05-24
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.EXAMPLE
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
    Note: Must be run in an elevated PowerShell console (Run as Administrator).
#>

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Ensure the registry key exists
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the MaxSize value (DWORD)
New-ItemProperty -Path $path -Name "MaxSize" -Value 0x8000 -PropertyType DWord -Force | Out-Null 
