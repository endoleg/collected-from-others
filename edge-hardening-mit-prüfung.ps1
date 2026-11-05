<#
.SYNOPSIS
    Optimierte, verbindliche Microsoft-Edge-Härtung.
    Ursprungsquelle: https://github.com/HotCakeX/Harden-Windows-Security/blob/main/Harden%20System%20Security/Resources/EdgeBrowserConfigurations.json

.DESCRIPTION
    - Wendet eine ausgewählte, risikoarme Edge-Sicherheitsbaseline ausschließlich unter HKLM an.
    - HKCU wird ausschließlich lesend geprüft, um mögliche abweichende Benutzerrichtlinien sichtbar zu machen.
    - Zeigt vor jeder Änderung Wirkung, Sollwert, HKLM- und HKCU-Status.
    - Fragt per Popup, ob die HKLM-Änderungen angewendet werden sollen.

    Entfernte bzw. nicht automatisch gesetzte Richtlinien:
      - DefaultShareAdditionalOSRegionSetting: unklare Wertsemantik / keine breit dokumentierte Sicherheitsbaseline.
      - RestrictCoreSharingOnRenderer: nicht stabil bzw. nicht allgemein dokumentiert.
      - PreferSlowKexAlgorithms / PreferSlowCiphers: CNSA-/CNSA-2-Compliance-Einstellungen, nicht für alle Umgebungen geeignet.
      - ExperimentationAndConfigurationServiceControl wird auf 0 gesetzt, nicht auf 2.

    WICHTIG: Erfordert Administratorrechte!
#>

If (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Dieses Skript muss zwingend mit Administratorrechten (Elevated) ausgeführt werden!"
    Exit
}

$EdgeHklmRoot = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
$EdgeHkcuRoot = "HKCU:\SOFTWARE\Policies\Microsoft\Edge"

