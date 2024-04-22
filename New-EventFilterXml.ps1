#https://poshevents.anovelidea.org/en/latest/New-EventFilterXml/
function New-EventFilterXml {
    [CmdLetBinding()]
    param(
      [string]$LogName,
      [xml]$SelectXml,
      [xml]$SuppressXml,
      [string]$EventDataFilter
    )

  $stringBuilder = [System.Text.StringBuilder]::new()

  $xmlWriterSettings = [System.Xml.XmlWriterSettings]::new()
  $xmlWriterSettings.OmitXmlDeclaration = $true
  $xmlWriterSettings.Indent = $true
  $xmlWriterSettings.IndentChars = ('    ')

  $xmlWriter = [System.Xml.XmlWriter]::Create($StringBuilder,$xmlWriterSettings)

  $xmlWriter.WriteStartDocument()
    $xmlWriter.WriteStartElement('QueryList')
      $xmlWriter.WriteStartElement('Query')
        $xmlWriter.WriteAttributeString('Id',0)
        $xmlWriter.WriteAttributeString('Path',$LogName)
      $xmlWriter.WriteEndElement()
    $xmlWriter.WriteEndElement()
  $xmlWriter.WriteEndDocument()

  $xmlWriter.Flush()
  $xmlWriter.Close()
  $stringBuilder



    [Xml]$XmlFilter = [System.Xml.XmlDocument]::new()
    $XmlFilter.LoadXml('<QueryList></QueryList>')

    [System.Xml.XmlElement]$Query = $XmlFilter.CreateElement('Query')
    [void]$XmlFilter.DocumentElement.AppendChild($Query)
    [void]$XmlFilter.DocumentElement.LastChild.SetAttribute('Id','0')
    [void]$XmlFilter.DocumentElement.LastChild.SetAttribute('Path',$LogName)

    foreach ($Select in $SelectXml) {
      if ($Select.LocalName -eq 'Select') {
        $XmlNode = $XmlFilter.CreateNode('element','Select','')
        [void]$XmlNode.SetAttribute('Path',$LogName)
        if ($EventDataFilter) {
          $XmlTextNode = $XmlFilter.CreateTextNode(($Select.InnerText,$EventDataFilter -join ' and '))
        } else {
          $XmlTextNode = $XmlFilter.CreateTextNode($Select.InnerText)
        }
        [void]$XmlNode.AppendChild($XmlTextNode)
        [void]$XmlFilter.DocumentElement.LastChild.AppendChild($XmlNode)

        #[System.Xml.XmlElement]$SelectFilter = $XmlFilter.CreateElement('Select')
        #[void]$XmlFilter.DocumentElement.LastChild.AppendChild($SelectFilter)
        #[void]$XmlFilter.DocumentElement.LastChild.SetAttribute('Path',$LogName)



        #$ImportedNode = $XmlFilter.ImportNode($Select,$true)
        #[void]$XmlFilter.DocumentElement.LastChild.AppendChild($Select)
      } elseif ($Select.LocalName -eq 'Suppress') {
        #$ImportedNode = $XmlFilter.ImportNode($Select,$true)
        #[void]$XmlFilter.DocumentElement.LastChild.AppendChild($Select)
      } else {
        'Something Happened' | Write-Warning
        return
      }

      #$XmlNode = $XmlFilter.CreateNode('element','Select','')
      #$XmlTextNode = $XmlFilter.CreateTextNode($Select.InnerText)
      #[void]$XmlFilter.DocumentElement.LastChild.AppendChild($XmlTextNode)

    }

    $XmlFilter

}

#[System.Xml.XmlElement]$Select = $XmlFilter.CreateElement('Select')
#[void]$Select.SetAttribute('Path',$LogName)





<#

Get-WinEvent -FilterHashtable @{LogName='Security';Keywords='4503599627370496'}

Failure Audit 4503599627370496
Success audit 9007199254740992


#https://docs.microsoft.com/en-us/previous-versions//aa385231(v=vs.85)

[XmlText]$Text = $XmlDocument.CreateTextNode('19.95')

$XmlDocument.DocumentElement.LastChild.AppendChild($Text)

[System.Xml.XmlAttribute]$FilterId = $XmlFilter.CreateAttribute('Id')
$FilterId.Value = '0'


[xml]$Xml = @"
<QueryList>
  <Query Id="0" Path="Application">
    <Select Path="Application">*[System[(Level=1  or Level=2 or Level=3) and TimeCreated[timediff(@SystemTime) &lt;= 2592000000]]]</Select>
  </Query>
</QueryList>
"@

#'*[System[Provider[@Name=''Microsoft-Windows-Security-SPP''] and '
#'*[System[Provider[@Name=''Microsoft-Windows-Security-Auditing''] and '

<QueryList>
  <Query>
    <Select Path="Application">*[System[(Level=1  or Level=2 or Level=3) and TimeCreated[timediff(@SystemTime) &lt;= 2592000000]]]</Select>
  </Query>
</QueryList>

#https://docs.microsoft.com/en-us/windows/win32/wes/queryschema-select-querytype-element

