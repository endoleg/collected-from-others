<#
.SYNOPSIS
    Optimierte Windows-Härtung auf Basis der bereitgestellten Registry-JSON.
    https://github.com/HotCakeX/Harden-Windows-Security/blob/main/Harden%20System%20Security/Resources/MiscellaneousConfigurations.json

.DESCRIPTION
    - Analysiert eine kuratierte, risikoarme Windows-Baseline ausschließlich für HKLM.
    - HKCU wird nur informativ geprüft, falls entsprechende Policy-Pfade existieren.
    - Zeigt vor jeder Änderung Wirkung, Sollwert, HKLM- und HKCU-Status.
    - Fragt per Popup, ob die HKLM-Änderungen angewendet werden sollen.

    Bewusst NICHT automatisch gesetzt:
      - DriverLoadPolicy (widersprüchliche Werte 1 und 8 in der Quelle)
      - EnableScripts = 0 (blockiert PowerShell-Skripte)
      - AMSI FeatureBits = 2 (spezifisch, nicht als Universal-Baseline)
      - EnableFindMyFiles = 1 (kein Policy-Zweig, keine Sicherheitsbaseline)
      - NoRun = 1 (starke Usability-Einschränkung, geringer Sicherheitsgewinn)

    WICHTIG: Erfordert Administratorrechte!
#>

If (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Dieses Skript muss zwingend mit Administratorrechten (Elevated) ausgeführt werden!"
    Exit
}

$HklmRoot = "HKLM:"
$HkcuRoot = "HKCU:"

