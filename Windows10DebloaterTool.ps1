<#
Windows 10 Debloater Tool (Version 2.5) from www.FreeTimeTech.com
Based on 2 PowerShell Scripts (1) Chris Titus Tech GitHub PowerShell Scripts (2020-23): https://github.com/ChrisTitusTech/win10script
and (2) farag2 Sophia Script for Windows GitHub PowerShell Scripts (2023): https://github.com/farag2/Sophia-Script-for-Windows

►Link: https://freetimetech.com/windows-10-clean-up-debloat-tool-by-ftt/
►YouTube: https://www.youtube.com/watch?v=3KTRS1RpBmg

Check our 'Windows 11 Debloater' from www.FreeTimeTech.com website: 
►Link: https://freetimetech.com/windows-11-debloater-tool-debloat-gui/

Check our full GUI (C#+WPF) version called 'SophiApp' on GitHub:
►Link: https://github.com/Sophia-Community/SophiApp
This other version is made in collaboration with farag2 (Dmitry Nefedov) and Inestic (Dmitry Demin).

Check our other version of Windows 10/11 Debloater called 'Sophia Script for Windows' on BenchTweakGaming.com website: 
►Link: https://benchtweakgaming.com/2020/10/27/windows-10-debloat-tool/
This other version is made in collaboration with farag2 (Dmitry Nefedov) and Inestic (Dmitry Demin).
#>

#region Third

# Install winget
Function InstallFTTProgs {
            # Check if winget is installed
            if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe){
                        Write-Output "Winget Already Installed."
            }  
            else{
                        # Installing winget from the Microsoft Store
                        Write-Output "Winget not found, installing it now."
                        Start-Process "ms-appinstaller:?source=https://aka.ms/getwinget"
                        $nid = (Get-Process AppInstaller).Id
                        Wait-Process -Id $nid
                        Write-Output "Winget Installed"    
            }           
}

# Install Brave
Function InstallBrave {
            Write-Output "Installing Brave"
            winget install -e --id Brave.Brave
}

# Uninstall Brave
Function UninstallBrave {
            Write-Output "Uninstalling Brave"
            winget uninstall -e --id Brave.Brave
}

# Install Google Chrome
Function InstallChrome {
            Write-Output "Installing Google Chrome"
            winget install -e --id Google.Chrome
}

# Uninstall Google Chrome
Function UninstallChrome {
            Write-Output "Uninstalling Google Chrome"
            winget uninstall -e --id Google.Chrome
}

# Install Chromium
Function InstallChromium {
            Write-Output "Installing Chromium"
            winget install -e --id eloston.ungoogled-chromium
}

# Uninstall Chromium
Function UninstallChromium {
            Write-Output "Uninstalling Chromium"
            winget uninstall -e --id eloston.ungoogled-chromium
}

# Install Firefox
Function InstallFirefox {     
            Write-Output "Installing Firefox"
            winget install -e --id Mozilla.Firefox
}

# Uninstall Firefox
Function UninstallFirefox {
            Write-Output "Uninstalling Firefox"
            winget uninstall -e --id Mozilla.Firefox
}

# Install LibreWolf
Function InstallLibreWolf { 
            Write-Output "Installing LibreWolf"
            winget install -e --id LibreWolf.LibreWolf
}

# Uninstall LibreWolf
Function UninstallLibreWolf {
            Write-Output "Uninstalling LibreWolf"
            winget uninstall -e --id LibreWolf.LibreWolf
}

# Install Tor Browser
Function InstallTorBrowser {         
            Write-Output "Installing Tor Browser"
            winget install -e --id TorProject.TorBrowser
}

# Uninstall Tor Browser
Function UninstallTorBrowser {
            Write-Output "Uninstalling Tor Browser"
            winget uninstall -e --id TorProject.TorBrowser
}

# Install Vivaldi
Function InstallVivaldi {      
            Write-Output "Installing Vivaldi"
            winget install -e --id VivaldiTechnologies.Vivaldi
}

# Uninstall Vivaldi
Function UninstallVivaldi {
            Write-Output "Uninstalling Vivaldi"
            winget uninstall -e --id VivaldiTechnologies.Vivaldi
}

# Install Discord
Function InstallDiscord {
            Write-Output "Installing Discord"
            winget install -e --id Discord.Discord
}

# Uninstall Discord
Function UninstallDiscord {
            Write-Output "Uninstalling Discord"
            winget uninstall -e --id Discord.Discord
}

# Install Teams
Function InstallTeams {
            Write-Output "Installing Teams"
            winget install -e --id Microsoft.Teams
}

# Uninstall Teams
Function UninstallTeams {
            Write-Output "Uninstalling Teams"
            winget uninstall -e --id Microsoft.Teams
}

# Install Zoom
Function InstallZoom {
            Write-Output "Installing Zoom"
            winget install -e --id Microsoft.Teams
}

# Uninstall Zoom
Function UninstallZoom {
            Write-Output "Uninstalling Zoom"
            winget uninstall -e --id Microsoft.Teams
}

# Install Adobe Reader
Function InstallAdobe {
            Write-Output "Installing Adobe Acrobat Reader"
            winget install -e --id Adobe.Acrobat.Reader.64-bit
}

# Uninstall Adobe Reader
Function UninstallAdobe {
            Write-Output "Uninstalling Adobe Acrobat Reader"
            winget uninstall -e --id Adobe.Acrobat.Reader.64-bit
}

# Install Foxit PDF Reader
Function InstallFoxitReader {
            Write-Output "Installing Foxit PDF Reader"
            winget install -e --id Foxit.FoxitReader
}

# Uninstall Foxit PDF Reader
Function UninstallFoxitReader {
            Write-Output "Uninstalling Foxit PDF Reader"
            winget uninstall -e --id Foxit.FoxitReader
}

# Install GIMP
Function InstallGIMP {
            Write-Output "Installing GIMP"
            winget install -e --id GIMP.GIMP
}

# Uninstall GIMP
Function UninstallGIMP {
            Write-Output "Uninstalling GIMP"
            winget uninstall -e --id GIMP.GIMP
}

# Install ImageGlass
Function InstallImageGlass {
            Write-Output "Installing Image Glass"
            winget install -e DuongDieuPhap.ImageGlass
}

# Uninstall ImageGlass
Function UninstallImageGlass {
            Write-Output "Uninstalling ImageGlass"
            winget uninstall -e --id DuongDieuPhap.ImageGlass
}

# Install Irfanview
Function InstallIrfanview {
            Write-Output "Installing Irfanview"
            winget install -e --id IrfanSkiljan.IrfanView
}

# Uninstall Irfanview
Function UninstallIrfanview {
            Write-Output "Uninstalling Irfanview"
            winget uninstall -e --id IrfanSkiljan.IrfanView
}

# Install Joplin
Function InstallJoplin {
            Write-Output "Installing Joplin"
            winget install -e --id Joplin.Joplin
}

# Uninstall Joplin
Function UninstallJoplin {
            Write-Output "Uninstalling Joplin"
            winget uninstall -e --id Joplin.Joplin
}

# Install LibreOffice
Function InstallLibreOffice {
            Write-Output "Installing LibreOffice"
            winget install -e --id TheDocumentFoundation.LibreOffice
}

# Uninstall LibreOffice
Function UninstallLibreOffice {
            Write-Output "Uninstalling LibreOffice"
            winget uninstall -e --id TheDocumentFoundation.LibreOffice
}

# Install Notepad++
Function InstallNotepadplusplus {
            Write-Output "Installing Notepad++"
            winget install -e --id Notepad++.Notepad++
}

# Uninstall Notepad++
Function UninstallNotepadplusplus {
            Write-Output "Uninstalling Notepad++"
            winget uninstall -e --id Notepad++.Notepad++
}

# Install Obsidian
Function InstallObsidian {
            Write-Output "Installing Obsidian"
            winget install -e --id Obsidian.Obsidian
}

# Uninstall Obsidian
Function UninstallObsidian {
            Write-Output "Uninstalling Obsidian"
            winget uninstall -e --id Obsidian.Obsidian
}

# Install ONLYOFFICE Desktop Editors
Function InstallONLYOFFICEDesktopEditors {
            Write-Output "Installing ONLYOFFICE Desktop Editors"
            winget install -e --id ONLYOFFICE.DesktopEditors
}

# Uninstall ONLYOFFICE Desktop Editors
Function UninstallONLYOFFICEDesktopEditors {
            Write-Output "Uninstalling ONLYOFFICE Desktop Editors"
            winget uninstall -e --id ONLYOFFICE.DesktopEditors
}

# Install Apache OpenOffice
Function InstallApacheOpenOffice {
            Write-Output "Installing Apache OpenOffice"
            winget install -e --id Apache.OpenOffice
}

# Uninstall Apache OpenOffice
Function UninstallApacheOpenOffice {
            Write-Output "Uninstalling Apache OpenOffice"
            wwinget uninstall -e --id Apache.OpenOffice
}

# Install Apache OpenOffice
Function InstallApacheOpenOffice {
            Write-Output "Installing Apache OpenOffice"
            winget install -e --id Apache.OpenOffice
}

# Uninstall Apache OpenOffice
Function UninstallApacheOpenOffice {
            Write-Output "Uninstalling Apache OpenOffice"
            winget uninstall -e --id Apache.OpenOffice
}

# Install SumatraPDF
Function InstallSumatraPDF {
            Write-Output "Installing SumatraPDF"
            winget install -e --id SumatraPDF.SumatraPDF
}

# Uninstall SumatraPDF
Function UninstallSumatraPDF {
            Write-Output "Uninstalling SumatraPDF"
            winget uninstall -e --id SumatraPDF.SumatraPDF
}

# Install WinMerge
Function InstallWinMerge {
            Write-Output "Installing WinMerge"
            winget install -e --id WinMerge.WinMerge
}

# Uninstall WinMerge
Function UninstallWinMerge {
            Write-Output "Uninstalling WinMerge"
            winget uninstall -e --id WinMerge.WinMerge
}

# Install Microsoft PowerToys
Function InstallPowertoys {
            Write-Output "Installing Microsoft PowerToys"
            winget install -e --id Microsoft.PowerToys
}

# Uninstall Microsoft PowerToys
Function UninstallPowertoys {
            Write-Output "Uninstalling Microsoft PowerToys"
            winget uninstall -e --id Microsoft.PowerToys
}

# Install Microsoft Terminal
Function InstallTerminal {  
            Write-Output "Installing Microsoft Terminal"
            winget install -e --id Microsoft.WindowsTerminal
}

# Uninstall Microsoft Terminal
Function UninstallTerminal {
            Write-Output "Uninstalling Microsoft Terminal"
            winget uninstall -e --id Microsoft.WindowsTerminal
}

# Install Media Player Classic
Function InstallMediaPlayerClassic {
            Write-Output "Installing Media Player Classic"
            winget install -e --id clsid2.mpc-hc
}

# Uninstall Media Player Classic
Function UninstallMediaPlayerClassic {
            Write-Output "Uninstalling Media Player Classic"
            winget uninstall -e --id clsid2.mpc-hc
}

# Install VLC media player
Function InstallVLCMediaPlayer {
            Write-Output "Installing VLC media player"
            winget install -e --id VideoLAN.VLC
}

# Uninstall VLC media player
Function UninstallVLCMediaPlayer {
            Write-Output "Uninstalling VLC media player"
            winget uninstall -e --id VideoLAN.VLC
}

# Install 7-Zip
Function Install7Zip {
            Write-Output "Installing 7-Zip"
            winget install -e --id 7zip.7zip
}

# Uninstall 7-Zip
Function Uninstall7Zip {
            Write-Output "Uninstalling 7-Zip"
            winget uninstall -e --id 7zip.7zip
}

# Install Advanced IP Scanner
Function InstallAdvancedIPScanner {
            Write-Output "Installing Advanced IP Scanner"
            winget install -e --id Famatech.AdvancedIPScanner
}

# Uninstall Advanced IP Scanner
Function UninstallAdvancedIPScanner {
            Write-Output "Uninstalling Advanced IP Scanner"
            winget uninstall -e --id Famatech.AdvancedIPScanner
}

# Install AnyDesk
Function InstallAnyDesk {
            Write-Output "Installing AnyDesk"
            winget install -e --id AnyDeskSoftwareGmbH.AnyDesk
}

# Uninstall AnyDesk
Function UninstallAnyDesk {
            Write-Output "Uninstalling AnyDesk"
            winget uninstall -e --id AnyDeskSoftwareGmbH.AnyDesk
}

# Install AutoHotkey
Function InstallAutoHotkey {
            Write-Output "Installing AutoHotkey"
            winget install -e --id Lexikos.AutoHotkey
}

# Uninstall AutoHotkey
Function UninstallAutoHotkey {
            Write-Output "Uninstalling AutoHotkey"
            winget uninstall -e --id Lexikos.AutoHotkey
}

# Install CPU-Z
Function InstallCPUZ {
            Write-Output "Installing CPU-Z"
            winget install -e --id CPUID.CPU-Z
}

# Uninstall CPU-Z
Function UninstallCPUZ {
            Write-Output "Uninstalling CPU-Z"
            winget uninstall -e --id CPUID.CPU-Z
}

# Install Etcher USB Creator
Function InstallEtcherUSBCreator {
            Write-Output "Installing Etcher USB Creator"
            winget install -e --id Balena.Etcher
}

# Uninstall Etcher USB Creator
Function UninstallEtcherUSBCreator {
            Write-Output "Uninstalling Etcher USB Creator"
            winget uninstall -e --id Balena.Etcher
}

