<#
.SYNOPSIS
  Attachments from RSS feeds may not be secure and must be blocked.

.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-25
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000295
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000295/

.EXAMPLE
    PS C:\> .\WN11-CC-000295.ps1
#>

#Run this code in an elevated PowerShell console.

# Create the path if it doesn't exist
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds"
If (!(Test-Path $path)) { New-Item -Path $path -Force }
Set-ItemProperty -Path $path -Name "DisableEnclosureDownload" -Type DWord -Value 1

#Verify the script is successful. Expected Value is 1.
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds" -Name DisableEnclosureDownload
