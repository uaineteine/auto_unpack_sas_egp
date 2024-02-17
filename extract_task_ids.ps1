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
$destinationDir = Split-Path -Path $destinationPath -Parent
if (!(Test-Path -Path "processed")) {
    New-Item -ItemType Directory -Path "processed" | Out-Null
}
$tasks | Export-Csv -Path 'processed/code_task_map.csv' -NoTypeInformation