# Install GPU-Z
Function InstallGPUZ {
            Write-Output "Installing GPU-Z"
            winget install -e --id TechPowerUp.GPU-Z
}

# Uninstall GPU-Z
Function UninstallGPUZ {
            Write-Output "Uninstalling GPU-Z"
            winget uninstall -e --id TechPowerUp.GPU-Z
}

# Install Glary Utilities
Function InstallGlaryUtilities {
            Write-Output "Installing Glary Utilities"
            winget install -e --id Glarysoft.GlaryUtilities
}

# Uninstall Glary Utilities
Function UninstallGlaryUtilities {
            Write-Output "Uninstalling Glary Utilities"
            wwinget uninstall -e --id Glarysoft.GlaryUtilities
}

# Install Java
Function InstallJava {
            Write-Output "Installing Java"
            winget install -e --id Oracle.JavaRuntimeEnvironment
}

# Uninstall Java
Function UninstallJava {
            Write-Output "Uninstalling Java"
            winget uninstall -e --id Oracle.JavaRuntimeEnvironment       
}

# Install HWiNFO
Function InstallHWiNFO {
            Write-Output "Installing HWiNFO"
            winget install -e --id REALiX.HWiNFO
}

# Uninstall HWiNFO
Function UninstallHWiNFO {
            Write-Output "Uninstalling HWiNFO"
            winget uninstall -e --id REALiX.HWiNFO           
}

# Install Internet Download Manager
Function InstallInternetDownloadManager {
            Write-Output "Installing Internet Download Manager"
            winget install -e --id Tonec.InternetDownloadManager
}

# Uninstall Internet Download Manager
Function UninstallInternetDownloadManager {
            Write-Output "Uninstalling Internet Download Manager"
            winget uninstall -e --id Tonec.InternetDownloadManager
}

# Install NVCleanstall
Function InstallNVCleanstall {
            Write-Output "Installing NVCleanstall"
            winget install -e --id TechPowerUp.NVCleanstall
}

# Uninstall NVCleanstall
Function UninstallNVCleanstall {
            Write-Output "Uninstalling NVCleanstall"
            winget uninstall -e --id TechPowerUp.NVCleanstall
}

# Install Process Lasso
Function InstallProcessLasso {
            Write-Output "Installing Process Lasso"
            winget install -e --id BitSum.ProcessLasso
}

# Uninstall Process Lasso
Function UninstallProcessLasso {
            Write-Output "Uninstalling Process Lasso"
            winget uninstall -e --id BitSum.ProcessLasso
}

# Install PuTTY
Function InstallPuTTY {
            Write-Output "Installing PuTTY"
            winget install -e --id PuTTY.PuTTY
}

# Uninstall PuTTY
Function UninstallPuTTY {
            Write-Output "Uninstalling PuTTY"
            winget uninstall -e --id PuTTY.PuTTY
}

# Install Revo Uninstaller
Function InstallRevoUninstaller {
            Write-Output "Installing Revo Uninstaller"
            winget install -e --id RevoUninstaller.RevoUninstaller
}

# Uninstall Revo Uninstaller
Function UninstallRevoUninstaller {
            Write-Output "Uninstalling Revo Uninstaller"
            winget uninstall -e --id RevoUninstaller.RevoUninstaller
}

# Install Rufus Imager
Function InstallRufusImager {
            Write-Output "Installing Rufus Imager"
            winget install -e --id Rufus.Rufus
}

# Uninstall Rufus Imager
Function UninstallRufusImager {
            Write-Output "Uninstalling Rufus Imager"
            wwinget uninstall -e --id Rufus.Rufus
}

# Install ShareX Screenshot Tool
Function InstallShareX {
            Write-Output "Installing ShareX Screenshot Tool"
            winget install -e --id ShareX.ShareX
}

# Uninstall ShareX Screenshot Tool
Function UninstallShareX {
            Write-Output "Uninstalling ShareX Screenshot Tool"
            winget uninstall -e --id ShareX.ShareX
}

# Install Shell
Function InstallShell {
            Write-Output "Installing Open-Shell-Menu"
            winget install -e --id Open-Shell.Open-Shell-Menu
}

# Uninstall Shell
Function UninstallShell {
            Write-Output "Uninstalling Open-Shell-Menu"
            winget uninstall -e --id Open-Shell.Open-Shell-Menu
}

# Install TeamViewer
Function InstallTeamViewer {
            Write-Output "Installing TeamViewer"
            winget install -e --id TeamViewer.TeamViewer
}

# Uninstall TeamViewer
Function UninstallTeamViewer {
            Write-Output "Uninstalling TeamViewer"
            winget uninstall -e --id TeamViewer.TeamViewer
}

# Install Translucent Taskbar
Function InstallTranslucentTB {
            Write-Output "Installing Translucent Taskbar"
            winget install TranslucentTB
}

# Uninstall Translucent Taskbar
Function UninstallTranslucentTB {
            Write-Output "Uninstalling Translucent Taskbar"
            winget install TranslucentTB
}

# Install WinSCP
Function InstallWinSCP {
            Write-Output "Installing WinSCP"
            winget install -e --id WinSCP.WinSCP
}

# Uninstall WinSCP
Function UninstallWinSCP {
            Write-Output "Uninstall WinSCP"
            winget uninstall -e --id WinSCP.WinSCP
}

# Install voidtools Everything Search
Function InstallvoidtoolsEverything {
            Write-Output "Installing voidtools Everything Search"
            winget install -e --id voidtools.Everything
}

# Uninstall voidtools Everything Search
Function UninstallvoidtoolsEverything {
            Write-Output "Uninstalling voidtools Everything Search"
            winget uninstall -e --id voidtools.Everything
}

# Install Visual Studio Code
Function InstallVisualStudioCode {
            Write-Output "Installing Visual Studio Code"
            winget install -e Microsoft.VisualStudioCode --source winget
}

# Do not install Visual Studio Code
Function DoNotInstallVisualStudioCode {
            Write-Output "Not installing Visual Studio Code"
}

# Install VS Codium
Function InstallVSCodium {
            Write-Output "Installing VS Codium"
            winget install -e VSCodium.VSCodium
}

# Do not install VS Codium
Function DoNotInstallVSCodium {
            Write-Output "Not installing VS Codium"
}

# Install GitHub Desktop
Function InstallGitHubDesktop {
            Write-Output "Installing GitHub Desktop"
            winget install -e GitHub.GitHubDesktop
}

# Do not install GitHub Desktop
Function DoNotInstallGitHubDesktop {
            Write-Output "Not installing GitHub Desktop"
}

#endregion Third


#region Windows Apps

# Uninstall Microsoft Edge
Function UninstallMicrosoftEdge {
            Write-Output "Trying to uninstall Microsoft Edge"
            winget uninstall -e --id Microsoft.Edge
}

# Install Microsoft Edge
Function InstallMicrosoftEdge {
            Write-Output "Trying to install Microsoft Edge"
            winget install -e --id Microsoft.Edge
}

# Uninstall Cortana
Function UninstallCortana {
            Write-Output "Trying to uninstall Cortana"
            winget uninstall "Cortana"
}

# Install Cortana
Function InstallCortana {
            Write-Output "Trying to install Cortana"
            winget install "Cortana"
}

# Uninstall MSNWeather
Function UninstallMSNWeather {
            Write-Output "Trying to uninstall MSN Weather"
            winget uninstall "MSN Weather"
}

# Install MSNWeather
Function InstallMSNWeather {
            Write-Output "Trying to install MSN Weather"
            winget install "MSN Weather"
}

# Uninstall Get Help
Function UninstallGetHelp {
            Write-Output "Trying to uninstall Get Help"       
            winget uninstall "Get Help" 
}

# Install Get Help
Function InstallGetHelp {
            Write-Output "Trying to install Get Help" 
            winget install "Get Help"    
}

# Uninstall Microsoft Tips
Function UninstallMicrosoftTips {
            Write-Output "Trying to uninstall Microsoft Tips"          
            winget uninstall "Microsoft Tips"   
}

# Install Microsoft Tips
Function InstallMicrosoftTips {
            Write-Output "Trying to install Microsoft Tips"   
            winget install "Microsoft Tips"       
}

# Uninstall HEIF Image Extensions
Function UninstallHEIFImageExtensions {
            Write-Output "Trying to uninstall HEIF Image Extensions"
            winget uninstall "HEIF Image Extensions"         
}

# Install HEIF Image Extensions
Function InstallHEIFImageExtensions {
            Write-Output "Trying to install HEIF Image Extensions"
            winget install "HEIF Image Extensions" 
}

# Uninstall Paint 3D
Function UninstallPaint3D {
            Write-Output "Trying to uninstall Paint 3D"        
            winget uninstall "Paint 3D" 
}

# Install Paint 3D
Function InstallPaint3D {
            Write-Output "Trying to install Paint 3D" 
            winget install "Paint 3D"     
}

# Uninstall 3D Viewer
Function Uninstall3DViewer {
            Write-Output "Trying to uninstall 3D Viewer"     
            winget uninstall "3D Viewer"         
}

# Install 3D Viewer
Function Install3DViewer {
            Write-Output "Trying to install 3D Viewer"         
            winget install "3D Viewer"  
}

# Uninstall Office
Function UninstallOffice {
            Write-Output "Trying to uninstall Office"
            winget uninstall "Office"     
}

# Install Office
Function InstallOffice {
            Write-Output "Trying to install Office"
            winget install "Office"         
}

# Uninstall Microsoft Solitaire Collection
Function UninstallMicrosoftSolitaireCollection {
            Write-Output "Trying to uninstall Microsoft Solitaire Collection"        
            winget uninstall "Microsoft Solitaire Collection"
}

# Install Microsoft Solitaire Collection
Function InstallMicrosoftSolitaireCollection {
            Write-Output "Trying to install Microsoft Solitaire Collection" 
            winget install "Microsoft Solitaire Collection"
}

# Uninstall Microsoft Sticky Notes
Function UninstallMicrosoftStickyNotes {
            Write-Output "Trying to uninstall Microsoft Sticky Notes"       
            winget uninstall "Microsoft Sticky Notes"
}

# Install Microsoft Sticky Notes
Function InstallMicrosoftStickyNotes {
            Write-Output "Trying to install Microsoft Sticky Notes" 
            winget install "Microsoft Sticky Notes"
}

# Uninstall Mixed Reality Portal
Function UninstallMixedRealityPortal {
            Write-Output "Trying to uninstall Mixed Reality Portal"           
            winget uninstall "Mixed Reality Portal"    
}

# Install Mixed Reality Portal
Function InstallMixedRealityPortal {
            Write-Output "Trying to install Mixed Reality Portal"    
            winget install "Mixed Reality Portal"        
}

# Uninstall OneNote
Function UninstallOneNote {
            Write-Output "Trying to uninstall OneNote"       
            winget uninstall "OneNote"
}

# Install OneNote
Function InstallOneNote {
            Write-Output "Trying to install OneNote"            
            winget install "OneNote"
}

# Uninstall Microsoft People
Function UninstallMicrosoftPeople {
            Write-Output "Trying to uninstall Microsoft People"
            winget uninstall "Microsoft People"
}

# Install Microsoft People
Function InstallMicrosoftPeople {
            Write-Output "Trying to install Microsoft People"
            winget install "Microsoft People"
}

# Uninstall Snip & Sketch
Function UninstallSnipSketch {
            Write-Output "Trying to uninstall Snip & Sketch"          
            winget uninstall "Snip & Sketch"  
}

# Install Snip & Sketch
Function InstallSnipSketch {
            Write-Output "Trying to install Snip & Sketch"   
            winget install "Snip & Sketch"       
}

# Uninstall Skype
Function UninstallSkype {
            Write-Output "Trying to uninstall Skype" 
            winget uninstall "Skype"
}

# Install Skype
Function InstallSkype {
            Write-Output "Trying to install Skype"     
            winget install "Skype"
}

# Uninstall Store Experience Host
Function UninstallStoreExperienceHost {
            Write-Output "Trying to uninstall Store Experience Host"
            winget uninstall "Store Experience Host"           
}

# Install Store Experience Host
Function InstallStoreExperienceHost {
            Write-Output "Trying to install Store Experience Host"
            winget install "Store Experience Host"    
}

# Uninstall VP9 Video Extensions
Function UninstallVP9VideoExtensions {
            Write-Output "Trying to uninstall VP9 Video Extensions"       
            winget uninstall "VP9 Video Extensions"
}

# Install VP9 Video Extensions
Function InstallVP9VideoExtensions {
            Write-Output "Trying to install VP9 Video Extensions"           
            winget install "VP9 Video Extensions"
}

# Uninstall Microsoft Pay
Function UninstallMicrosoftPay {
            Write-Output "Trying to uninstall Microsoft Pay"
            winget uninstall "Microsoft Pay"   
}

# Install Microsoft Pay
Function InstallMicrosoftPay {
            Write-Output "Trying to install Microsoft Pay"
            winget install "Microsoft Pay"        
}

# Uninstall Web Media Extensions
Function UninstallWebMediaExtensions {
            Write-Output "Trying to uninstall Web Media Extensions"
            winget uninstall "Web Media Extensions"          
}

# Install Web Media Extensions
Function InstallWebMediaExtensions {
            Write-Output "Trying to install Web Media Extensions"
            winget install "Web Media Extensions"  
}

# Uninstall Webp Image Extensions
Function UninstallWebpImageExtensions {
            Write-Output "Trying to uninstall Webp Image Extensions"
            winget uninstall "Webp Image Extensions"       
}

# Install Webp Image Extensions
Function InstallWebpImageExtensions {
            Write-Output "Trying to install Webp Image Extensions"
            winget install "Webp Image Extensions" 
}

