# Load the XML file
[xml]$xmlContent = Get-Content 'project.xml'

# Initialize an array to hold the output
$output = @()

# Loop through each 'Element' node in the XML
foreach ($element in $xmlContent.Element.Element) {
    # Check if the 'Type' is 'TASK'
    if ($element.Type -eq 'TASK') {
        # Create a custom object with 'label' and 'ID' properties
        $obj = New-Object PSObject -Property @{
            'Label' = $element.label
            'ID'    = $element.ID
        }
        
        # Add the object to the output array
        $output += $obj
    }
}

# Export the output array to a CSV file
$output | Export-Csv -Path 'code_task_map.csv' -NoTypeInformation