$WindowsConfigurations = @(
    # Protokolliert die komplette Kommandozeile bei Prozesserstellung.
    # Verbessert die Erkennbarkeit verdächtiger Prozesse in Event Log/SIEM.
    @{
        RelativePath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
        Name = "ProcessCreationIncludeCmdLine_Enabled"
        Value = 1
        Type = "DWord"
        Desc = "ProcessCreationIncludeCmdLine_Enabled"
        Effect = "Nimmt die vollständige Kommandozeile in Prozesserstellungs-Ereignisse auf."
    },

    # Aktiviert Kerberos Claims, Compound Identity und Armor.
    # Stärkt Authentifizierung und schützt Kerberos-Tickets stärker.
    @{
        RelativePath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"
        Name = "EnableCbacAndArmor"
        Value = 1
        Type = "DWord"
        Desc = "EnableCbacAndArmor"
        Effect = "Aktiviert Kerberos Claims, Compound Identity und Armor."
    },

    # Deaktiviert den Windows-Standortdienst.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors"
        Name = "DisableLocation"
        Value = 1
        Type = "DWord"
        Desc = "DisableLocation"
        Effect = "Deaktiviert den Windows-Standortdienst."
    },

    # Blockiert Standortzugriff durch Skripte.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors"
        Name = "DisableLocationScripting"
        Value = 1
        Type = "DWord"
        Desc = "DisableLocationScripting"
        Effect = "Blockiert den Zugriff auf Standortinformationen durch Skripte."
    },

    # Deaktiviert den Windows-Standortanbieter.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors"
        Name = "DisableWindowsLocationProvider"
        Value = 1
        Type = "DWord"
        Desc = "DisableWindowsLocationProvider"
        Effect = "Deaktiviert den Windows-Standortanbieter."
    },

    # Aktiviert Mitigationen für Svchost-Prozesse.
    @{
        RelativePath = "SYSTEM\CurrentControlSet\Control\SCMConfig"
        Name = "EnableSvchostMitigationPolicy"
        Value = 1
        Type = "DWord"
        Desc = "EnableSvchostMitigationPolicy"
        Effect = "Aktiviert Härtungsmaßnahmen für Svchost-Prozesse."
    },

    # Aktiviert Unterstützung für lange Windows-Pfade über 260 Zeichen.
    # Keine Sicherheitsmaßnahme, aber wichtig für Kompatibilität moderner Anwendungen.
    @{
        RelativePath = "SYSTEM\CurrentControlSet\Control\FileSystem"
        Name = "LongPathsEnabled"
        Value = 1
        Type = "DWord"
        Desc = "LongPathsEnabled"
        Effect = "Ermöglicht Pfade länger als 260 Zeichen, sofern die Anwendung dies unterstützt."
    },

    # Aktiviert Windows Protected Print.
    # Achtung: Kann ältere Druckertreiber oder Spezialdrucker beeinträchtigen.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows NT\Printers\WPP"
        Name = "WindowsProtectedPrintGroupPolicyState"
        Value = 1
        Type = "DWord"
        Desc = "WindowsProtectedPrintGroupPolicyState"
        Effect = "Aktiviert Windows Protected Print und reduziert die Abhängigkeit von Drittanbieter-Druckertreibern."
    },

    # Deaktiviert Online-Tipps in Windows-Einstellungen.
    @{
        RelativePath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        Name = "AllowOnlineTips"
        Value = 0
        Type = "DWord"
        Desc = "AllowOnlineTips"
        Effect = "Deaktiviert Online-Tipps und empfohlene Inhalte in den Windows-Einstellungen."
    },

    # Deaktiviert 'Meine Geräte suchen'.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\FindMyDevice"
        Name = "AllowFindMyDevice"
        Value = 0
        Type = "DWord"
        Desc = "AllowFindMyDevice"
        Effect = "Deaktiviert 'Meine Geräte suchen'."
    },

    # Blockiert automatische Sprachmodell-Updates.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Speech"
        Name = "AllowSpeechModelUpdate"
        Value = 0
        Type = "DWord"
        Desc = "AllowSpeechModelUpdate"
        Effect = "Blockiert automatische Updates der Spracherkennungsmodelle."
    },

    # Deaktiviert die Werbe-ID.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
        Name = "DisabledByGroupPolicy"
        Value = 1
        Type = "DWord"
        Desc = "DisabledByGroupPolicy"
        Effect = "Deaktiviert die Windows-Werbe-ID."
    },

    # Deaktiviert vorgeschlagene Inhalte und Tipps von Microsoft.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        Name = "DisableSoftLanding"
        Value = 1
        Type = "DWord"
        Desc = "DisableSoftLanding"
        Effect = "Deaktiviert Windows-Tipps und vorgeschlagene Inhalte."
    },

    # Deaktiviert cloudoptimierte Inhalte.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        Name = "DisableCloudOptimizedContent"
        Value = 1
        Type = "DWord"
        Desc = "DisableCloudOptimizedContent"
        Effect = "Deaktiviert cloudoptimierte Windows-Inhalte."
    },

    # Unterdrückt Feedback-Anfragen von Windows.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        Name = "DoNotShowFeedbackNotifications"
        Value = 1
        Type = "DWord"
        Desc = "DoNotShowFeedbackNotifications"
        Effect = "Unterdrückt Feedback-Benachrichtigungen von Windows."
    },

    # Deaktiviert automatischen Download und Update von Kartendaten.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\Maps"
        Name = "AutoDownloadAndUpdateMapData"
        Value = 0
        Type = "DWord"
        Desc = "AutoDownloadAndUpdateMapData"
        Effect = "Deaktiviert automatische Kartendaten-Downloads und -Updates."
    },

    # Deaktiviert die Nachrichtensynchronisierung.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\Messaging"
        Name = "AllowMessageSync"
        Value = 0
        Type = "DWord"
        Desc = "AllowMessageSync"
        Effect = "Deaktiviert die Synchronisierung von Nachrichten."
    },

    # Deaktiviert Online-Font-Anbieter.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\System"
        Name = "EnableFontProviders"
        Value = 0
        Type = "DWord"
        Desc = "EnableFontProviders"
        Effect = "Deaktiviert Online-Font-Anbieter."
    },

    # Deaktiviert Continuity/Device Pairing über Microsoft-Konto.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\System"
        Name = "EnableCdp"
        Value = 0
        Type = "DWord"
        Desc = "EnableCdp"
        Effect = "Deaktiviert Continuity- und Geräteübergreifende-Funktionen über Microsoft-Konten."
    },

    # Deaktiviert App-URI-Handler.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\System"
        Name = "EnableAppUriHandlers"
        Value = 0
        Type = "DWord"
        Desc = "EnableAppUriHandlers"
        Effect = "Deaktiviert App-URI-Handler."
    },

    # Deaktiviert Websuche in Windows Search.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        Name = "DisableWebSearch"
        Value = 1
        Type = "DWord"
        Desc = "DisableWebSearch"
        Effect = "Deaktiviert Websuche in der Windows-Suche."
    },

    # Verhindert die Verwendung von Websuchergebnissen in der verbundenen Suche.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        Name = "ConnectedSearchUseWeb"
        Value = 0
        Type = "DWord"
        Desc = "ConnectedSearchUseWeb"
        Effect = "Verhindert Websuchergebnisse in der verbundenen Windows-Suche."
    },

    # Aktiviert den Certificate Padding Check für die 64-Bit-Kryptografie-Konfiguration.
    @{
        RelativePath = "SOFTWARE\Microsoft\Cryptography\Wintrust\Config"
        Name = "EnableCertPaddingCheck"
        Value = "1"
        Type = "String"
        Desc = "EnableCertPaddingCheck (64-bit)"
        Effect = "Aktiviert den Certificate Padding Check zur Abschwächung bestimmter PKI-Angriffe."
    },

    # Aktiviert den Certificate Padding Check für die 32-Bit-Kompatibilitätsansicht.
    @{
        RelativePath = "SOFTWARE\Wow6432Node\Microsoft\Cryptography\Wintrust\Config"
        Name = "EnableCertPaddingCheck"
        Value = "1"
        Type = "String"
        Desc = "EnableCertPaddingCheck (32-bit)"
        Effect = "Aktiviert den Certificate Padding Check auch für 32-Bit-Anwendungen."
    },

    # Erzwingt zusätzlichen Schutz für private Kryptografieschlüssel.
    @{
        RelativePath = "SOFTWARE\Policies\Microsoft\Cryptography"
        Name = "ForceKeyProtection"
        Value = 1
        Type = "DWord"
        Desc = "ForceKeyProtection"
        Effect = "Erzwingt zusätzlichen Schutz beim Zugriff auf private Kryptografieschlüssel."
    },

    # Erzwingt Berechtigungsprüfungen bei Verzeichnisänderungsbenachrichtigungen.
    @{
        RelativePath = "SYSTEM\CurrentControlSet\Policies"
        Name = "EnforceDirectoryChangeNotificationPermissionCheck"
        Value = 1
        Type = "DWord"
        Desc = "EnforceDirectoryChangeNotificationPermissionCheck"
        Effect = "Erzwingt Berechtigungsprüfungen bei Verzeichnisänderungsbenachrichtigungen."
    },

    # Erlaubt Edge-Updates auch über getaktete Verbindungen.
    # Achtung: Kann bei Mobilfunk-/Volumen-Tarifen Datenvolumen verbrauchen.
    @{
        RelativePath = "SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\ClientStateMedium\{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}"
        Name = "allowautoupdatesmetered"
        Value = 1
        Type = "DWord"
        Desc = "Edge Stable: Updates über getaktete Verbindungen"
        Effect = "Erlaubt automatische Microsoft-Edge-Stable-Updates auch über getaktete Verbindungen."
    },
    @{
        RelativePath = "SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\ClientStateMedium\{2CD8A007-E189-409D-A2C8-9AF4EF3C72AA}"
        Name = "allowautoupdatesmetered"
        Value = 1
        Type = "DWord"
        Desc = "Edge Beta: Updates über getaktete Verbindungen"
        Effect = "Erlaubt automatische Microsoft-Edge-Beta-Updates auch über getaktete Verbindungen."
    },
    @{
        RelativePath = "SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\ClientStateMedium\{0D50BFEC-CD6A-4F9A-964C-C7416E3ACB10}"
        Name = "allowautoupdatesmetered"
        Value = 1
        Type = "DWord"
        Desc = "Edge Dev: Updates über getaktete Verbindungen"
        Effect = "Erlaubt automatische Microsoft-Edge-Dev-Updates auch über getaktete Verbindungen."
    }
)

