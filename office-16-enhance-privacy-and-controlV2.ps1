

<#
https://raw.githubusercontent.com/RedAndBlueEraser/office-16-enhance/refs/heads/master/office-16-enhance-privacy-and-control.ps1
office-16-enhance-privacy-and-control.ps1
Version 20210108
Written by Harry Wong (RedAndBlueEraser)
#>

<#
.SYNOPSIS
A PowerShell script to automatically configure for some privacy and control settings in Office 365 ProPlus, Office 2019, Office 2016.
.DESCRIPTION
This script minimises telemetry and data collection sent to Microsoft and third parties, and optionally, disable online services and first run experiences.
.PARAMETER OptionalOptimization
By default, the standard optimisation only changes settings that should not impact any functionality. For example: turning off telemetry data collection, and tightening privacy controls. Optional optimisation goes further by disabling online services and first run experiences.
.EXAMPLE
./office-16-enhance-privacy-and-control.ps1
Configure while avoid making changes that remove or disable features or functions, such as 3D Maps, PowerPoint Designer and Suggested replies.
.EXAMPLE
./office-16-enhance-privacy-and-control.ps1 -OptionalOptimization
Configure extra settings in addition to standard changes, making changes that remove or disable features or functions, such as 3D Maps, PowerPoint Designer and Suggested replies.
#>

Param(
    [switch]$OptionalOptimization,

    [bool]$Updatereliabilitydata = $OptionalOptimization.isPresent,
    [bool]$Shownfirstrunoptin = $OptionalOptimization.isPresent,
    [bool]$Skydrivesigninoption = $OptionalOptimization.isPresent,
    [bool]$Signinoptions = $OptionalOptimization.isPresent,
    [bool]$Bootedrtm = $OptionalOptimization.isPresent,
    [bool]$Disablemovie = $OptionalOptimization.isPresent,
    [bool]$Controllerconnectedservicesenabled = $OptionalOptimization.isPresent,
    [bool]$Downloadcontentdisabled = $OptionalOptimization.isPresent,
    [bool]$Usercontentdisabled = $OptionalOptimization.isPresent,
    [bool]$Disconnectedstate = $OptionalOptimization.isPresent
)

# See https://www.tenforums.com/microsoft-office-365/157155-microsoft-office-365-privacy-telemetry.html
# Send personal information
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\sendcustomerdata => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common" /v sendcustomerdata /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common" /v sendcustomerdata /t REG_DWORD /d 0 /f

# Allow users to submit feedback to Microsoft
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\feedback\enabled => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Feedback" /v enabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v enabled /t REG_DWORD /d 0 /f
# Allow Microsoft to follow up on feedback submitted by users
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\feedback\includeemail => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Feedback" /v includeemail /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v includeemail /t REG_DWORD /d 0 /f
# Allow users to include screenshots and attachments when they submit feedback to Microsoft
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\feedback\includescreenshot => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Feedback" /v includescreenshot /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v includescreenshot /t REG_DWORD /d 0 /f
# Allow users to receive and respond to in-product surveys from Microsoft
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\feedback\msoridsurveyenabled => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Feedback" /v msoridsurveyenabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Feedback" /v msoridsurveyenabled /t REG_DWORD /d 0 /f

# Enable mail logging (troubleshooting)
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\outlook\options\mail\enablelogging => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v enablelogging /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Outlook\Options\Mail" /v enablelogging /t REG_DWORD /d 0 /f

# Configure the level of client software diagnostic data sent by Office to Microsoft
# HKEY_CURRENT_USER\software\policies\microsoft\office\common\clienttelemetry\sendtelemetry => 0. Neither (3)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\Common\ClientTelemetry" /v sendtelemetry /t REG_DWORD /d 3 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\Common\ClientTelemetry" /v sendtelemetry /t REG_DWORD /d 3 /f
#
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\Common\ClientTelemetry" /v disabletelemetry /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\Common\ClientTelemetry" /v disabletelemetry /t REG_DWORD /d 1 /f

# Enable Customer Experience Improvement Program
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\qmenable => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common" /v qmenable /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common" /v qmenable /t REG_DWORD /d 0 /f
if ($Updatereliabilitydata) {
    # Automatically receive small updates to improve reliability
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\updatereliabilitydata => Disabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common" /v updatereliabilitydata /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common" /v updatereliabilitydata /t REG_DWORD /d 0 /f
}