# Uninstall Microsoft Photos
Function UninstallMicrosoftPhotos {
            Write-Output "Trying to uninstall Microsoft Photos"
            winget uninstall "Microsoft Photos"         
}

# Install Microsoft Photos
Function InstallMicrosoftPhotos {
            Write-Output "Trying to install Microsoft Photos"
            winget install "Microsoft Photos"  
}

# Uninstall Windows Alarms Clock
Function UninstallWindowsAlarmsClock {
            Write-Output "Trying to uninstall Windows Alarms & Clock"
            winget uninstall "Windows Alarms & Clock"
}

# Install Windows Alarms Clock
Function InstallWindowsAlarmsClock {
            Write-Output "Trying to install Windows Alarms & Clock"
            winget install "Windows Alarms & Clock"
}

# Uninstall Windows Calculator
Function UninstallWindowsCalculator {
            Write-Output "Trying to uninstall Windows Calculator"
            winget uninstall "Windows Calculator"
}

# Install Windows Calculator
Function InstallWindowsCalculator {
            Write-Output "Trying to install Windows Calculator"
            winget install "Windows Calculator"
}

# Uninstall Windows Camera
Function UninstallWindowsCamera {
            Write-Output "Trying to uninstall Windows Camera"
            winget uninstall "Windows Camera"
}

# Install Windows Camera
Function InstallWindowsCamera {
            Write-Output "Trying to install Windows Camera"
            winget install "Windows Camera"
}

# Uninstall Feedback Hub
Function UninstallFeedbackHub {
            Write-Output "Trying to uninstall Feedback Hub"
            winget uninstall "Feedback Hub" 
}

# Install Feedback Hub
Function InstallFeedbackHub {
            Write-Output "Trying to install Feedback Hub"
            winget install "Feedback Hub"      
}

# Uninstall Windows Maps
Function UninstallWindowsMaps {
            Write-Output "Trying to uninstall Windows Maps"
            winget uninstall "Windows Maps" 
}

# Install Windows Maps
Function InstallWindowsMaps {
            Write-Output "Trying to install Windows Maps"
            winget install "Windows Maps"     
}

# Uninstall Windows Voice Recorder
Function UninstallWindowsVoiceRecorder {
            Write-Output "Trying to uninstall Windows Voice Recorder"  
            winget uninstall "Windows Voice Recorder"      
}

# Install Windows Voice Recorder
Function InstallWindowsVoiceRecorder {
            Write-Output "Trying to install Windows Voice Recorder"      
            winget install "Windows Voice Recorder"           
}

# Uninstall Xbox
Function UninstallXbox {
            Write-Output "Trying to uninstall Xbox"
            winget uninstall "Xbox"      
}

# Install Xbox
Function InstallXbox {
            Write-Output "Trying to install Xbox"
            winget install "Xbox"           
}

# Uninstall Xbox TCUI
Function UninstallXboxTCUI {
            Write-Output "Trying to uninstall Xbox TCUI"
            winget uninstall "Xbox TCUI"        
}

# Install Xbox TCUI
Function InstallXboxTCUI {
            Write-Output "Trying to install Xbox TCUI"
            winget install "Xbox TCUI" 
}

# Uninstall Xbox Game Bar Plugin
Function UninstallXboxGameBarPlugin {
            Write-Output "Trying to uninstall Xbox Game Bar Plugin"
            winget uninstall "Xbox Game Bar Plugin"
}

# Install Xbox Game Bar Plugin
Function InstallXboxGameBarPlugin {
            Write-Output "Trying to install Xbox Game Bar Plugin"
            winget install "Xbox Game Bar Plugin"
}

# Uninstall Xbox Game Bar
Function UninstallXboxGameBar {
            Write-Output "Trying to uninstall Xbox Game Bar"
            winget uninstall "Xbox Game Bar"           
}

# Install Xbox Game Bar
Function InstallXboxGameBar {
            Write-Output "Trying to install Xbox Game Bar"
            winget install "Xbox Game Bar"    
}

# Uninstall Xbox Identity Provider
Function UninstallXboxIdentityProvider {
            Write-Output "Trying to uninstall Xbox Identity Provider"
            winget uninstall "Xbox Identity Provider"
}

# Install Xbox Identity Provider
Function InstallXboxIdentityProvider {
            Write-Output "Trying to install Xbox Identity Provider"
            winget install "Xbox Identity Provider"
}

# Uninstall Xbox Game Speech Window
Function UninstallXboxGameSpeechWindow {
            Write-Output "Trying to uninstall Xbox Game Speech Window"
            winget uninstall "Xbox Game Speech Window"           
}

# Install Xbox Game Speech Window
Function InstallXboxGameSpeechWindow {
            Write-Output "Trying to install Xbox Game Speech Window"
            winget install "Xbox Game Speech Window"    
}

# Uninstall Your Phone
Function UninstallYourPhone {
            Write-Output "Trying to uninstall Your Phone"
            winget uninstall "Your Phone"
}

# Install Your Phone
Function InstallYourPhone {
            Write-Output "Trying to install Your Phone"
            winget install "Your Phone"
}

# Uninstall Groove Music
Function UninstallGrooveMusic {
            Write-Output "Trying to uninstall Groove Music"
            winget uninstall "Groove Music"   
}

# Install Groove Music
Function InstallGrooveMusic {
            Write-Output "Trying to install Groove Music"
            winget install "Groove Music"       
}

# Uninstall Movies & TV
Function UninstallMoviesTV {
            Write-Output "Trying to uninstall Movies & TV"
            winget uninstall "Movies & TV"     
}

# Install Movies & TV
Function InstallMoviesTV {
            Write-Output "Trying to install Movies & TV"
            winget install "Movies & TV"          
}

# Uninstall Mail and Calendar
Function UninstallMailCalendar {
            Write-Output "Trying to uninstall Mail and Calendar"
            winget uninstall "Mail and Calendar"      
}

# Install Mail and Calendar
Function InstallMailCalendar {
            Write-Output "Trying to install Mail and Calendar"
            winget install "Mail and Calendar"           
}

# Uninstall Microsoft Store
Function UninstallMicrosoftStore {
            Write-Output "Trying to uninstall Microsoft Store"
            winget uninstall "Microsoft Store"
}

# Install Microsoft Store
Function InstallMicrosoftStore {
            Write-Output "Trying to install Microsoft Store"
            winget install "Microsoft Store"
}

#endregion Windows Apps

#region Privacy & Telemetry

# Disable the Connected User Experiences and Telemetry (DiagTrack) service, and block connection for the Unified Telemetry Client Outbound Traffic
Function DisableDiagTrackService {
            Write-Output "Disabling DiagTrack Service ..."
            # Connected User Experiences and Telemetry
            Get-Service -Name DiagTrack | Stop-Service -Force
            Get-Service -Name DiagTrack | Set-Service -StartupType Disabled

            # Block connection for the Unified Telemetry Client Outbound Traffic
            Get-NetFirewallRule -Group DiagTrack | Set-NetFirewallRule -Enabled False -Action Block
}

# Enable the Connected User Experiences and Telemetry (DiagTrack) service, and allow connection for the Unified Telemetry Client Outbound Traffic
Function EnableDiagTrackService {
            Write-Output "Enabling DiagTrack Service ..."
            # Connected User Experiences and Telemetry
            Get-Service -Name DiagTrack | Set-Service -StartupType Automatic
            Get-Service -Name DiagTrack | Start-Service

            # Allow connection for the Unified Telemetry Client Outbound Traffic
            Get-NetFirewallRule -Group DiagTrack | Set-NetFirewallRule -Enabled True -Action Allow
}

# Set the diagnostic data collection to minimum
Function MinimalDiagnosticDataLevel {
            Write-Output "Setting Minimal Diagnostic Data Level ..."
            if (Get-WindowsEdition -Online | Where-Object -FilterScript {($_.Edition -like "Enterprise*") -or ($_.Edition -eq "Education")})
            {
                        # Security level
                        if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection))
                        {
                                    New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Force
                        }
                        New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -PropertyType DWord -Value 0 -Force
                        #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWORD -Value 0
                        }
                        else
                        {
                                    # Required diagnostic data
                                    if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection))
                                    {
                                               New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Force
                                    }
                                    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -PropertyType DWord -Value 1 -Force
                                    #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWORD -Value 1
                        }
                        New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name MaxTelemetryAllowed -PropertyType DWord -Value 1 -Force
                        New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack -Name ShowedToastAtLevel -PropertyType DWord -Value 1 -Force                       
}

# Set the diagnostic data collection to default
Function DefaultDiagnosticDataLevel {
            Write-Output "Setting Default Diagnostic Data Level ..."
            # Optional diagnostic data
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Force -ErrorAction Ignore
            #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type CLEAR
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name MaxTelemetryAllowed -PropertyType DWord -Value 3 -Force
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack -Name ShowedToastAtLevel -PropertyType DWord -Value 3 -Force

}

# Turn off Windows Error Reporting
Function DisableErrorReporting {
            Write-Output "Disabling Error Reporting ..."
            if ((Get-WindowsEdition -Online).Edition -notmatch "Core")
            {
                        Get-ScheduledTask -TaskName QueueReporting | Disable-ScheduledTask
                        New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -PropertyType DWord -Value 1 -Force
            }

            Get-Service -Name WerSvc | Stop-Service -Force
            Get-Service -Name WerSvc | Set-Service -StartupType Disabled
}

# Turn on Windows Error Reporting
Function EnableErrorReporting {
            Write-Output "Enabling Error Reporting ..."
            Get-ScheduledTask -TaskName QueueReporting | Enable-ScheduledTask
            Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Force -ErrorAction Ignore

            Get-Service -Name WerSvc | Set-Service -StartupType Manual
            Get-Service -Name WerSvc | Start-Service
}

# Change the feedback frequency to "Never"
Function NeverFeedbackFrequency {
            Write-Output "Setting Never Feedback Frequency ..."
            if (-not (Test-Path -Path HKCU:\Software\Microsoft\Siuf\Rules))
            {
                        New-Item -Path HKCU:\Software\Microsoft\Siuf\Rules -Force
            }
            New-ItemProperty -Path HKCU:\Software\Microsoft\Siuf\Rules -Name NumberOfSIUFInPeriod -PropertyType DWord -Value 0 -Force
}

# Change feedback frequency to "Automatically"
Function AutomaticallyFeedbackFrequency {
            Write-Output "Setting Automatically Feedback Frequency ..."
            Remove-Item -Path HKCU:\Software\Microsoft\Siuf\Rules -Force -ErrorAction Ignore
}