function Get-NormalizedValue {
    param($Value, [string]$Type)

    if ($null -eq $Value) { return $null }

    if ($Type -eq "DWord") {
        try { return [int]$Value } catch { return $Value }
    }

    return [string]$Value
}

function Get-RegistryValueInfo {
    param(
        [string]$Root,
        [string]$RelativePath,
        [string]$Name,
        [string]$Type
    )

    $fullPath = Join-Path -Path $Root -ChildPath $RelativePath

    $info = @{
        FullPath = $fullPath
        PathExists = $false
        Value = $null
    }

    if (Test-Path -Path $fullPath) {
        $info.PathExists = $true

        try {
            $raw = (Get-ItemProperty -Path $fullPath -Name $Name -ErrorAction Stop).$Name
            $info.Value = Get-NormalizedValue -Value $raw -Type $Type
        } catch {
            $info.Value = $null
        }
    }

    return $info
}

Add-Type -AssemblyName PresentationFramework

Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host " Windows-Härtung: HKLM-Baseline, HKCU nur zur Analyse" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan

$analysis = @()

foreach ($policy in $WindowsConfigurations) {
    $desired = Get-NormalizedValue -Value $policy.Value -Type $policy.Type

    $hklm = Get-RegistryValueInfo -Root $HklmRoot -RelativePath $policy.RelativePath -Name $policy.Name -Type $policy.Type
    $hkcu = Get-RegistryValueInfo -Root $HkcuRoot -RelativePath $policy.RelativePath -Name $policy.Name -Type $policy.Type

    $hklmOk = ($hklm.PathExists -and $null -ne $hklm.Value -and $hklm.Value -eq $desired)
    $hkcuConflict = ($hkcu.PathExists -and $null -ne $hkcu.Value -and $hkcu.Value -ne $desired)

    if ($hklmOk) {
        $overallStatus = "HKLM konform"
        $needsHklmChange = $false
    }
    else {
        $overallStatus = "HKLM abweichend oder fehlend"
        $needsHklmChange = $true
    }

    $analysis += [PSCustomObject]@{
        Description     = $policy.Desc
        Effect          = $policy.Effect
        RelativePath    = $policy.RelativePath
        Name            = $policy.Name
        DesiredValue    = $desired
        ValueType       = $policy.Type

        HklmPath        = $hklm.FullPath
        HklmValue       = $hklm.Value
        HklmOk          = $hklmOk
        NeedsHklmChange = $needsHklmChange

        HkcuPath        = $hkcu.FullPath
        HkcuValue       = $hkcu.Value
        HkcuConflict    = $hkcuConflict

        OverallStatus   = $overallStatus
    }
}