The following XML example shows a set of <Query> elements that specify a set of selectors and suppressors for the query.
<QueryList>
  <Query Id="0" Path="Application">
    <Select Path="Application">
        *[System[(Level &lt;= 3) and
        TimeCreated[timediff(@SystemTime) &lt;= 86400000]]]
    </Select>
    <Suppress Path="Application">
        *[System[(Level = 2)]]
    </Suppress>
    <Select Path="System">
        *[System[(Level=1  or Level=2 or Level=3) and
        TimeCreated[timediff(@SystemTime) &lt;= 86400000]]]
    </Select>
  </Query>
</QueryList>

The following XML example shows how to use a query to select all the events from the System channel that occurred in the last 24 hours.
<QueryList>
  <Query Id="0" Path="System">
    <Select Path="System">*[System[(Level=2) and
        TimeCreated[timediff(@SystemTime) &lt;= 86400000]]]</Select>
  </Query>
</QueryList>

The following XML example shows how to use a query to select all the events in the System channel, except those that have a Severity equal to Informational (Level equal to 4).
<Query id="1" path="System">
    <Select>*</Select>
    <Suppress>*[System/Level=4]</Suppress>
</Query>


<QueryList>
  <Query Id="0" Path="System">
    <Select Path="System">*[System[(EventID=1014 or EventID=107 or  (EventID &gt;= 7000 and EventID &lt;= 7999) )]]</Select>
  </Query>
</QueryList>


<QueryList>
  <Query Id="0" Path="System">
    <Select Path="System">*[System[(Level=1  or Level=2 or Level=3) and (EventID=1014 or EventID=107 or  (EventID &gt;= 7000 and EventID &lt;= 7999) )]]</Select>
  </Query>
</QueryList>


<QueryList>
  <Query Id="0" Path="System">
    <Select Path="System">*[System[(Level=1  or Level=2 or Level=3) and (EventID=1014 or EventID=107 or  (EventID &gt;= 7000 and EventID &lt;= 7999) ) and TimeCreated[timediff(@SystemTime) &lt;= 2592000000]]]</Select>
  </Query>
</QueryList>

<QueryList>
  <Query Id="0" Path="System">
    <Select Path="System">*[System[(Level=1  or Level=2 or Level=3) and (EventID=1014 or EventID=107 or  (EventID &gt;= 7000 and EventID &lt;= 7999) ) and TimeCreated[@SystemTime&gt;='2019-07-28T20:20:34.000Z' and @SystemTime&lt;='2019-07-31T20:20:34.999Z']]]</Select>
  </Query>
</QueryList>

<QueryList><Query Id="0" Path="Application"><Select Path="Application">*[System[Provider[@Name='Git Credential Manager'] and TimeCreated[timediff(@SystemTime) &amp;lt;= 2592000000]]]</Select></Query></QueryList>

<QueryList><Query Id="0" Path="Application"><Select Path="Application">*[System[Provider[@Name='Git Credential Manager'] and TimeCreated[timediff(@SystemTime) &lt;= 2592000000]]]</Select></Query></QueryList>

<QueryList><Query Id="0" Path="Application"><Select Path="Application">*[System[Provider[@Name='Git Credential Manager'] and TimeCreated[timediff(@SystemTime) &amp;lt;= 2592000000]]]</Select></Query></QueryList>

<QueryList><Query Id="0" Path="Application"><Select Path="Application">*[System[Provider[@Name='Git Credential Manager'] and TimeCreated[timediff(@SystemTime) &lt;= 2592000000]]]</Select></Query></QueryList>

<QueryList><Query Id="0" Path="Application"><Select Path="Application">*[System[Provider[@Name='Git Credential Manager'] and TimeCreated[timediff(@SystemTime) &lt;= 2592000000]]]</Select></Query></QueryList>

<QueryList><Query Id="0" Path="Application"><Select Path="Application">*[System[Provider[@Name='Git Credential Manager'] and TimeCreated[timediff(@SystemTime) &lt;= 2592000000]]]</Select></Query></QueryList>



<#

*[UserData[DocumentPrinted[
    " (Param3='" + $UserName + "') "
    " (Param4='" + $ClientMachineName + "') "
    " (Param5='" + $PrinterName + "') "
    " (Param6='" + $PrinterPort + "') "
    "]]]"

$Hashtable2 = @{
    UserData = @{
        DocumentPrinted = @{
            Param3 = 'UserName'
            Param4 = 'ClientMachineName'
            Param5 = 'PrinterName'
            Param6 = 'PrinterPort'
        }
    }
}

$Hashtable2 = @{
    UserData = @{
        DocumentPrinted = @{
            Param5 = 'PoshEventsPrinter2'
        }
    }
}

*[EventData[Data[@Name=''LogonType''] and (Data=''3'' or Data=''8'' or Data=''10'')]]

$Hashtable2 = @{
    EventData = @{
        Data = @{
            Name = 'LogonType'
            Data = 3,8,10
        }
    }
}
#>

#>
