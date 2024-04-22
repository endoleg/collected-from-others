#Modul PoShEvents
Install-Module -Name PoShEvents
#https://poshevents.anovelidea.org/en/latest/

#function new-eventfilterxml
# https://poshevents.anovelidea.org/en/latest/New-EventFilterXml/

New-EventFilterXml -LogName Security -Provider Microsoft-Windows-Security-Auditing -Since (New-TimeSpan -Hours 3) -LevelDisplayName LogAlways

#New-EventDataFilter
#https://poshevents.anovelidea.org/en/latest/New-EventDataFilter/

$EventData = @{ UserData = @{ DocumentPrinted = @{Param2 = "MyDocumentName" }}}
New-EventDataFilter -Hashtable $EventData