$hklmChanges = @($analysis | Where-Object { $_.NeedsHklmChange })
$hkcuConflicts = @($analysis | Where-Object { $_.HkcuConflict })
$conformCount = @($analysis | Where-Object { $_.HklmOk }).Count

Write-Host ""
Write-Host "Analyseergebnis:" -ForegroundColor Cyan
Write-Host "  - Richtlinien in der Baseline:           $($analysis.Count)" -ForegroundColor Cyan
Write-Host "  - HKLM konform:                          $conformCount" -ForegroundColor Green
Write-Host "  - HKLM abweichend / fehlend:             $($hklmChanges.Count)" -ForegroundColor Yellow
Write-Host "  - Abweichende HKCU-Werte (nur Hinweis):  $($hkcuConflicts.Count)" -ForegroundColor Yellow
Write-Host ""

foreach ($item in $analysis) {
    $color = if ($item.HklmOk) { "Green" } else { "Yellow" }

    Write-Host "[$($item.OverallStatus)] $($item.Desc)" -ForegroundColor $color
    Write-Host "    Wirkung: $($item.Effect)" -ForegroundColor Gray
    Write-Host "    Sollwert: $($item.DesiredValue) ($($item.ValueType))" -ForegroundColor DarkGray

    Write-Host "    HKLM: $(if ($item.HklmOk) { 'konform' } elseif ($null -eq $item.HklmValue) { 'nicht gesetzt' } else { "abweichend ($($item.HklmValue))" })" -ForegroundColor $(if ($item.HklmOk) { "Green" } else { "Yellow" })
    Write-Host "          $($item.HklmPath)\$($item.Name)" -ForegroundColor DarkGray

    if ($item.HkcuConflict) {
        Write-Host "    HKCU-KONFLIKT: $($item.HkcuValue)" -ForegroundColor Red
        Write-Host "                   $($item.HkcuPath)\$($item.Name)" -ForegroundColor DarkGray
        Write-Host "                   Hinweis: Abweichender Benutzerwert gefunden; HKCU wird nicht geändert." -ForegroundColor Red
    }
    else {
        Write-Host "    HKCU: $(if ($null -eq $item.HkcuValue) { 'nicht gesetzt' } else { "vorhanden ($($item.HkcuValue))" })" -ForegroundColor DarkGray
    }

    Write-Host ""
}

