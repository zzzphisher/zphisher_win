$ErrorActionPreference = "Stop"

# Configuration
$RepoUrl = "https://github.com/ton-pseudo/ton-repo.git"
$InstallDir = "$env:LOCALAPPDATA\mon-outil"
$CommandName = "mon-outil"

Write-Host "Installation de $CommandName..." -ForegroundColor Green

# 1. Cloner ou mettre à jour le dépôt
if (Test-Path $InstallDir) {
    Write-Host "Mise à jour du dépôt..."
    git -C $InstallDir pull --quiet
} else {
    Write-Host "Téléchargement du dépôt..."
    git clone --quiet $RepoUrl $InstallDir
}

# 2. Créer un fichier de commande (.cmd) pour exécuter l'outil
$BinDir = "$env:LOCALAPPDATA\Microsoft\WindowsApps"
$BatchFile = "$BinDir\$CommandName.cmd"

# Remplace 'main.py' par le fichier principal de ton outil (ex: python, node, etc.)
"@echo off`npython `"$InstallDir\main.py`" %*" | Out-File -Encoding ascii -FilePath $BatchFile

Write-Host "Installation terminée ! Ouvre un nouveau terminal et tape '$CommandName'." -ForegroundColor Green
