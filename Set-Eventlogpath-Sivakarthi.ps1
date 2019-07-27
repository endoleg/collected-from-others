#usage : Set-Eventlogpath -Computername <Computername>

Function Set-EventlogPath ([string]$Computername=$env:COMPUTERNAME,[string]$NewLogDir) 
{ 
    [reflection.assembly]::loadwithpartialname("System.Diagnostics.Eventing.Reader") 
    $Eventlogsession = New-Object System.Diagnostics.Eventing.Reader.EventLogSession -ArgumentList $Computername 
    Foreach($LogName in $Eventlogsession.GetLogNames())    { 
        $Eventlogconfig = New-Object System.Diagnostics.Eventing.Reader.EventLogConfiguration -ArgumentList $LogName,$Eventlogsession 
        $Logfilepath = $Eventlogconfig.LogFilePath 
        $Logfile = Split-Path $Logfilepath -Leaf 
        $NewLogFilePath = "$NewLogDir\$Logfile" 
 
         Write-Host -ForegroundColor Yellow $LogName,$Logfilepath,$Eventlogconfig.LogType 
         
        if (($Eventlogconfig.LogType -eq "Debug" -or$Eventlogconfig.LogType -eq " Analytical") -and $Eventlogconfig.IsEnabled) 
        { 
            $Eventlogconfig.IsEnabled = $false 
            $Eventlogconfig.SaveChanges()  
 
            $Eventlogconfig.LogFilePath = $NewLogFilePath 
            $Eventlogconfig.SaveChanges()  
 
            $Eventlogconfig.IsEnabled = $true 
            $Eventlogconfig.SaveChanges() 
            } 
        else 
        { 
            $Eventlogconfig.LogFilePath = $NewLogFilePath 
            $Eventlogconfig.SaveChanges() 
            } 
        } 
    } 