# Verbindliche HKLM-Baseline
$EdgeConfigurations = @(
    # Blockiert Drittanbieter-Cookies und reduziert Cross-Site-Tracking.
    @{
        RelativePath = "Recommended"
        Name = "BlockThirdPartyCookies"
        Value = 1
        Type = "DWord"
        Desc = "BlockThirdPartyCookies"
        Effect = "Blockiert Drittanbieter-Cookies und verringert Cross-Site-Tracking."
    },

    # Verwendet verschlüsseltes DNS, wo verfügbar; bei Problemen ist ein Fallback auf reguläres DNS möglich.
    @{
        RelativePath = ""
        Name = "DnsOverHttpsMode"
        Value = "automatic"
        Type = "String"
        Desc = "DnsOverHttpsMode"
        Effect = "Aktiviert DNS over HTTPS im Automatic-Modus; bei Nichtverfügbarkeit wird reguläres DNS verwendet."
    },

    # Verbietet Basic Authentication über unverschlüsseltes HTTP.
    @{
        RelativePath = ""
        Name = "BasicAuthOverHttpEnabled"
        Value = 0
        Type = "DWord"
        Desc = "BasicAuthOverHttpEnabled"
        Effect = "Verbietet HTTP Basic Authentication über unverschlüsseltes HTTP."
    },

    # Unterbindet die Kommunikation mit dem Edge-Experimentation-and-Configuration-Service vollständig.
    @{
        RelativePath = ""
        Name = "ExperimentationAndConfigurationServiceControl"
        Value = 0
        Type = "DWord"
        Desc = "ExperimentationAndConfigurationServiceControl"
        Effect = "Deaktiviert die Kommunikation mit dem Microsoft-Experimentation-and-Configuration-Service."
    },

    # Aktiviert die isolierte Audio-Sandbox.
    @{
        RelativePath = ""
        Name = "AudioSandboxEnabled"
        Value = 1
        Type = "DWord"
        Desc = "AudioSandboxEnabled"
        Effect = "Aktiviert die isolierte Audio-Sandbox."
    },

    # Blockiert WebUSB-Zugriff durch Websites.
    @{
        RelativePath = ""
        Name = "DefaultWebUsbGuardSetting"
        Value = 2
        Type = "DWord"
        Desc = "DefaultWebUsbGuardSetting"
        Effect = "Blockiert den WebUSB-Zugriff für Websites."
    },

    # Blockiert die Window Management API für Websites.
    @{
        RelativePath = ""
        Name = "DefaultWindowManagementSetting"
        Value = 2
        Type = "DWord"
        Desc = "DefaultWindowManagementSetting"
        Effect = "Blockiert die Window Management API für Websites."
    },

    # Verhindert dynamischen Code im Edge-Browserprozess.
    # Achtung: Kann in seltenen Fällen Drucker-, Barrierefreiheits- oder Drittanbieter-Komponenten beeinträchtigen.
    @{
        RelativePath = ""
        Name = "DynamicCodeSettings"
        Value = 1
        Type = "DWord"
        Desc = "DynamicCodeSettings"
        Effect = "Verhindert dynamischen Code im Browserprozess und erhöht den Schutz vor Code-Injection."
    },

    # Aktiviert den erweiterten Sicherheitsmodus im Strict-Modus.
    # Achtung: Kann die Leistung und Kompatibilität einzelner Websites beeinträchtigen.
    @{
        RelativePath = ""
        Name = "EnhanceSecurityMode"
        Value = 2
        Type = "DWord"
        Desc = "EnhanceSecurityMode"
        Effect = "Aktiviert den erweiterten Sicherheitsmodus im Strict-Modus für alle Websites."
    },

    # Blockiert den Zugriff auf lokale Schriftarten und reduziert Font-basiertes Fingerprinting.
    @{
        RelativePath = ""
        Name = "DefaultLocalFontsSetting"
        Value = 2
        Type = "DWord"
        Desc = "DefaultLocalFontsSetting"
        Effect = "Blockiert den Zugriff von Websites auf lokale Schriftarten."
    },

    # Erzwingt Code Integrity im Edge-Browserprozess.
    @{
        RelativePath = ""
        Name = "BrowserCodeIntegritySetting"
        Value = 2
        Type = "DWord"
        Desc = "BrowserCodeIntegritySetting"
        Effect = "Erzwingt Code Integrity im Browserprozess und blockiert nicht vertrauenswürdigen Code."
    },

    # Startet Renderer-Prozesse in einem App Container für stärkere Isolation.
    @{
        RelativePath = ""
        Name = "RendererAppContainerEnabled"
        Value = 1
        Type = "DWord"
        Desc = "RendererAppContainerEnabled"
        Effect = "Startet Renderer-Prozesse in einem App Container für stärkere Isolierung."
    },

    # Blockiert ältere TLS-Cipher-Suiten ohne Forward Secrecy bzw. mit veralteten Sicherheitsmerkmalen.
    @{
        RelativePath = "TLSCipherSuiteDenyList"
        Name = "1"
        Value = "0xc013"
        Type = "String"
        Desc = "TLSCipherSuiteDenyList 1"
        Effect = "Blockiert ECDHE-ECDSA-AES128-SHA (0xc013)."
    },
    @{
        RelativePath = "TLSCipherSuiteDenyList"
        Name = "2"
        Value = "0xc014"
        Type = "String"
        Desc = "TLSCipherSuiteDenyList 2"
        Effect = "Blockiert ECDHE-ECDSA-AES256-SHA (0xc014)."
    },
    @{
        RelativePath = "TLSCipherSuiteDenyList"
        Name = "3"
        Value = "0x0035"
        Type = "String"
        Desc = "TLSCipherSuiteDenyList 3"
        Effect = "Blockiert RSA-AES256-SHA (0x0035), eine Suite ohne Forward Secrecy."
    },
    @{
        RelativePath = "TLSCipherSuiteDenyList"
        Name = "4"
        Value = "0x002f"
        Type = "String"
        Desc = "TLSCipherSuiteDenyList 4"
        Effect = "Blockiert RSA-AES128-SHA (0x002f), eine Suite ohne Forward Secrecy."
    },
    @{
        RelativePath = "TLSCipherSuiteDenyList"
        Name = "5"
        Value = "0x009c"
        Type = "String"
        Desc = "TLSCipherSuiteDenyList 5"
        Effect = "Blockiert RSA-AES128-GCM-SHA256 (0x009c), eine Suite ohne Forward Secrecy."
    },
    @{
        RelativePath = "TLSCipherSuiteDenyList"
        Name = "6"
        Value = "0x009d"
        Type = "String"
        Desc = "TLSCipherSuiteDenyList 6"
        Effect = "Blockiert RSA-AES256-GCM-SHA384 (0x009d), eine Suite ohne Forward Secrecy."
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

    $fullPath = if ([string]::IsNullOrWhiteSpace($RelativePath)) {
        $Root
    } else {
        Join-Path -Path $Root -ChildPath $RelativePath
    }

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
Write-Host " Optimierte Edge-Härtung: HKLM-Baseline, HKCU nur zur Analyse" -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan

$analysis = @()

foreach ($policy in $EdgeConfigurations) {
    $desired = Get-NormalizedValue -Value $policy.Value -Type $policy.Type

    $hklm = Get-RegistryValueInfo -Root $EdgeHklmRoot -RelativePath $policy.RelativePath -Name $policy.Name -Type $policy.Type
    $hkcu = Get-RegistryValueInfo -Root $EdgeHkcuRoot -RelativePath $policy.RelativePath -Name $policy.Name -Type $policy.Type

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
Write-Host "  - Richtlinien in der Baseline:            $($analysis.Count)" -ForegroundColor Cyan
Write-Host "  - HKLM konform:                           $conformCount" -ForegroundColor Green
Write-Host "  - HKLM abweichend / fehlend:              $($hklmChanges.Count)" -ForegroundColor Yellow
Write-Host "  - Abweichende HKCU-Werte (nur Hinweis):   $($hkcuConflicts.Count)" -ForegroundColor Yellow
Write-Host ""

foreach ($item in $analysis) {
    $color = if ($item.HklmOk) { "Green" } else { "Yellow" }

    Write-Host "[$($item.OverallStatus)] $($item.Description)" -ForegroundColor $color
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
        Write-Host "Es existieren weiterhin $($_hkcuConflicts.Count) abweichende HKCU-Werte. Diese wurden nicht verändert." -ForegroundColor Yellow
    }

    return
}

$message = "Es wurden $($hklmChanges.Count) abweichende oder fehlende Edge-Richtlinien im HKLM-Policy-Bereich gefunden.`n`n" +
           "Zusätzlich wurden $($hkcuConflicts.Count) abweichende HKCU-Werte erkannt.`n" +
           "HKCU wird ausschließlich angezeigt und nicht verändert.`n`n" +
           "Sollen die HKLM-Richtlinien jetzt angewendet werden?"

$result = [System.Windows.MessageBox]::Show(
    $message,
    "Edge-Härtung bestätigen",
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

    Write-Host "[HKLM GESETZT] $($item.Description)" -ForegroundColor Yellow
    Write-Host "    Wirkung: $($item.Effect)" -ForegroundColor Gray
    Write-Host "    Wert: $($item.Name) -> $($item.DesiredValue) ($($item.ValueType))" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "==================================================================" -ForegroundColor Cyan
Write-Host " HKLM-Baseline angewendet. HKCU wurde nicht verändert." -ForegroundColor Cyan
Write-Host "==================================================================" -ForegroundColor Cyan
