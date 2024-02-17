# Load the XML file
[xml]$xmlContent = Get-Content 'unpacked/project.xml'

$tasks = $xmlContent | Select-Xml -XPath '//Element[@Type="SAS.EG.ProjectElements.CodeTask"]/Element' | ForEach-Object {
    [PSCustomObject]@{
        'Type' = $_.Node.Type
        'ID' = $_.Node.ID
        'Label' = $_.Node.label
    }
}
# Export the output array to a CSV file
$tasks | Export-Csv -Path 'code_task_map.csv' -NoTypeInformation