# Do not use sign-in info to automatically finish setting up device after an update
Function DisableSigninInfo {
            Write-Output "Disabling Signin Info ..."
            $SID = (Get-CimInstance -ClassName Win32_UserAccount | Where-Object -FilterScript {$_.Name -eq $env:USERNAME}).SID
            if (-not (Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\$SID"))
            {
                        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\$SID" -Force
            }
            New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\$SID" -Name OptOut -PropertyType DWord -Value 1 -Force  
}

# Use sign-in info to automatically finish setting up device after an update
Function EnableSigninInfo {
            Write-Output "Enabling Signin Info ..."
            $SID = (Get-CimInstance -ClassName Win32_UserAccount | Where-Object -FilterScript {$_.Name -eq $env:USERNAME}).SID
            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserARSO\$SID" -Name OptOut -Force -ErrorAction Ignore
}

# Do not let websites show me locally relevant content by accessing my language list
Function DisableLanguageListAccess {
            Write-Output "Disabling Language List Access ..."
            New-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -PropertyType DWord -Value 1 -Force
}

# Let websites show me locally relevant content by accessing language my list
Function EnableLanguageListAccess {
            Write-Output "Enabling Language List Access ..."
            Remove-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -Force -ErrorAction Ignore
}

# Do not let apps show me personalized ads by using my advertising ID
Function DisableAdvertisingID {
            Write-Output "Disabling Advertising ID ..."
            if (-not (Test-Path -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo))
            {
                        New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Force
            }
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -PropertyType DWord -Value 0 -Force                      
}

# Let apps show me personalized ads by using my advertising ID
Function EnableAdvertisingID {
            Write-Output "Enabling Advertising ID ..."
            if (-not (Test-Path -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo))
            {
                        New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Force
            }
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -PropertyType DWord -Value 1 -Force                      
}

# Hide the Windows welcome experiences after updates and occasionally when I sign in to highlight what's new and suggested
Function HideWindowsWelcomeExperience {
            Write-Output "Hiding Windows Welcome Experience ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-310093Enabled -PropertyType DWord -Value 0 -Force
}

# Show the Windows welcome experiences after updates and occasionally when I sign in to highlight what's new and suggested
Function ShowWindowsWelcomeExperience {
            Write-Output "Showing Windows Welcome Experience ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-310093Enabled -PropertyType DWord -Value 1 -Force
}

# Do not get tip and suggestions when I use Windows
Function DisableWindowsTips {
            Write-Output "Disabling Windows Tips ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338389Enabled -PropertyType DWord -Value 0 -Force
}

# Get tip and suggestions when I use Windows
Function EnableWindowsTips {
            Write-Output "Enabling Windows Tips ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338389Enabled -PropertyType DWord -Value 1 -Force                     
}

# Hide from me suggested content in the Settings app
Function HideSettingsSuggestedContent {
            Write-Output "Hiding Settings Suggested Content ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338393Enabled -PropertyType DWord -Value 0 -Force
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-353694Enabled -PropertyType DWord -Value 0 -Force
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-353696Enabled -PropertyType DWord -Value 0 -Force
}

# Show me suggested content in the Settings app
Function ShowSettingsSuggestedContent {
            Write-Output "Showing Settings Suggested Content ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338393Enabled -PropertyType DWord -Value 1 -Force
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-353694Enabled -PropertyType DWord -Value 1 -Force
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-353696Enabled -PropertyType DWord -Value 1 -Force                     
}

# Turn off automatic installing suggested apps
Function DisableAppsSilentInstalling {
            Write-Output "Disabling Apps Silent Installing ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SilentInstalledAppsEnabled -PropertyType DWord -Value 0 -Force            
}

# Turn on automatic installing suggested apps
Function EnableAppsSilentInstalling {
            Write-Output "Enabling Apps Silent Installing ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SilentInstalledAppsEnabled -PropertyType DWord -Value 1 -Force            
}

# Disable suggestions on how I can set up my device
Function DisableWhatsNewInWindows {
            Write-Output "Disabling Whats New In Windows ..."
            if (-not (Test-Path -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement))
            {
                        New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement -Force
            }
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement -Name ScoobeSystemSettingEnabled -PropertyType DWord -Value 0 -Force
}

# Offer suggestions on how I can set up my device
Function EnableWhatsNewInWindows {
            Write-Output "Enabling Whats New In Windows ..."
            if (-not (Test-Path -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement))
            {
                        New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement -Force
            }
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement -Name ScoobeSystemSettingEnabled -PropertyType DWord -Value 1 -Force                   
}

# Do not let Microsoft offer you tailored experiences based on the diagnostic data setting you have chosen
Function DisableTailoredExperiences {
            Write-Output "Disabling Tailored Experiences ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy -Name TailoredExperiencesWithDiagnosticDataEnabled -PropertyType DWord -Value 0 -Force                      
}

# Let Microsoft offer you tailored experiences based on the diagnostic data setting you have chosen
Function EnableTailoredExperiences {
            Write-Output "Enabling Tailored Experiences ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy -Name TailoredExperiencesWithDiagnosticDataEnabled -PropertyType DWord -Value 1 -Force                      
}

# Disable Bing search in the Start Menu
Function DisableBingSearch {
            Write-Output "Disabling Bing Search ..."
            if (-not (Test-Path -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer))
            {
                        New-Item -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Force
            }
            New-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -PropertyType DWord -Value 1 -Force                  
}

# Enable Bing search in the Start Menu
Function EnableBingSearch {
            Write-Output "Enabling Bing Search ..."
            Remove-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -Force -ErrorAction Ignore
            #Set-Policy -Scope User -Path Software\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -Type CLEAR
}

#endregion Privacy & Telemetry

#region UI & Personalization

# Show the "This PC" icon on Desktop
Function ShowThisPC {
            Write-Output "Showing This PC ..."
            if (-not (Test-Path -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel))
            {
                        New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Force
            }
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -PropertyType DWord -Value 0 -Force
}

# Hide the "This PC" icon on Desktop
Function HideThisPC {
            Write-Output "Hiding This PC ..."
            Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Force -ErrorAction Ignore
}

# Do not use item check boxes
Function DisableCheckBoxes {
            Write-Output "Disabling CheckBoxes ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name AutoCheckSelect -PropertyType DWord -Value 0 -Force     
}

# Use check item check boxes
Function EnableCheckBoxes {
            Write-Output "Enabling CheckBoxes ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name AutoCheckSelect -PropertyType DWord -Value 1 -Force     
}

# Show hidden files, folders, and drives
Function EnableHiddenItems {
            Write-Output "Enabling Hidden Items ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -PropertyType DWord -Value 1 -Force                
}

# Do not show hidden files, folders, and drives
Function DisableHiddenItems {
            Write-Output "Disabling Hidden Items ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -PropertyType DWord -Value 2 -Force
}

# Show file name extensions
Function ShowFileExtensions {
            Write-Output "Showing File Extensions ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -PropertyType DWord -Value 0 -Force                
}

# Hide file name extensions
Function HideFileExtensions {
            Write-Output "Hiding File Extensions ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -PropertyType DWord -Value 1 -Force                
}

# Show folder merge conflicts
Function ShowMergeConflicts {
            Write-Output "Showing Merge Conflicts ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideMergeConflicts -PropertyType DWord -Value 0 -Force
}

# Hide folder merge conflicts
Function HideMergeConflicts {
            Write-Output "Hiding Merge Conflicts ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideMergeConflicts -PropertyType DWord -Value 1 -Force
}

# Open File Explorer to "This PC"
Function ThisPCOpenFileExplorerTo {
            Write-Output "This PC Open File Explorer To ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -PropertyType DWord -Value 1 -Force
}

# Open File Explorer to Quick access
Function QuickAccessOpenFileExplorerTo {
            Write-Output "Quick Access Open File Explorer To ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -PropertyType DWord -Value 2 -Force                
}

# Hide Cortana button on the taskbar
Function HideCortanaButton {
            Write-Output "Hiding Cortana Button ..."
            if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCortanaButton -PropertyType DWord -Value 0 -Force
            }
}

# Show Cortana button on the taskbar
Function ShowCortanaButton {
            Write-Output "Showing Cortana Button ..."
            if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCortanaButton -PropertyType DWord -Value 1 -Force
            }
}

# Do not show sync provider notification within File Explorer
Function HideOneDriveFileExplorerAd {
            Write-Output "Hiding OneDrive File Explorer Ad ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -PropertyType DWord -Value 0 -Force
}

# Show sync provider notification within File Explorer
Function ShowOneDriveFileExplorerAd {
            Write-Output "Showing OneDrive File Explorer Ad ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -PropertyType DWord -Value 1 -Force
}

# When I snap a window, do not show what I can snap next to it
Function DisableSnapAssist {
            Write-Output "Disabling Snap Assist ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SnapAssist -PropertyType DWord -Value 0 -Force                
}

# When I snap a window, show what I can snap next to it
Function EnableSnapAssist {
            Write-Output "Enabling Snap Assist ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SnapAssist -PropertyType DWord -Value 1 -Force
}

# Show the file transfer dialog box in the detailed mode
Function DetailedFileTransferDialog {
            Write-Output "Setting Detailed File Transfer Dialog ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Name EnthusiastMode -PropertyType DWord -Value 1 -Force         
}

# Show the file transfer dialog box in the compact mode
Function CompactFileTransferDialog {
            Write-Output "Setting Compact File Transfer Dialog ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Name EnthusiastMode -PropertyType DWord -Value 0 -Force
}

# Expand the File Explorer ribbon
Function ExpandedFileExplorerRibbon {
            Write-Output "Setting Expanded File Explorer Ribbon ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Name MinimizedStateTabletModeOff -PropertyType DWord -Value 0 -Force
}

# Minimize the File Explorer ribbon
Function MinimizedFileExplorerRibbon {
            Write-Output "Setting Minimized File Explorer Ribbon ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Name MinimizedStateTabletModeOff -PropertyType DWord -Value 1 -Force
}

# Display the recycle bin files delete confirmation dialog
Function EnableRecycleBinDeleteConfirmation {
            Write-Output "Enabling Recycle Bin Delete Confirmation ..."
            $ShellState = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState
            $ShellState[4] = 51
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState -PropertyType Binary -Value $ShellState -Force
}

# Do not display the recycle bin files delete confirmation dialog
Function DisableRecycleBinDeleteConfirmation {
            Write-Output "Disabling Recycle Bin Delete Confirmation ..."
            $ShellState = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState
            $ShellState[4] = 55
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState -PropertyType Binary -Value $ShellState -Force  
}

# Hide the "3D Objects" folder in "This PC" and Quick access
Function Hide3DObjects {
            Write-Output "Hiding 3D Objects ..."
            if (-not (Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag"))
            {
                        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Force
            }
            New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name ThisPCPolicy -PropertyType String -Value Hide -Force               
}

# Show the "3D Objects" folder in "This PC" and Quick access
Function Show3DObjects{
            Write-Output "Showing 3D Objects ..."
            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name ThisPCPolicy -Force -ErrorAction Ignore                 
}

# Hide recently used files in Quick access
Function HideQuickAccessRecentFiles {
            Write-Output "Hiding Quick Access Recent Files ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -PropertyType DWord -Value 0 -Force
}

# Show recently used files in Quick access
Function ShowQuickAccessRecentFiles {
            Write-Output "Showing Quick Access Recent Files ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -PropertyType DWord -Value 1 -Force
}

# Hide the Task view button on the taskbar
Function HideTaskViewButton {
            Write-Output "Hiding Task View Button ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -PropertyType DWord -Value 0 -Force
}

# Show the Task View button on the taskbar
Function ShowTaskViewButton {
            Write-Output "Showing Task View Button ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -PropertyType DWord -Value 1 -Force
}

# Hide People button on the taskbar
Function HidePeopleTaskbar {
            Write-Output "Hiding People Taskbar ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Name PeopleBand -PropertyType DWord -Value 0 -Force
}

# Show People button on the taskbar
Function ShowPeopleTaskbar {
            Write-Output "Showing People Taskbar ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Name PeopleBand -PropertyType DWord -Value 1 -Force
}

# Show seconds on the taskbar clock
Function ShowSecondsInSystemClock {
            Write-Output "Showing Seconds In System Clock ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSecondsInSystemClock -PropertyType DWord -Value 1 -Force
}

# Hide seconds on the taskbar clock
Function HideSecondsInSystemClock {
            Write-Output "Hiding Seconds In System Clock ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSecondsInSystemClock -PropertyType DWord -Value 0 -Force
}

# Hide the Windows Ink Workspace button on the taskbar
Function HideWindowsInkWorkspace {
            Write-Output "Hiding Windows Ink Workspace ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace -Name PenWorkspaceButtonDesiredVisibility -PropertyType DWord -Value 0 -Force
}

# Show the Windows Ink Workspace button on the taskbar
Function ShowWindowsInkWorkspace {
            Write-Output "Showing Windows Ink Workspace ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace -Name PenWorkspaceButtonDesiredVisibility -PropertyType DWord -Value 1 -Force
}

# Hide the Meet Now icon in the notification area
Function HideMeetNow {
            Write-Output "Hiding Meet Now ..."
            $Settings = Get-ItemPropertyValue -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -ErrorAction Ignore
            $Settings[9] = 128
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -PropertyType Binary -Value $Settings -Force

}

# Show the Meet Now icon in the notification area
Function ShowMeetNow {
            Write-Output "Showing Meet Now ..."
            $Settings = Get-ItemPropertyValue -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -ErrorAction Ignore
            $Settings[9] = 0
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -PropertyType Binary -Value $Settings -Force

}

# Disable "News and Interests" on the taskbar
Function DisableNewsInterests {
            Write-Output "Disabling News Interest ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds -Name ShellFeedsTaskbarViewMode -PropertyType DWord -Value 2 -Force
}

# Enable "News and Interests" on the taskbar
Function EnableNewsInterests {
            Write-Output "Enabling News Interest ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds -Name ShellFeedsTaskbarViewMode -PropertyType DWord -Value 0 -Force
}

# Set the default Windows mode to dark
Function DarkWindowsColorMode {
            Write-Output "Setting Dark Windows Color Mode ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -PropertyType DWord -Value 0 -Force
}

# Set the default Windows mode to light
Function LightWindowsColorMode {
            Write-Output "Setting Light Windows Color Mode ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -PropertyType DWord -Value 1 -Force
}

# Set the default app mode to dark
Function DarkAppColorMode {
            Write-Output "Setting Dark App Color Mode ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -PropertyType DWord -Value 0 -Force
}

# Set the default app mode to light
Function LightAppColorMode {
            Write-Output "Setting Light App Color Mode ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -PropertyType DWord -Value 1 -Force
}

# Hide the "New App Installed" indicator
Function HideNewAppInstalledNotification {
            Write-Output "Hiding New App Installed Notification ..."
            if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer))
            {
                        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
            }
            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoNewAppAlert -PropertyType DWord -Value 1 -Force
}

# Show the "New App Installed" indicator
Function ShowNewAppInstalledNotification {
            Write-Output "Showing New App Installed Notification ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoNewAppAlert -Force
}

# Disable first sign-in animation after the upgrade
Function DisableFirstLogonAnimation {
            Write-Output "Disabling First Logon Animation ..."
            New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name EnableFirstLogonAnimation -PropertyType DWord -Value 0 -Force
}

# Enable first sign-in animation after the upgrade
Function EnableFirstLogonAnimation {
            Write-Output "Enabling First Logon Animation ..."
            New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name EnableFirstLogonAnimation -PropertyType DWord -Value 1 -Force
}

# Set the quality factor of the JPEG desktop wallpapers to maximum
Function MaxJPEGWallpapersQuality {
            Write-Output "Setting Max JPEG Wallpapers Quality ..."
            New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name JPEGImportQuality -PropertyType DWord -Value 100 -Force
}

# Set the quality factor of the JPEG desktop wallpapers to default
Function DefaultJPEGWallpapersQuality {
            Write-Output "Setting Default JPEG Wallpapers Quality ..."
            Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name JPEGImportQuality -Force -ErrorAction Ignore
}

# Start Task Manager in the expanded mode
Function ExpandedTaskManagerWindow {
            Write-Output "Setting Expanded Task Manager Window ..."
            $Taskmgr = Get-Process -Name Taskmgr -ErrorAction Ignore

            Start-Sleep -Seconds 1

            if ($Taskmgr)
            {
                        $Taskmgr.CloseMainWindow()
            }
            Start-Process -FilePath Taskmgr.exe -PassThru

            Start-Sleep -Seconds 3

            do
            {
                        Start-Sleep -Milliseconds 100
                        $Preferences = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences
            }
            until ($Preferences)

            Stop-Process -Name Taskmgr -ErrorAction Ignore

            $Preferences[28] = 0
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences -PropertyType Binary -Value $Preferences -Force
}