if ($hklmChanges.Count -eq 0) {
    Write-Host ""
    Write-Host "Die HKLM-Baseline ist bereits vollständig konform. Es werden keine Änderungen vorgenommen." -ForegroundColor Green

    if ($hkcuConflicts.Count -gt 0) {
        Write-Host "Es existieren weiterhin $($hkcuConflicts.Count) abweichende HKCU-Werte. Diese wurden nicht verändert." -ForegroundColor Yellow
    }

    return
}

$message = "Es wurden $($hklmChanges.Count) abweichende oder fehlende Windows-Richtlinien im HKLM-Bereich gefunden.`n`n" +
           "Zusätzlich wurden $($hkcuConflicts.Count) abweichende HKCU-Werte erkannt.`n" +
           "HKCU wird ausschließlich angezeigt und nicht verändert.`n`n" +
           "Sollen die HKLM-Richtlinien jetzt angewendet werden?"

$result = [System.Windows.MessageBox]::Show(
    $message,
    "Windows-Härtung bestätigen",
    [System.Windows.MessageBoxButton]::YesNo,
    [System.Windows.MessageBoxImage]::Warning,
    [System.Windows.MessageBoxResult]::No
)

if ($result -ne [System.Windows.MessageBoxResult]::Yes) {
    Write-Host ""
    Write-Host "Abgebrochen. Es wurden keine Registry-Werte geändert." -ForegroundColor Red
    return
}

Write-Host ""
Write-Host "Anwenden der HKLM-Baseline..." -ForegroundColor Cyan

foreach ($item in $hklmChanges) {
    if (-not (Test-Path -Path $item.HklmPath)) {
        New-Item -Path $item.HklmPath -Force | Out-Null
        Write-Host "[INFO] HKLM-Pfad erstellt: $($item.HklmPath)" -ForegroundColor DarkGray
    }

    Set-ItemProperty -Path $item.HklmPath `
                     -Name $item.Name `
                     -Value $item.DesiredValue `
                     -Type $item.ValueType `
                     -Force

    Write-Host "[HKLM GESETZT] $($item.Desc)" -ForegroundColor Yellow
    Write-Host "    Wirkung: $($item.Effect)" -ForegroundColor Gray
    Write-Host "    Wert: $($item.Name) -> $($item.DesiredValue) ($($item.ValueType))" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host " HKLM-Baseline angewendet. HKCU wurde nicht verändert." -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan
