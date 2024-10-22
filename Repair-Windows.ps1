#      __    ____  ____  _   ____  __    ____________________  __
#     / /   / __ \/ __ \/ | / /\ \/ /   /_  __/ ____/ ____/ / / /
#    / /   / / / / / / /  |/ /  \  /_____/ / / __/ / /   / /_/ / 
#   / /___/ /_/ / /_/ / /|  /   / /_____/ / / /___/ /___/ __  /  
#  /_____/\____/\____/_/ |_/   /_/     /_/ /_____/\____/_/ /_/   
#                                                                
#      LOONY-TECH - Repairing Common Windows Errors
#

Write-Host "Repairing Common Windows Errors..." -ForegroundColor Cyan

# 1. Windows Systemdateien überprüfen und reparieren
Write-Host "1. Überprüfen und Reparieren der Windows-Systemdateien..." -ForegroundColor Yellow
sfc /scannow

# 2. Festplattenfehler überprüfen und reparieren
Write-Host "2. Überprüfen und Reparieren der Festplatte..." -ForegroundColor Yellow
chkdsk /f

# 3. Windows Update-Komponenten zurücksetzen
Write-Host "3. Windows Update-Komponenten zurücksetzen..." -ForegroundColor Yellow
Stop-Service wuauserv, cryptSvc, bits, msiserver
Rename-Item -Path "C:\Windows\SoftwareDistribution" -NewName "SoftwareDistribution.old" -Force
Rename-Item -Path "C:\Windows\System32\catroot2" -NewName "catroot2.old" -Force
Start-Service wuauserv, cryptSvc, bits, msiserver

# 4. Windows Firewall zurücksetzen
Write-Host "4. Windows Firewall-Einstellungen zurücksetzen..." -ForegroundColor Yellow
netsh advfirewall reset

# 5. TCP/IP-Stack zurücksetzen
Write-Host "5. TCP/IP-Stack zurücksetzen..." -ForegroundColor Yellow
netsh int ip reset

# 6. DNS-Cache leeren
Write-Host "6. DNS-Cache leeren..." -ForegroundColor Yellow
ipconfig /flushdns

# 7. Windows-Suchindex reparieren
Write-Host "7. Windows-Suchindex reparieren..." -ForegroundColor Yellow
sc config wsearch start=auto
Stop-Service wsearch
Start-Service wsearch

# 8. Windows Store-Cache reparieren
Write-Host "8. Windows Store-Cache reparieren..." -ForegroundColor Yellow
wsreset.exe

# 9. Windows Store-Apps erneut registrieren
Write-Host "9. Windows Store-Apps erneut registrieren..." -ForegroundColor Yellow
Get-AppXPackage -AllUsers | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

# 10. Windows-Abbild reparieren
Write-Host "10. Windows-Abbild reparieren..." -ForegroundColor Yellow
DISM /Online /Cleanup-Image /RestoreHealth

# 11. Temporäre Dateien entfernen
Write-Host "11. Temporäre Dateien entfernen..." -ForegroundColor Yellow
Start-Process "cleanmgr" -ArgumentList "/sagerun:1"

# 12. Windows Installer reparieren
Write-Host "12. Windows Installer reparieren..." -ForegroundColor Yellow
msiexec /unregister
msiexec /regserver

# 13. Windows-Verwaltungsinstrumentation (WMI) reparieren
Write-Host "13. WMI reparieren..." -ForegroundColor Yellow
winmgmt /salvagerepository

# 14. Energieplan-Einstellungen zurücksetzen
Write-Host "14. Energieplaneinstellungen zurücksetzen..." -ForegroundColor Yellow
powercfg -restoredefaultschemes

# 15. Internet Explorer-Einstellungen zurücksetzen
Write-Host "15. Internet Explorer-Einstellungen zurücksetzen..." -ForegroundColor Yellow
Start-Process -FilePath "$Env:ProgramFiles\Internet Explorer\iexplore.exe" -ArgumentList "-extoff -nohome"

# 16. Icon-Cache neu aufbauen
Write-Host "16. Icon-Cache neu aufbauen..." -ForegroundColor Yellow
ie4uinit.exe -show

# 17. Benutzerkontensteuerungseinstellungen reparieren
Write-Host "17. Benutzerkontensteuerungseinstellungen reparieren..." -ForegroundColor Yellow
Start-Process -FilePath "$Env:SystemRoot\System32\cmd.exe" -ArgumentList "/k $Env:SystemRoot\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f"

# 18. Alternative Methode zur Reparatur von Windows Update-Komponenten
Write-Host "18. Windows Update-Komponenten (alternative Methode) reparieren..." -ForegroundColor Yellow
Stop-Service bits, wuauserv, appidsvc, cryptsvc
Remove-Item "$Env:ALLUSERSPROFILE\Application Data\Microsoft\Network\Downloader\qmgr.dat" -Force
cd /d $Env:SystemRoot\system32
regsvr32.exe /s atl.dll, urlmon.dll, mshtml.dll
netsh winsock reset
netsh winhttp reset proxy
Start-Service bits, wuauserv, appidsvc, cryptsvc

# 19. Ereignisanzeige reparieren
Write-Host "19. Ereignisanzeige reparieren..." -ForegroundColor Yellow
wevtutil el | ForEach-Object {wevtutil cl "$_"}

# 20. Netzwerkadapter zurücksetzen
Write-Host "20. Netzwerkadapter zurücksetzen..." -ForegroundColor Yellow
netsh winsock reset
netsh int ip reset

# 21. Windows Defender aktualisieren und vollständigen Scan durchführen
Write-Host "21. Windows Defender aktualisieren und vollständigen Systemscan durchführen..." -ForegroundColor Yellow
Update-MpSignature
Start-MpScan -ScanType FullScan

# 22. Festplatte defragmentieren
Write-Host "22. Festplatte defragmentieren..." -ForegroundColor Yellow
Optimize-Volume -DriveLetter C -Defrag

# 23. Auslagerungsdatei-Größe optimieren
Write-Host "23. Auslagerungsdatei-Größe optimieren..." -ForegroundColor Yellow
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=True

# 24. Windows-Zeitdienst reparieren
Write-Host "24. Windows-Zeitdienst reparieren..." -ForegroundColor Yellow
Stop-Service w32time
w32tm /unregister
w32tm /register
Start-Service w32time
w32tm /resync

# 25. Auswahl für Neustart
Write-Host "25. Möchten Sie den Computer jetzt neu starten?" -ForegroundColor Yellow
$neustart = Read-Host "Geben Sie 'J' für jetzt oder 'S' für später ein"

if ($neustart -eq 'J') {
    Write-Host "Der Computer wird jetzt neu gestartet." -ForegroundColor Green
    Restart-Computer -Force
} else {
    Write-Host "Der Neustart wurde verschoben. Bitte denken Sie daran, den Computer manuell neu zu starten." -ForegroundColor Green
}

Write-Host "Reparaturvorgang abgeschlossen." -ForegroundColor Green