# Start Task Manager in the compact mode
Function CompactTaskManagerWindow {
            Write-Output "Setting Compact Task Manager Window ..."
            $Taskmgr = Get-Process -Name Taskmgr -ErrorAction Ignore

            Start-Sleep -Seconds 1

            if ($Taskmgr)
            {
                        $Taskmgr.CloseMainWindow()
            }
            Start-Process -FilePath Taskmgr.exe -PassThru

            Start-Sleep -Seconds 3

            do
            {
                        Start-Sleep -Milliseconds 100
                        $Preferences = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences
            }
            until ($Preferences)

            Stop-Process -Name Taskmgr -ErrorAction Ignore
            $Preferences[28] = 1
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences -PropertyType Binary -Value $Preferences -Force
}

# Notify me when a restart is required to finish updating
Function ShowRestartNotification {
            Write-Output "Showing Restart Notification ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name RestartNotificationsAllowed2 -PropertyType DWord -Value 1 -Force
}

# Do not notify me when a restart is required to finish updating
Function HideRestartNotification {
            Write-Output "Hiding Restart Notification ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name RestartNotificationsAllowed2 -PropertyType DWord -Value 0 -Force
}

# Do not add the "- Shortcut" suffix to the file name of created shortcuts
Function DisableShortcutsSuffix {
            Write-Output "Disabling Shortcuts Suffix ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Name ShortcutNameTemplate -PropertyType String -Value "%s.lnk" -Force
}

# Add the "- Shortcut" suffix to the file name of created shortcuts
Function EnableShortcutsSuffix {
            Write-Output "Enabling Shortcuts Suffix ..."
            Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Name ShortcutNameTemplate -Force -ErrorAction Ignore
}

# Use the Print screen button to open screen snipping
Function EnablePrtScnSnippingTool {
            Write-Output "Enabling PrtScn Snipping Tool ..."
            New-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name PrintScreenKeyForSnippingEnabled -PropertyType DWord -Value 1 -Force
}

# Do not use the Print screen button to open screen snipping
Function DisablePrtScnSnippingTool {
            Write-Output "Disabling PrtScn Snipping Tool ..."
            New-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name PrintScreenKeyForSnippingEnabled -PropertyType DWord -Value 0 -Force
}

# Do not use a different input method for each app window
Function DisableAppsLanguageSwitch {
            Write-Output "Disabling Apps Language Switch ..."
            Set-WinLanguageBarOption
}

# Let me use a different input method for each app window
Function EnableAppsLanguageSwitch {
            Write-Output "Enabling Apps Language Switch ..."
            Set-WinLanguageBarOption -UseLegacySwitchMode
}

# When I grab a windows's title bar and shake it, don't minimize all other windows
Function DisableAeroShaking {
            Write-Output "Disabling Aero Shaking ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DisallowShaking -PropertyType DWord -Value 1 -Force
}

# When I grab a windows's title bar and shake it, minimize all other windows
Function EnableAeroShaking {
            Write-Output "Enabling Aero Shaking ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DisallowShaking -PropertyType DWord -Value 0 -Force
}

#endregion UI & Personalization

#region OneDrive

# Uninstall OneDrive
Function UninstallOneDrive {
            Write-Output "Uninstalling OneDrive ..."
            If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive")) {
                        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" | Out-Null
            }
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1

            Stop-Process -Name "OneDrive" -ErrorAction SilentlyContinue
            Start-Sleep -s 2
            $onedrive = "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe"
            If (!(Test-Path $onedrive)) {
                        $onedrive = "$env:SYSTEMROOT\System32\OneDriveSetup.exe"
            }
            Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
            Start-Sleep -s 2
            Stop-Process -Name "explorer" -ErrorAction SilentlyContinue
            Start-Sleep -s 2
            Remove-Item -Path "$env:USERPROFILE\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
            Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
            Remove-Item -Path "$env:PROGRAMDATA\Microsoft OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
            Remove-Item -Path "$env:SYSTEMDRIVE\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue
            If (!(Test-Path "HKCR:")) {
                        New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
            }
            Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
            Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
}

# Install OneDrive
Function InstallOneDrive {
            Write-Output "Installing OneDrive ..."
            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -ErrorAction SilentlyContinue
            & "$env:SystemRoot\SysWOW64\OneDriveSetup.exe"
}

#endregion OneDrive

#region System

# Turn on Storage Sense
Function EnableStorageSense {
            Write-Output "Enabling Storage Sense ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -ItemType Directory -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 01 -PropertyType DWord -Value 1 -Force
}

# Turn off Storage Sense
Function DisableStorageSense {
            Write-Output "Disabling Storage Sense ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -ItemType Directory -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 01 -PropertyType DWord -Value 0 -Force
}

# Turn on automatic cleaning up temporary system and app files
Function EnableStorageSenseTempFiles {
            Write-Output "Enabling Storage Sense Temp Files ..."
            if ((Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 01) -eq "1")
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 04 -PropertyType DWord -Value 1 -Force
            }           
}

# Turn off automatic cleaning up temporary system and app files
Function DisableStorageSenseTempFiles {
            Write-Output "Disabling Storage Sense Temp Files ..."
            if ((Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 01) -eq "1")
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 04 -PropertyType DWord -Value 0 -Force
            }
}

# Run Storage Sense every month
Function MonthStorageSenseFrequency {
            Write-Output "Setting Month Storage Sense Frequency ..."
            if ((Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 01) -eq "1")
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 2048 -PropertyType DWord -Value 30 -Force
            }
}

# Run Storage Sense during low free disk space
Function DefaultStorageSenseFrequency {
            Write-Output "Setting Default Storage Sense Frequency ..."
            if ((Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 01) -eq "1")
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy -Name 2048 -PropertyType DWord -Value 0 -Force
            }
}

# Disable hibernation
Function DisableHibernation {
            Write-Output "Disabling Hibernation ..."
            POWERCFG /HIBERNATE OFF
}

# Enable hibernation
Function EnableHibernation {
            Write-Output "Enabling Hibernation ..."
            POWERCFG /HIBERNATE ON
}

# Disable the Windows 260 character path limit
Function DisableWin32LongPathLimit {
            Write-Output "Disabling Win32 Long Path Limit ..."
            New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem -Name LongPathsEnabled -PropertyType DWord -Value 1 -Force
}

# Enable the Windows 260 character path limit
Function EnableWin32LongPathLimit {
            Write-Output "Enabling Win32 Long Path Limit ..."
            New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem -Name LongPathsEnabled -PropertyType DWord -Value 0 -Force
}

# Display the Stop error information on the BSoD
Function EnableBSoDStopError {
            Write-Output "Enabling BSoD Stop Error ..."
            New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl -Name DisplayParameters -PropertyType DWord -Value 1 -Force
}

# Do not display the Stop error information on the BSoD
Function DisableBSoDStopError {
            Write-Output "Disabling BSoD Stop Error ..."
            New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl -Name DisplayParameters -PropertyType DWord -Value 0 -Force
}

# Never notify when apps try to make changes to my computer
Function NeverAdminApprovalMode {
            Write-Output "Setting Never Admin Approval Mode ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -PropertyType DWord -Value 0 -Force
}

# Notify me only when apps try to make changes to my computer
Function DefaultAdminApprovalMode {
            Write-Output "Setting Default Admin Approval Mode ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -PropertyType DWord -Value 5 -Force
}

# Turn on access to mapped drives from app running with elevated permissions with Admin Approval Mode enabled
Function EnableMappedDrivesAppElevatedAccess {
            Write-Output "Enabling Mapped Drives App Elevated Access ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLinkedConnections -PropertyType DWord -Value 1 -Force
}

# Turn off access to mapped drives from app running with elevated permissions with Admin Approval Mode enabled
Function DisableMappedDrivesAppElevatedAccess {
            Write-Output "Disabling Mapped Drives App Elevated Access ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLinkedConnections -Force -ErrorAction Ignore
}

# Turn off Delivery Optimization
Function DisableDeliveryOptimization {
            Write-Output "Disabling Delivery Optimization ..."
            New-ItemProperty -Path Registry::HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings -Name DownloadMode -PropertyType DWord -Value 0 -Force
            Delete-DeliveryOptimizationCache -Force
}

# Turn on Delivery Optimization
Function EnableDeliveryOptimization {
            Write-Output "Enabling Delivery Optimization ..."
            New-ItemProperty -Path Registry::HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings -Name DownloadMode -PropertyType DWord -Value 1 -Force
}

# Always wait for the network at computer startup and logon for workgroup networks
Function EnableWaitNetworkStartup {
            Write-Output "Enabling Wait Network Startup ..."
            if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $true)
            {
                        if (-not (Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon"))
                        {
                                    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force
                        }
                        New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -PropertyType DWord -Value 1 -Force
                        #Set-Policy -Scope Computer -Path "SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -Type DWORD -Value 1                          
            }
}

# Never wait for the network at computer startup and logon for workgroup networks
Function DisableWaitNetworkStartup {
            Write-Output "Disabling Wait Network Startup ..."
            if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $true)
            {
                        Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -Force -ErrorAction Ignore
                        #Set-Policy -Scope Computer -Path "SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -Type CLEAR                                
            }
}

# Do not let Windows manage my default printer
Function DisableWindowsManageDefaultPrinter {
            Write-Output "Disabling Windows Manage Default Printer ..."
            New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" -Name LegacyDefaultPrinterMode -PropertyType DWord -Value 1 -Force
}

# Let Windows manage my default printer
Function EnableWindowsManageDefaultPrinter {
            Write-Output "Enabling Windows Manage Default Printer ..."
            New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" -Name LegacyDefaultPrinterMode -PropertyType DWord -Value 0 -Force
}

# Receive updates for other Microsoft products
Function EnableUpdateMicrosoftProducts {
            Write-Output "Enabling Update Microsoft Products ..."
            (New-Object -ComObject Microsoft.Update.ServiceManager).AddService2("7971f918-a847-4430-9279-4a52d1efe18d", 7, "")
}

