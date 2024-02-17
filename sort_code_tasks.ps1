# Import the CSV file
$csvData = Import-Csv -Path "code_task_map.csv"

# Iterate over each row in the CSV
foreach ($row in $csvData) {
    # Define the source and destination paths
    $sourcePath = "unpacked/$($row.ID)/code.sas"
    $destinationPath = "processed/$($row.Label).sas"

    # Check if the source file exists
    if (Test-Path -Path $sourcePath) {
        # Create the destination directory if it doesn't exist
        $destinationDir = Split-Path -Path $destinationPath -Parent
        if (!(Test-Path -Path $destinationDir)) {
            New-Item -ItemType Directory -Path $destinationDir | Out-Null
        }

        # Copy the file
        Copy-Item -Path $sourcePath -Destination $destinationPath
    } else {
        Write-Host "Source file $sourcePath does not exist."
    }
}
