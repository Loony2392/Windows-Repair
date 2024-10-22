# LOONY-TECH - Windows Repair Script

## Description / Beschreibung

### English

This PowerShell script, created by LOONY-TECH, is designed to repair and optimize common Windows issues. It automates various maintenance tasks, such as checking and repairing system files, resetting network adapters, clearing the DNS cache, and more. The script provides a comprehensive solution for common problems encountered by Windows users.

### Deutsch

Dieses PowerShell-Skript, erstellt von LOONY-TECH, ist darauf ausgelegt, häufige Windows-Probleme zu reparieren und zu optimieren. Es automatisiert verschiedene Wartungsaufgaben wie das Überprüfen und Reparieren von Systemdateien, das Zurücksetzen von Netzwerkadaptern, das Leeren des DNS-Caches und vieles mehr. Das Skript bietet eine umfassende Lösung für häufig auftretende Probleme von Windows-Nutzern.

---

## Features / Funktionen

### English
- **System File Check (SFC)**: Automatically checks and repairs corrupted Windows system files.
- **Disk Check (CHKDSK)**: Scans and repairs disk errors.
- **Windows Update Reset**: Resets Windows Update components to resolve update-related issues.
- **Firewall Reset**: Resets the Windows Firewall settings to default.
- **TCP/IP Stack Reset**: Resets the TCP/IP stack to solve network issues.
- **DNS Cache Flush**: Clears the DNS cache to refresh network settings.
- **Search Index Repair**: Repairs the Windows search index.
- **Store Cache Repair**: Clears the Windows Store cache.
- **Store Apps Re-registration**: Re-registers all Windows Store apps.
- **Windows Image Repair**: Repairs the Windows system image using DISM.
- **Temporary Files Cleanup**: Removes temporary files from the system.
- **Windows Installer Repair**: Re-registers the Windows Installer service.
- **WMI Repair**: Repairs Windows Management Instrumentation (WMI).
- **Power Plan Reset**: Resets power plan settings to default.
- **Internet Explorer Reset**: Resets Internet Explorer settings.
- **Icon Cache Rebuild**: Rebuilds the Windows icon cache.
- **UAC Settings Repair**: Fixes User Account Control (UAC) settings.
- **Network Adapter Reset**: Resets the network adapter to resolve connectivity issues.
- **Windows Defender Update and Scan**: Updates and performs a full system scan with Windows Defender.
- **Disk Defragmentation**: Defragments the disk for better performance.
- **Pagefile Optimization**: Automatically adjusts the pagefile size for optimal performance.
- **Time Service Repair**: Repairs and resynchronizes the Windows Time Service.
- **Restart Option**: Allows you to choose whether to restart the computer immediately or later.

### Deutsch
- **Systemdateiprüfung (SFC)**: Überprüft und repariert automatisch beschädigte Windows-Systemdateien.
- **Festplattenüberprüfung (CHKDSK)**: Überprüft und repariert Festplattenfehler.
- **Zurücksetzen der Windows-Update-Komponenten**: Setzt die Windows-Update-Komponenten zurück, um Update-Probleme zu beheben.
- **Zurücksetzen der Firewall**: Setzt die Windows-Firewall-Einstellungen auf die Standardeinstellungen zurück.
- **TCP/IP-Stack zurücksetzen**: Setzt den TCP/IP-Stack zurück, um Netzwerkprobleme zu beheben.
- **Leeren des DNS-Caches**: Löscht den DNS-Cache, um die Netzwerkeinstellungen zu aktualisieren.
- **Reparieren des Suchindex**: Repariert den Windows-Suchindex.
- **Reparatur des Store-Caches**: Leert den Windows Store-Cache.
- **Store-Apps neu registrieren**: Registriert alle Windows Store-Apps erneut.
- **Windows-Abbild reparieren**: Repariert das Windows-Systemabbild mit DISM.
- **Bereinigen temporärer Dateien**: Entfernt temporäre Dateien vom System.
- **Reparatur des Windows Installers**: Registriert den Windows Installer-Dienst neu.
- **WMI reparieren**: Repariert die Windows-Verwaltungsinstrumentation (WMI).
- **Zurücksetzen der Energieplaneinstellungen**: Setzt die Energieplaneinstellungen auf Standard zurück.
- **Zurücksetzen von Internet Explorer**: Setzt die Internet Explorer-Einstellungen zurück.
- **Neuaufbau des Icon-Caches**: Baut den Windows-Icon-Cache neu auf.
- **UAC-Einstellungen reparieren**: Repariert die Einstellungen der Benutzerkontensteuerung (UAC).
- **Netzwerkadapter zurücksetzen**: Setzt den Netzwerkadapter zurück, um Verbindungsprobleme zu beheben.
- **Windows Defender aktualisieren und scannen**: Aktualisiert und führt einen vollständigen Systemscan mit Windows Defender durch.
- **Festplatte defragmentieren**: Defragmentiert die Festplatte, um die Leistung zu verbessern.
- **Optimierung der Auslagerungsdatei**: Passt die Größe der Auslagerungsdatei automatisch an.
- **Windows-Zeitdienst reparieren**: Repariert und synchronisiert den Windows-Zeitdienst.
- **Neustart-Option**: Ermöglicht die Auswahl, ob der Computer sofort oder später neu gestartet wird.

---

## Usage / Nutzung

### English

1. **Download** the `Repair-Windows.ps1` script file.
2. **Run PowerShell as Administrator**: Right-click the PowerShell icon and select "Run as Administrator".
3. **Execute the script**:
    - Navigate to the folder where the script is saved.
    - Type `.\Repair-Windows.ps1` and press Enter.
4. **Follow the on-screen instructions** to allow the script to repair various Windows components.
5. **Restart Option**: At the end, you will be asked whether you want to restart your computer now or later. Choose accordingly.

### Deutsch

1. **Lade die Datei** `Repair-Windows.ps1` herunter.
2. **Starte PowerShell als Administrator**: Klicke mit der rechten Maustaste auf das PowerShell-Symbol und wähle "Als Administrator ausführen".
3. **Führe das Skript aus**:
    - Navigiere zu dem Ordner, in dem das Skript gespeichert ist.
    - Gib `.\Repair-Windows.ps1` ein und drücke Enter.
4. **Folge den Anweisungen auf dem Bildschirm**, um verschiedene Windows-Komponenten reparieren zu lassen.
5. **Neustart-Option**: Am Ende wirst du gefragt, ob du den Computer jetzt oder später neu starten möchtest. Wähle entsprechend.

---

## Requirements / Voraussetzungen

- Windows 10 or Windows 11
- Administrator privileges (required to run the script)
- PowerShell 5.1 or higher

---

## License / Lizenz

This script is provided under the MIT License. You are free to use, modify, and distribute it.