# Do not receive updates for other Microsoft products
Function DisableUpdateMicrosoftProducts {
            Write-Output "Disabling Update Microsoft Products ..."
            if ((New-Object -ComObject Microsoft.Update.ServiceManager).Services | Where-Object -FilterScript {$_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d"})
            {
                        (New-Object -ComObject Microsoft.Update.ServiceManager).RemoveService("7971f918-a847-4430-9279-4a52d1efe18d")
            }
}

# Set power plan on "High performance"
Function HighPowerPlan {
            Write-Output "Setting High Power Plan ..."
            POWERCFG /SETACTIVE SCHEME_MIN
}

# Set power plan on "Balanced"
Function BalancedPowerPlan {
            Write-Output "Setting Balanced Power Plan ..."
            POWERCFG /SETACTIVE SCHEME_BALANCED
}

# Use the latest installed .NET runtime for all apps
Function EnableLatestInstalledNET {
            Write-Output "Enabling Latest Installed .NET ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework -Name OnlyUseLatestCLR -PropertyType DWord -Value 1 -Force
            New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework -Name OnlyUseLatestCLR -PropertyType DWord -Value 1 -Force
}

# Do not use the latest installed .NET runtime for all apps
Function DisableLatestInstalledNET {
            Write-Output "Disabling Latest Installed .NET ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework -Name OnlyUseLatestCLR -Force -ErrorAction Ignore
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework -Name OnlyUseLatestCLR -Force -ErrorAction Ignore
}

# Do not allow the computer to turn off the network adapters to save power
Function DisableNetworkAdaptersSavePower {
            Write-Output "Disabling Network Adapters Save Power ..."
            $Adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement | Where-Object -FilterScript {$_.AllowComputerToTurnOffDevice -ne "Unsupported"}
            foreach ($Adapter in $Adapters)
            {
                        $Adapter.AllowComputerToTurnOffDevice = "Disabled"
                        $Adapter | Set-NetAdapterPowerManagement
            }
}

# Allow the computer to turn off the network adapters to save power
Function EnableNetworkAdaptersSavePower {
            Write-Output "Enabling Network Adapters Save Power ..."
            $Adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement | Where-Object -FilterScript {$_.AllowComputerToTurnOffDevice -ne "Unsupported"}
            foreach ($Adapter in $Adapters)
            {
                        $Adapter.AllowComputerToTurnOffDevice = "Enabled"
                        $Adapter | Set-NetAdapterPowerManagement
            }
}

# Override for default input method: English
Function EnglishInputMethod {
            Write-Output "Setting English Input Method  ..."
            Set-WinDefaultInputMethodOverride -InputTip "0409:00000409"
}

# Override for default input method: use language list
Function DefaultInputMethod {
            Write-Output "Setting Default Input Method  ..."
            Remove-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name InputMethodOverride -Force -ErrorAction Ignore
}

# Save screenshots by pressing Win+PrtScr on the Desktop
Function DesktopWinPrtScrFolder {
            Write-Output "Setting Desktop Win+PrtScr Folder ..."
            $DesktopFolder = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Desktop
            New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{B7BEDE81-DF94-4682-A7D8-57A52620B86F}" -Type ExpandString -Value $DesktopFolder -Force
}

# Save screenshots by pressing Win+PrtScr in the Pictures folder
Function DefaultWinPrtScrFolder {
            Write-Output "Setting Default Win+PrtScr Folder ..."
            Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{B7BEDE81-DF94-4682-A7D8-57A52620B86F}" -Force -ErrorAction Ignore
}

# Run troubleshooter automatically, then notify me
Function AutomaticallyRecommendedTroubleshooting {
            Write-Output "Setting Automatically Recommended Troubleshooting ..."
            if (-not (Test-Path -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation))
            {
                        New-Item -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Force
            }
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Name UserPreference -PropertyType DWord -Value 3 -Force

            # Set the OS level of diagnostic data gathering to "Optional diagnostic data"
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -PropertyType DWord -Value 3 -Force
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name MaxTelemetryAllowed -PropertyType DWord -Value 3 -Force

            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack -Name ShowedToastAtLevel -PropertyType DWord -Value 3 -Force

            # Turn on Windows Error Reporting
            Get-ScheduledTask -TaskName QueueReporting | Enable-ScheduledTask
            Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Force -ErrorAction Ignore

            Get-Service -Name WerSvc | Set-Service -StartupType Manual
            Get-Service -Name WerSvc | Start-Service
}

# Ask me before running troubleshooter
Function DefaultRecommendedTroubleshooting {
            Write-Output "Setting Default Recommended Troubleshooting ..."
            if (-not (Test-Path -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation))
            {
                        New-Item -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Force
            }
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Name UserPreference -PropertyType DWord -Value 2 -Force

            # Set the OS level of diagnostic data gathering to "Optional diagnostic data"
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -PropertyType DWord -Value 3 -Force
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name MaxTelemetryAllowed -PropertyType DWord -Value 3 -Force

            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack -Name ShowedToastAtLevel -PropertyType DWord -Value 3 -Force

            # Turn on Windows Error Reporting
            Get-ScheduledTask -TaskName QueueReporting | Enable-ScheduledTask
            Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Force -ErrorAction Ignore

            Get-Service -Name WerSvc | Set-Service -StartupType Manual
            Get-Service -Name WerSvc | Start-Service
}

# Launch folder windows in a separate process
Function EnableFoldersLaunchSeparateProcess {
            Write-Output "Enabling Folders Launch Separate Process ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SeparateProcess -PropertyType DWord -Value 1 -Force
}

# Do not launch folder windows in a separate process
Function DisableFoldersLaunchSeparateProcess {
            Write-Output "Disabling Folders Launch Separate Process ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SeparateProcess -PropertyType DWord -Value 0 -Force
}

# Disable and delete reserved storage after the next update installation
Function DisableReservedStorage {
            Write-Output "Disabling Reserved Storage ..."
            try
            {
                        Set-WindowsReservedStorageState -State Disabled
            }
            catch [System.Runtime.InteropServices.COMException]
            {
                        Write-Error -Message ($Localization.ReservedStorageIsInUse -f $MyInvocation.Line) -ErrorAction SilentlyContinue
            }
}

# Enable reserved storage after the next update installation
Function EnableReservedStorage {
            Write-Output "Enabling Reserved Storage ..."
            Set-WindowsReservedStorageState -State Enabled
}

# Disable help lookup via F1
Function DisableF1HelpPage {
            Write-Output "Disabling F1 Help Page ..."
            if (-not (Test-Path -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64"))
            {
                        New-Item -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" -Force
            }
            New-ItemProperty -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" -Name "(default)" -PropertyType String -Value "" -Force
}

# Enable help lookup via F1
Function EnableF1HelpPage {
            Write-Output "Enabling F1 Help Page ..."
            Remove-Item -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}" -Recurse -Force -ErrorAction Ignore
}

# Enable Num Lock at startup
Function EnableNumLock {
            Write-Output "Enabling NumLock at startup ..."
            New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard" -Name InitialKeyboardIndicators -PropertyType String -Value 2147483650 -Force
}

# Disable Num Lock at startup
Function DisableNumLock {
            Write-Output "Disabling NumLock at startup ..."
            New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard" -Name InitialKeyboardIndicators -PropertyType String -Value 2147483648 -Force
}

# Disable Caps Lock
Function DisableCapsLock {
            Write-Output "Disabling Caps Lock ..."
            New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -Name "Scancode Map" -PropertyType Binary -Value ([byte[]](0,0,0,0,0,0,0,0,2,0,0,0,0,0,58,0,0,0,0,0)) -Force
}

# Enable Caps Lock
Function EnableCapsLock {
            Write-Output "Enabling Caps Lock ..."
            Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -Name "Scancode Map" -Force -ErrorAction Ignore
}

# Turn off pressing the Shift key 5 times to turn Sticky keys
Function DisableStickyShift {
            Write-Output "Disabling Sticky Shift ..."
            New-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -PropertyType String -Value 506 -Force
}

# Turn on pressing the Shift key 5 times to turn Sticky keys
Function EnableStickyShift {
            Write-Output "Enabling Sticky Shift ..."
            New-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -PropertyType String -Value 510 -Force
}

# Don't use AutoPlay for all media and devices
Function DisableAutoplay {
            Write-Output "Disabling Autoplay ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers -Name DisableAutoplay -PropertyType DWord -Value 1 -Force
}

# Use AutoPlay for all media and devices
Function EnableAutoplay {
            Write-Output "Enabling Autoplay ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers -Name DisableAutoplay -PropertyType DWord -Value 0 -Force
}

# Disable thumbnail cache removal
Function DisableThumbnailCacheRemoval {
            Write-Output "Disabling Thumbnail Cache Removal ..."
            New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" -Name Autorun -PropertyType DWord -Value 0 -Force
}

# Enable thumbnail cache removal
Function EnableThumbnailCacheRemoval {
            Write-Output "Enabling Thumbnail Cache Removal ..."
            New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" -Name Autorun -PropertyType DWord -Value 3 -Force
}

# Automatically saving my restartable apps and restart them when I sign back in
Function EnableSaveRestartableApps {
            Write-Output "Enabling Save Restartable Apps ..."
            New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name RestartApps -Value 1 -Force
}

# Turn off automatically saving my restartable apps and restart them when I sign back in
Function DisableSaveRestartableApps {
            Write-Output "Disabling Save Restartable Apps ..."
            New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name RestartApps -Value 0 -Force
}

# Enable "Network Discovery" and "File and Printers Sharing" for workgroup networks
Function EnableNetworkDiscovery {
            Write-Output "Enabling Network Discovery ..."
            $FirewallRules = @(
                        # File and printer sharing              
                        "@FirewallAPI.dll,-32752",

                        # Network discovery
                        "@FirewallAPI.dll,-28502"
            )
            if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $false)
            {
                        Set-NetFirewallRule -Group $FirewallRules -Profile Private -Enabled True
                        Set-NetFirewallRule -Profile Public, Private -Name FPS-SMB-In-TCP -Enabled True
                        Set-NetConnectionProfile -NetworkCategory Private
            }
}

# Disable "Network Discovery" and "File and Printers Sharing" for workgroup networks
Function DisableNetworkDiscovery {
            Write-Output "Disabling Network Discovery ..."
            $FirewallRules = @(
                        # File and printer sharing              
                        "@FirewallAPI.dll,-32752",

                        # Network discovery
                        "@FirewallAPI.dll,-28502"
            )
            if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $false)
            {
                        Set-NetFirewallRule -Group $FirewallRules -Profile Private -Enabled False
            }
}

# Automatically adjust active hours for me based on daily usage
Function AutomaticallyActiveHours {
            Write-Output "Setting Automatically Active Hours ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name SmartActiveHoursState -PropertyType DWord -Value 1 -Force
}

# Manually adjust active hours for me based on daily usage
Function ManuallyActiveHours {
            Write-Output "Setting Manually Active Hours ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name SmartActiveHoursState -PropertyType DWord -Value 0 -Force
}

# Restart as soon as possible to finish updating
Function EnableDeviceRestartAfterUpdate {
            Write-Output "Enabling Device Restart After Update ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name IsExpedited -PropertyType DWord -Value 1 -Force
}

# Don't restart as soon as possible to finish updating
Function DisableDeviceRestartAfterUpdate {
            Write-Output "Disabling Device Restart After Update ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name IsExpedited -PropertyType DWord -Value 0 -Force
}

#endregion System

#region Start menu

# Hide recently added apps in the Start menu
Function HideRecentlyAddedApps {
            Write-Output "Hiding Recently Added Apps ..."
            if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer))
            {
                        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
            }
            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name HideRecentlyAddedApps -PropertyType DWord -Value 1 -Force
}

# Show recently added apps in the Start menu
Function ShowRecentlyAddedApps {
            Write-Output "Showing Recently Added Apps ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name HideRecentlyAddedApps -Force -ErrorAction Ignore
}

# Hide app suggestions in the Start menu
Function HideAppSuggestions {
            Write-Output "Hiding App Suggestions ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338388Enabled -PropertyType DWord -Value 0 -Force
}

# Show app suggestions in the Start menu
Function ShowAppSuggestions {
            Write-Output "Showing App Suggestions ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338388Enabled -PropertyType DWord -Value 1 -Force
}

# Run the Windows PowerShell shortcut from the Start menu as Administrator
Function ElevatedRunPowerShellShortcut {
            Write-Output "Setting Elevated Run PowerShell Shortcut ..."
            [byte[]]$bytes = Get-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Encoding Byte -Raw
            $bytes[0x15] = $bytes[0x15] -bor 0x20
            Set-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Value $bytes -Encoding Byte -Force
}

# Run the Windows PowerShell shortcut from the Start menu as user
Function NonElevatedRunPowerShellShortcut {
            Write-Output "Setting NonElevated Run PowerShell Shortcut ..."
            [byte[]]$bytes = Get-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Encoding Byte -Raw
            $bytes[0x15] = $bytes[0x15] -bxor 0x20
            Set-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Value $bytes -Encoding Byte -Force
}

#endregion Start menu

#region UWP apps

# Disable Cortana autostarting
Function DisableCortanaAutostart {
            Write-Output "Disabling Cortana Autostart ..."
            if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
            {
                        if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId"))
                        {
                                    New-Item -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Force
                        }
                        New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Name State -PropertyType DWord -Value 1 -Force
            }
}

# Enable Cortana autostarting
Function EnableCortanaAutostart {
            Write-Output "Enabling Cortana Autostart ..."
            if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
            {
                        if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId"))
                        {
                                    New-Item -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Force
                        }
                        New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\Microsoft.549981C3F5F10_8wekyb3d8bbwe\CortanaStartupId" -Name State -PropertyType DWord -Value 2 -Force
            }
}

# Do not let UWP apps run in the background
Function DisableBackgroundUWPApps {
            Write-Output "Disabling Background UWP Apps ..."
            # Remove all excluded apps running in the background
            Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications | ForEach-Object -Process {
                        Remove-ItemProperty -Path $_.PsPath -Name * -Force
            }

            # Exclude apps from the Bundle only
            $BackgroundAccessApplications = @((Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications).PSChildName)
            $ExcludedBackgroundAccessApplications = @()
            foreach ($BackgroundAccessApplication in $BackgroundAccessApplications)
            {
                        if (Get-AppxPackage -PackageTypeFilter Bundle -AllUsers | Where-Object -FilterScript {$_.PackageFamilyName -eq $BackgroundAccessApplication})
                        {
                                    $ExcludedBackgroundAccessApplications += $BackgroundAccessApplication
                        }
            }

            Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications | Where-Object -FilterScript {$_.PSChildName -in $ExcludedBackgroundAccessApplications} | ForEach-Object -Process {
                        New-ItemProperty -Path $_.PsPath -Name Disabled -PropertyType DWord -Value 1 -Force
                        New-ItemProperty -Path $_.PsPath -Name DisabledByUser -PropertyType DWord -Value 1 -Force
            }

            # Open the "Background apps" page
            Start-Process -FilePath ms-settings:privacy-backgroundapps
}

# Let all UWP apps run in the background
Function EnableBackgroundUWPApps {
            Write-Output "Enabling Background UWP Apps ..."
            Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications | ForEach-Object -Process {
                        Remove-ItemProperty -Path $_.PsPath -Name * -Force
            }
}

#endregion UWP apps

#region Gaming

# Disable Xbox Game Bar
Function DisableXboxGameBar {
            Write-Output "Disabling Xbox Game Bar ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR -Name AppCaptureEnabled -PropertyType DWord -Value 0 -Force
            New-ItemProperty -Path HKCU:\System\GameConfigStore -Name GameDVR_Enabled -PropertyType DWord -Value 0 -Force
}

# Enable Xbox Game Bar
Function EnableXboxGameBar {
            Write-Output "Enabling Xbox Game Bar ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR -Name AppCaptureEnabled -PropertyType DWord -Value 1 -Force
            New-ItemProperty -Path HKCU:\System\GameConfigStore -Name GameDVR_Enabled -PropertyType DWord -Value 1 -Force
}

# Disable Xbox Game Bar tips
Function DisableXboxGameTips {
            Write-Output "Disabling Xbox Game Tips ..."
            if ((Get-AppxPackage -Name Microsoft.XboxGamingOverlay) -or (Get-AppxPackage -Name Microsoft.GamingApp))
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\GameBar -Name ShowStartupPanel -PropertyType DWord -Value 0 -Force
            }
}

# Enable Xbox Game Bar tips
Function EnableXboxGameTips {
            Write-Output "Enabling Xbox Game Tips ..."
            if ((Get-AppxPackage -Name Microsoft.XboxGamingOverlay) -or (Get-AppxPackage -Name Microsoft.GamingApp))
            {
                        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\GameBar -Name ShowStartupPanel -PropertyType DWord -Value 1 -Force
            }
}