if ($Shownfirstrunoptin) {
    # Disable Opt-in Wizard on first run
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\general\shownfirstrunoptin => Enabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\General" /v shownfirstrunoptin /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\General" /v shownfirstrunoptin /t REG_DWORD /d 1 /f
}
if ($Skydrivesigninoption) {
    # Show OneDrive Sign In
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\general\skydrivesigninoption => Disabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\General" /v skydrivesigninoption /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\General" /v skydrivesigninoption /t REG_DWORD /d 0 /f
}
if ($Signinoptions) {
    # Block signing into Office
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\signin\signinoptions => 3. None allowed (3)
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\SignIn" /v signinoptions /t REG_DWORD /d 3 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\SignIn" /v signinoptions /t REG_DWORD /d 3 /f
}

# Improve Proofing Tools
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\ptwatson\ptwoptin => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\PTWatson" /v ptwoptin /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\PTWatson" /v ptwoptin /t REG_DWORD /d 0 /f

if ($Bootedrtm) {
    # Disable Office First Run on application boot
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\firstrun\bootedrtm => Enabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\FirstRun" /v bootedrtm /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\FirstRun" /v bootedrtm /t REG_DWORD /d 1 /f
}
if ($Disablemovie) {
    # Disable First Run Movie
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\firstrun\disablemovie => Enabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\FirstRun" /v disablemovie /t REG_DWORD /d 1 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\FirstRun" /v disablemovie /t REG_DWORD /d 1 /f
}

if ($Controllerconnectedservicesenabled) {
    # Allow the use of additional optional connected experiences in Office
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\privacy\controllerconnectedservicesenabled => Disabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Privacy" /v controllerconnectedservicesenabled /t REG_DWORD /d 2 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v controllerconnectedservicesenabled /t REG_DWORD /d 2 /f
}
if ($Downloadcontentdisabled) {
    # Allow the use of connected experiences in Office that download online content
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\privacy\downloadcontentdisabled => Disabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Privacy" /v downloadcontentdisabled /t REG_DWORD /d 2 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v downloadcontentdisabled /t REG_DWORD /d 2 /f
}
if ($Usercontentdisabled) {
    # Allow the use of connected experiences in Office that analyze content
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\privacy\usercontentdisabled => Disabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Privacy" /v usercontentdisabled /t REG_DWORD /d 2 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v usercontentdisabled /t REG_DWORD /d 2 /f
}
if ($Disconnectedstate) {
    # Allow the use of connected experiences in Office
    # HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\common\privacy\disconnectedstate => Disabled
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Privacy" /v disconnectedstate /t REG_DWORD /d 2 /f
    reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\Common\Privacy" /v disconnectedstate /t REG_DWORD /d 2 /f
}

# Turn on telemetry data collection
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\OSM\enablelogging => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM" /v EnableLogging /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM" /v EnableLogging /t REG_DWORD /d 0 /f
# Turn on data uploading for Office Telemetry Agent
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\OSM\enableupload => Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM" /v EnableUpload /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM" /v EnableUpload /t REG_DWORD /d 0 /f

# Office applications to exclude from Office Telemetry Agent reporting
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\wdsolution => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\xlsolution => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\pptsolution => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\olksolution => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\accesssolution =>jj True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\projectsolution => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\publishersolution => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\visiosolution => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedapplications\onenotesolution => True
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v wdsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v xlsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v pptsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v olksolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v accesssolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v projectsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v publishersolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v visiosolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedApplications" /v onenotesolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v wdsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v xlsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v pptsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v olksolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v accesssolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v projectsolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v publishersolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v visiosolution /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedApplications" /v onenotesolution /t REG_DWORD /d 1 /f

# Office solutions to exclude from Office Telemetry Agent reporting
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedsolutiontypes\documentfiles => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedsolutiontypes\templatefiles => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedsolutiontypes\comaddins => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedsolutiontypes\appaddins => True
# HKEY_CURRENT_USER\software\policies\microsoft\office\16.0\osm\preventedsolutiontypes\agave => True
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v documentfiles /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v templatefiles /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v comaddins /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v appaddins /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v agave /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v documentfiles /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v templatefiles /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v comaddins /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v appaddins /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\16.0\OSM\PreventedSolutionTypes" /v agave /t REG_DWORD /d 1 /f
