$ErrorActionPreference = "Stop"

# Configuration
$ExeUrl = "https://raw.githubusercontent.com/zzzphisher/zphisher_win/main/zphisher.exe"
$InstallDir = "$env:LOCALAPPDATA\Microsoft\WindowsApps"
$TargetFile = "$InstallDir\zhpisher.exe"

Write-Host "Installation de zphisher_win en cours..." -ForegroundColor Cyan

# 1. Téléchargement du fichier .exe
Invoke-WebRequest -Uri $ExeUrl -OutFile $TargetFile

Write-Host "Succès ! Tu peux maintenant taper 'zphisher' dans n'importe quel terminal." -ForegroundColor Green