# Enable hardware-accelerated GPU scheduling
Function EnableGPUScheduling {
            Write-Output "Enabling GPU Scheduling ..."
            if (Get-CimInstance -ClassName CIM_VideoController | Where-Object -FilterScript {($_.AdapterDACType -ne "Internal") -and ($null -ne $_.AdapterDACType)})
            {
                        # Determining whether an OS is not installed on a virtual machine
                        if ((Get-CimInstance -ClassName CIM_ComputerSystem).Model -notmatch "Virtual")
                        {
                                    # Checking whether a WDDM verion is 2.7 or higher
                                    $WddmVersion_Min = Get-ItemPropertyValue -Path HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\FeatureSetUsage -Name WddmVersion_Min
                                    if ($WddmVersion_Min -ge 2700)
                                    {
                                               New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name HwSchMode -PropertyType DWord -Value 2 -Force
                                    }
                        }
            }
}

# Disable hardware-accelerated GPU scheduling
Function DisableGPUScheduling {
            Write-Output "Disabling GPU Scheduling ..."
            New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name HwSchMode -PropertyType DWord -Value 1 -Force
}

#endregion Gaming

#region Microsoft Defender & Security

# Enable Microsoft Defender Exploit Guard network protection
Function EnableNetworkProtection {
            Write-Output "Enabling Network Protection ..."
            if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
            {
                        Set-MpPreference -EnableNetworkProtection Enabled
            }
}

# Disable Microsoft Defender Exploit Guard network protection
Function DisableNetworkProtection {
            Write-Output "Disabling Network Protection ..."
            if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
            {
                        Set-MpPreference -EnableNetworkProtection Disabled
            }
}

# Enable detection for potentially unwanted applications and block them
Function EnablePUAppsDetection {
            Write-Output "Enabling PU Apps Detection ..."
            if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
            {
                        Set-MpPreference -PUAProtection Enabled
            }
}

# Disable detection for potentially unwanted applications and block them
Function DisablePUAppsDetection {
            Write-Output "Disabling PU Apps Detection ..."
            if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
            {
                        Set-MpPreference -PUAProtection Disabled
            }
}

# Enable sandboxing for Microsoft Defender
Function EnableDefenderSandbox {
            Write-Output "Enabling Defender Sandbox ..."
            if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
            {
                        setx /M MP_FORCE_USE_SANDBOX 1
            }
}

# Disable sandboxing for Microsoft Defender
Function DisableDefenderSandbox {
            Write-Output "Disabling Defender Sandbox ..."
            if ((Get-MpComputerStatus).AntivirusEnabled -eq $true)
            {
                        setx /M MP_FORCE_USE_SANDBOX 0
            }
}

# Enable events auditing generated when a process is created (starts)
Function EnableAuditProcess {
            Write-Output "Enabling Audit Process ..."
            auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
}

# Disable events auditing generated when a process is created (starts)
Function DisableAuditProcess {
            Write-Output "Disabling Audit Process ..."
            auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:disable /failure:disable
}

# Include command line in process creation events
Function EnableCommandLineProcessAudit {
            Write-Output "Enabling Command Line Process Audit ..."
            # Enable events auditing generated when a process is created (starts)
            auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit -Name ProcessCreationIncludeCmdLine_Enabled -PropertyType DWord -Value 1 -Force
            #Set-Policy -Scope Computer -Path SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit -Name ProcessCreationIncludeCmdLine_Enabled -Type DWORD -Value 1

}

# Do not include command line in process creation events
Function DisableCommandLineProcessAudit {
            Write-Output "Disabling Command Line Process Audit ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit -Name ProcessCreationIncludeCmdLine_Enabled -Force -ErrorAction Ignore
            #Set-Policy -Scope Computer -Path SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit -Name ProcessCreationIncludeCmdLine_Enabled -Type CLEAR
}

# Create the "Process Creation" Event Viewer сustom view to log the executed processes and their arguments
Function EnableEventViewerCustomView {
            Write-Output "Enabling Event Viewer Custom View ..."
            # Enable events auditing generated when a process is created (starts)
            auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable

            # Include command line in process creation events
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit -Name ProcessCreationIncludeCmdLine_Enabled -PropertyType DWord -Value 1 -Force
            #Set-Policy -Scope Computer -Path SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit -Name ProcessCreationIncludeCmdLine_Enabled -Type DWORD -Value 1

            $XML = @"
<ViewerConfig>
            <QueryConfig>
                        <QueryParams>
                                    <UserQuery />
                        </QueryParams>
                        <QueryNode>
                                    <Name>$($Localization.EventViewerCustomViewName)</Name>
                                    <Description>$($Localization.EventViewerCustomViewDescription)</Description>
                                    <QueryList>
                                               <Query Id="0" Path="Security">
                                                           <Select Path="Security">*[System[(EventID=4688)]]</Select>
                                               </Query>
                                    </QueryList>
                        </QueryNode>
            </QueryConfig>
</ViewerConfig>
"@

            if (-not (Test-Path -Path "$env:ProgramData\Microsoft\Event Viewer\Views"))
            {
                        New-Item -Path "$env:ProgramData\Microsoft\Event Viewer\Views" -ItemType Directory -Force
            }

            # Save ProcessCreation.xml in the UTF-8 with BOM encoding
            Set-Content -Path "$env:ProgramData\Microsoft\Event Viewer\Views\ProcessCreation.xml" -Value $XML -Encoding UTF8 -Force
}

# Remove the "Process Creation" Event Viewer custom view
Function DisableEventViewerCustomView {
            Write-Output "Disabling Event Viewer Custom View ..."
            Remove-Item -Path "$env:ProgramData\Microsoft\Event Viewer\Views\ProcessCreation.xml" -Force -ErrorAction Ignore
}

# Enable logging for all Windows PowerShell modules
Function EnablePowerShellModulesLogging {
            Write-Output "Enabling PowerShell Modules Logging ..."
            if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames))
            {
                        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames -Force
            }
            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging -Name EnableModuleLogging -PropertyType DWord -Value 1 -Force
            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames -Name * -PropertyType String -Value * -Force
            #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging -Name EnableModuleLogging -Type DWORD -Value 1
            #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames -Name * -Type SZ -Value *
                        
}

# Disable logging for all Windows PowerShell modules
Function DisablePowerShellModulesLogging {
            Write-Output "Disabling PowerShell Modules Logging ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging -Name EnableModuleLogging -Force -ErrorAction Ignore
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames -Name * -Force -ErrorAction Ignore
            #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging -Name EnableModuleLogging -Type CLEAR
}

# Enable logging for all PowerShell scripts input to the Windows PowerShell event log
Function EnablePowerShellScriptsLogging {
            Write-Output "Enabling PowerShell Scripts Logging ..."
            if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging))
            {
                        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Force
            }
            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Name EnableScriptBlockLogging -PropertyType DWord -Value 1 -Force
            #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Name EnableScriptBlockLogging -Type DWORD -Value 1
}

# Disable logging for all PowerShell scripts input to the Windows PowerShell event log
Function DisablePowerShellScriptsLogging {
            Write-Output "Disabling PowerShell Scripts Logging ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Name EnableScriptBlockLogging -Force -ErrorAction Ignore
            #Set-Policy -Scope Computer -Path SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging -Name EnableScriptBlockLogging -Type CLEAR
}

# Disable apps and files checking within Microsoft Defender SmartScreen
Function DisableAppsSmartScreen {
            Write-Output "Disabling Apps SmartScreen ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name SmartScreenEnabled -PropertyType String -Value Off -Force
}

# Enable apps and files checking within Microsoft Defender SmartScreen
Function EnableAppsSmartScreen {
            Write-Output "Enabling Apps SmartScreen ..."
            New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name SmartScreenEnabled -PropertyType String -Value Warn -Force
}

# Microsoft Defender SmartScreen doesn't marks downloaded files from the Internet as unsafe
Function DisableSaveZoneInformation {
            Write-Output "Disabling Save Zone Information ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments -Name SaveZoneInformation -PropertyType DWord -Value 1 -Force
            #Set-Policy -Scope User -Path Software\Microsoft\Windows\CurrentVersion\Policies\Attachments -Name SaveZoneInformation -Type DWORD -Value 1
}

# Microsoft Defender SmartScreen marks downloaded files from the Internet as unsafe
Function EnableSaveZoneInformation {
            Write-Output "Enabling Save Zone Information ..."
            Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments -Name SaveZoneInformation -Force -ErrorAction Ignore
            #Set-Policy -Scope User -Path Software\Microsoft\Windows\CurrentVersion\Policies\Attachments -Name SaveZoneInformation -Type CLEAR
}

# Disable Windows Script Host
Function DisableWindowsScriptHost {
            Write-Output "Disabling Windows Script Host ..."
            if (-not (Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings"))
            {
                        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Force
            }
            New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name Enabled -PropertyType DWord -Value 0 -Force
}

# Enable Windows Script Host
Function EnableWindowsScriptHost {
            Write-Output "Enabling Windows Script Host ..."
            Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name Enabled -Force -ErrorAction Ignore
}

# Disable Windows Sandbox
Function DisableWindowsSandbox {
            Write-Output "Disabling Windows Sandbox ..."
            if (Get-WindowsEdition -Online | Where-Object -FilterScript {$_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*"})
            {
                        # Checking whether x86 virtualization is enabled in the firmware
                        if ((Get-CimInstance -ClassName CIM_Processor).VirtualizationFirmwareEnabled -eq $true)
                        {
                                    Disable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -Online -NoRestart
                        }
                        else
                        {
                                    try
                                    {
                                               # Determining whether Hyper-V is enabled
                                               if ((Get-CimInstance -ClassName CIM_ComputerSystem).HypervisorPresent -eq $true)
                                               {
                                                           Disable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -Online -NoRestart
                                               }
                                    }
                                    catch [System.Exception]
                                    {
                                               Write-Error -Message $Localization.EnableHardwareVT -ErrorAction SilentlyContinue
                                    }
                        }
            }
}

# Enable Windows Sandbox
Function EnableWindowsSandbox {
            Write-Output "Enabling Windows Sandbox ..."
            if (Get-WindowsEdition -Online | Where-Object -FilterScript {$_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*"})
            {
                        # Checking whether x86 virtualization is enabled in the firmware
                        if ((Get-CimInstance -ClassName CIM_Processor).VirtualizationFirmwareEnabled -eq $true)
                        {
                                    Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
                        }
                        else
                        {
                                    try
                                    {
                                               # Determining whether Hyper-V is enabled
                                               if ((Get-CimInstance -ClassName CIM_ComputerSystem).HypervisorPresent -eq $true)
                                               {
                                                           Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
                                               }
                                    }
                                    catch [System.Exception]
                                    {
                                               Write-Error -Message $Localization.EnableHardwareVT -ErrorAction SilentlyContinue
                                    }
                        }
            }
}

#endregion Microsoft Defender & Security

#region Context menu

# Show the "Extract all" item in the Windows Installer (.msi) context menu
Function ShowMSIExtractContext {
            Write-Output "Showing MSI Extract Context ..."
            if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\Msi.Package\shell\Extract\Command))
            {
                        New-Item -Path Registry::HKEY_CLASSES_ROOT\Msi.Package\shell\Extract\Command -Force
            }
            $Value = "{0}" -f "msiexec.exe /a `"%1`" /qb TARGETDIR=`"%1 extracted`""
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Msi.Package\shell\Extract\Command -Name "(default)" -PropertyType String -Value $Value -Force
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Msi.Package\shell\Extract -Name MUIVerb -PropertyType String -Value "@shell32.dll,-37514" -Force
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Msi.Package\shell\Extract -Name Icon -PropertyType String -Value "shell32.dll,-16817" -Force
}

# Hide the "Extract all" item from the Windows Installer (.msi) context menu
Function HideMSIExtractContext {
            Write-Output "Hiding MSI Extract Context ..."
            Remove-Item -Path Registry::HKEY_CLASSES_ROOT\Msi.Package\shell\Extract -Recurse -Force -ErrorAction Ignore
}

# Show the "Install" item in the Cabinet (.cab) filenames extensions context menu
Function ShowCABInstallContext {
            Write-Output "Showing CAB Install Context ..."
            if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs\Command))
            {
                        New-Item -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs\Command -Force
            }
            $Value = "{0}" -f "cmd /c DISM.exe /Online /Add-Package /PackagePath:`"%1`" /NoRestart & pause"
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs\Command -Name "(default)" -PropertyType String -Value $Value -Force
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs -Name MUIVerb -PropertyType String -Value "@shell32.dll,-10210" -Force
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs -Name HasLUAShield -PropertyType String -Value "" -Force
}

# Hide the "Install" item from the Cabinet (.cab) filenames extensions context menu
Function HideCABInstallContext {
            Write-Output "Hiding CAB Install Context ..."
            Remove-Item -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs -Recurse -Force -ErrorAction Ignore
}

# Show the "Run as different user" item in the .exe filename extensions context menu
Function ShowRunAsDifferentUserContext {
            Write-Output "Showing Run As Different User Context ..."
            Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\exefile\shell\runasuser -Name Extended -Force -ErrorAction Ignore
}

# Hide the "Run as different user" item from the .exe filename extensions context menu
Function HideRunAsDifferentUserContext {
            Write-Output "Hiding Run As Different User Context ..."
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\exefile\shell\runasuser -Name Extended -PropertyType String -Value "" -Force
}

# Hide the "Cast to Device" item from the media files and folders context menu
Function HideCastToDeviceContext {
            Write-Output "Hiding Cast To Device Context ..."
            if (-not (Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked"))
            {
                        New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" -Force
            }
            New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" -Name "{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" -PropertyType String -Value "Play to menu" -Force
}

# Show the "Cast to Device" item in the media files and folders context menu
Function ShowCastToDeviceContext {
            Write-Output "Showing Cast To Device Context ..."
            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" -Name "{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" -Force -ErrorAction Ignore
}

# Hide the "Share" item from the context menu
Function HideShareContext {
            Write-Output "Hiding Share Context ..."
            Remove-Item -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" -Recurse -Force -ErrorAction Ignore
}

# Show the "Share" item in the context menu
Function ShowShareContext {
            Write-Output "Showing Share Context ..."
            if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing"))
            {
                        New-Item -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" -Force
            }
            New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" -Name "(default)" -PropertyType String -Value "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" -Force                
}

# Hide the "Edit with Paint 3D" item from the media files context menu
Function HideEditWithPaint3DContext {
            Write-Output "Hiding Edit With Paint3D Context ..."
            if (Get-AppxPackage -Name Microsoft.MSPaint)
            {
                        $Extensions = @(".bmp", ".gif", ".jpe", ".jpeg", ".jpg", ".png", ".tif", ".tiff")
                        foreach ($Extension in $Extensions)
                        {
                                    New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\$Extension\Shell\3D Edit" -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
                        }
            }
}

# Show the "Edit with Paint 3D" item in the media files context menu
Function ShowEditWithPaint3DContext {
            Write-Output "Showing Edit With Paint3D Context ..."
            if (Get-AppxPackage -Name Microsoft.MSPaint)
            {
                        $Extensions = @(".bmp", ".gif", ".jpe", ".jpeg", ".jpg", ".png", ".tif", ".tiff")
                        foreach ($Extension in $Extensions)
                        {
                                    Remove-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\$Extension\Shell\3D Edit" -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
                        }
            }
}

# Hide the "Edit with Photos" item from the media files context menu
Function HideEditWithPhotosContext {
            Write-Output "Hiding Edit With Photos Context ..."
            if (Get-AppxPackage -Name Microsoft.Windows.Photos)
            {
                        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
            }
}

# Show the "Edit with Photos" item in the media files context menu
Function ShowEditWithPhotosContext {
            Write-Output "Showing Edit With Photos Context ..."
            if (Get-AppxPackage -Name Microsoft.Windows.Photos)
            {
                        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
            }
}

# Hide the "Create a new video" item from the media files context menu
Function HideCreateANewVideoContext {
            Write-Output "Hiding Create A New Video Context ..."
            if (Get-AppxPackage -Name Microsoft.Windows.Photos)
            {
                        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
            }
}

# Show the "Create a new video" item in the media files context menu
Function ShowCreateANewVideoContext {
            Write-Output "Showing Create A New Video Context ..."
            if (Get-AppxPackage -Name Microsoft.Windows.Photos)
            {
                        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
            }
}

# Hide the "Edit" item from the images context menu
Function HideImagesEditContext {
            Write-Output "Hiding Images Edit Context ..."
            if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed")
            {
                        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\edit -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
            }
}

# Show the "Edit" item in the images context menu
Function ShowImagesEditContext {
            Write-Output "Showing Images Edit Context ..."
            if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed")
            {
                        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\edit -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
            }
}

# Hide the "Print" item from the .bat and .cmd context menu
Function HidePrintCMDContext {
            Write-Output "Hiding Print CMD Context ..."
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\batfile\shell\print -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\cmdfile\shell\print -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
}

# Show the "Print" item in the .bat and .cmd context menu
Function ShowPrintCMDContext {
            Write-Output "Showing Print CMD Context ..."
            Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\batfile\shell\print -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
            Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\cmdfile\shell\print -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
}

# Hide the "Include in Library" item from the folders and drives context menu
Function HideIncludeInLibraryContext {
            Write-Output "Hiding Include In Library Context ..."
            New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\Library Location" -Name "(default)" -PropertyType String -Value "-{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" -Force
}


# Show the "Include in Library" item in the folders and drives context menu
Function ShowIncludeInLibraryContext {
            Write-Output "Showing Include In Library Context ..."
            New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\Library Location" -Name "(default)" -PropertyType String -Value "{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" -Force
}

# Hide the "Send to" item from the folders context menu
Function HideSendToContext {
            Write-Output "Hiding Send To Context ..."
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo -Name "(default)" -PropertyType String -Value "-{7BA4C740-9E81-11CF-99D3-00AA004AE837}" -Force
}

# Show the "Send to" item in the folders context menu
Function ShowSendToContext {
            Write-Output "Showing Send To Context ..."
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo -Name "(default)" -PropertyType String -Value "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" -Force
}

# Hide the "Turn on BitLocker" item from the drives context menu
Function HideBitLockerContext {
            Write-Output "Hiding BitLocker Context ..."
            if (Get-WindowsEdition -Online | Where-Object -FilterScript {($_.Edition -eq "Professional") -or ($_.Edition -like "Enterprise*")})
            {
                        if ((Get-BitLockerVolume).ProtectionStatus -eq "Off")
                        {
                                    New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde-elev -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
                        }
            }
}

# Show the "Turn on BitLocker" item in the drives context menu
Function ShowBitLockerContext {
            Write-Output "Showing BitLocker Context ..."
            if (Get-WindowsEdition -Online | Where-Object -FilterScript {$_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*"})
            {
                        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde-elev -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
            }
}

# Hide the "Bitmap image" item from the "New" context menu
Function HideBitmapImageNewContext {
            Write-Output "Hiding Bitmap Image New Context ..."
            if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed")
            {
                        Remove-Item -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Force -ErrorAction Ignore
            }
}

# Show the "Bitmap image" item to the "New" context menu
Function ShowBitmapImageNewContext {
            Write-Output "Showing Bitmap Image New Context ..."
            if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed")
            {
                        if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew))
                        {
                                    New-Item -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Force
                        }
                        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Name ItemName -PropertyType ExpandString -Value "@%systemroot%\system32\mspaint.exe,-59414" -Force
                        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Name NullFile -PropertyType String -Value "" -Force
            }
            else
            {
                        try
                        {
                                    # Check the internet connection
                                    $Parameters = @{
                                                Uri              = "https://www.google.com"
                                               Method           = "Head"
                                               DisableKeepAlive = $true
                                               UseBasicParsing  = $true
                                    }
                                    if (-not (Invoke-WebRequest @Parameters).StatusDescription)
                                    {
                                               return
                                    }

                                    Write-Information -MessageData "" -InformationAction Continue
                                    Write-Verbose -Message $Localization.Patient -Verbose

                                    Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*" | Add-WindowsCapability -Online
                        }
                        catch [System.Net.WebException]
                        {
                                    Write-Warning -Message $Localization.NoInternetConnection
                                    Write-Error -Message $Localization.NoInternetConnection -ErrorAction SilentlyContinue

                                    Write-Error -Message ($Localization.RestartFunction -f $MyInvocation.Line) -ErrorAction SilentlyContinue
                        }
            }
}

# Hide the "Rich Text Document" item from the "New" context menu
Function HideRichTextDocumentNewContext {
            Write-Output "Hiding Rich Text Document New Context ..."
            if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.WordPad*").State -eq "Installed")
            {
                        Remove-Item -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Force -ErrorAction Ignore
            }
}

# Show the "Rich Text Document" item to the "New" context menu
Function ShowRichTextDocumentNewContext {
            Write-Output "Showing Rich Text Document New Context ..."
            if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.WordPad*").State -eq "Installed")
            {
                        if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew))
                        {
                                    New-Item -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Force
                        }
                        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Name Data -PropertyType String -Value "{\rtf1}" -Force
                        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Name ItemName -PropertyType ExpandString -Value "@%ProgramFiles%\Windows NT\Accessories\WORDPAD.EXE,-213" -Force
            }
            else
            {
                        try
                        {
                                    # Check the internet connection
                                    $Parameters = @{
                                               Uri              = "https://www.google.com"
                                               Method           = "Head"
                                               DisableKeepAlive = $true
                                               UseBasicParsing  = $true
                                    }
                                    if (-not (Invoke-WebRequest @Parameters).StatusDescription)
                                    {
                                               return
                                    }
                                    Write-Information -MessageData "" -InformationAction Continue
                                    Write-Verbose -Message $Localization.Patient -Verbose

                                    Get-WindowsCapability -Online -Name "Microsoft.Windows.WordPad*" | Add-WindowsCapability -Online
                        }
                        catch [System.Net.WebException]
                        {
                                    Write-Warning -Message $Localization.NoInternetConnection
                                    Write-Error -Message $Localization.NoInternetConnection -ErrorAction SilentlyContinue

                                    Write-Error -Message ($Localization.RestartFunction -f $MyInvocation.Line) -ErrorAction SilentlyContinue
                        }
            }
}

# Hide the "Compressed (zipped) Folder" item from the "New" context menu
Function HideCompressedFolderNewContext {
            Write-Output "Hiding Compressed Folder New Context ..."
            Remove-Item -Path Registry::HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew -Force -ErrorAction Ignore
}

# Show the "Compressed (zipped) Folder" item to the "New" context menu
Function ShowCompressedFolderNewContext {
            Write-Output "Showing Compressed Folder New Context ..."
            if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew))
            {
                        New-Item -Path Registry::HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew -Force
            }
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew -Name Data -PropertyType Binary -Value ([byte[]](80,75,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)) -Force
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.zip\CompressedFolder\ShellNew -Name ItemName -PropertyType ExpandString -Value "@%SystemRoot%\system32\zipfldr.dll,-10194" -Force
}

# Enable the "Open", "Print", and "Edit" items if more than 15 files selected
Function EnableMultipleInvokeContext {
            Write-Output "Enabling Multiple Invoke Context ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name MultipleInvokePromptMinimum -PropertyType DWord -Value 300 -Force
}

# Disable the "Open", "Print", and "Edit" items if more than 15 files selected
Function DisableMultipleInvokeContext {
            Write-Output "Disabling Multiple Invoke Context ..."
            Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name MultipleInvokePromptMinimum -Force -ErrorAction Ignore
}

# Hide the "Look for an app in the Microsoft Store" item in the "Open with" dialog
Function HideUseStoreOpenWith {
            Write-Output "Hiding Use Store Open With ..."
            if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer))
            {
                        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
            }
            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoUseStoreOpenWith -PropertyType DWord -Value 1 -Force
}

# Show the "Look for an app in the Microsoft Store" item in the "Open with" dialog
Function ShowUseStoreOpenWith {
            Write-Output "Showing Use Store Open With ..."
            Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoUseStoreOpenWith -Force -ErrorAction Ignore
}

#endregion Context menu

#region Other

# Hide the search on the taskbar
Function HideTaskbarSearch {
            Write-Output "Hiding Taskbar Search ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 0 -Force
}

# Show the search icon on the taskbar
Function SearchIconTaskbarSearch {
            Write-Output "Showing Search Icon Taskbar Search ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 1 -Force
}

# Show the search box on the taskbar
Function SearchBoxTaskbarSearch {
            Write-Output "Showing Search Box Taskbar Search ..."
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 2 -Force
}

# Taskbar Always combine, hide labels
Function AlwaysCombineHideLabelsTaskbar {
            Write-Output "Setting Taskbar to Always combine, hide labels ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -PropertyType DWord -Value 0 -Force
}

# Taskbar Combine when taskbar is full
Function CombineWhenFullTaskbar {
            Write-Output "Setting Taskbar to combine when taskbar is full ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -PropertyType DWord -Value 1 -Force
}

# Taskbar Never combine
Function NeverCombineTaskbar {
            Write-Output "Setting Taskbar to never combine ..."
            New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -PropertyType DWord -Value 2 -Force
}

# View the Control Panel icons by category
Function CategoryControlPanelView {
            Write-Output "Setting Category Control Panel View ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Name AllItemsIconView -PropertyType DWord -Value 0 -Force
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Name StartupPage -PropertyType DWord -Value 0 -Force
}

# View the Control Panel icons by large icons
Function LargeIconsControlPanelView {
            Write-Output "Setting Large Icons Control Panel View ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Name AllItemsIconView -PropertyType DWord -Value 0 -Force
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Name StartupPage -PropertyType DWord -Value 1 -Force
}

# View the Control Panel icons by small icons
Function SmallIconsControlPanelView {
            Write-Output "Setting Small Icons Control Panel View ..."
            if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel))
            {
                        New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Force
            }
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Name AllItemsIconView -PropertyType DWord -Value 1 -Force
            New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel -Name StartupPage -PropertyType DWord -Value 1 -Force
}

#endregion Other


# Holder for None (Must keep)
Function None {
}

# Relaunch the script with administrator privileges
Function RequireAdmin {
            If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
                        Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $PSCommandArgs" -WorkingDirectory $pwd -Verb RunAs
                        Exit
            }
}

# Create Restore Point
Function CreateRestorePoint {
  Write-Output "Creating Restore Point incase something bad happens"
  Enable-ComputerRestore -Drive "C:\"
  Checkpoint-Computer -Description "RestorePoint1" -RestorePointType "MODIFY_SETTINGS"
}

# Normalize path to preset file
$preset = ""
$PSCommandArgs = $args
If ($args -And $args[0].ToLower() -eq "-preset") {
            $preset = Resolve-Path $($args | Select-Object -Skip 1)
            $PSCommandArgs = "-preset `"$preset`""
}

# Load function names from command line arguments or a preset file
If ($args) {
            $tweaks = $args
            If ($preset) {
                        $tweaks = Get-Content $preset -ErrorAction Stop | ForEach { $_.Trim() } | Where { $_ -ne "" -and $_[0] -ne "#" }
            }
}

# Call the desired tweak functions
$tweaks | ForEach { Invoke-Expression $_ }
