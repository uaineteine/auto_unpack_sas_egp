# Define the directory as the current execution directory
$dir = Get-Location

# Get all .egp files in the directory
$egpFiles = Get-ChildItem -Path $dir -Filter *.zip

# Check if there are any .egp files in the directory
if ($egpFiles) {
    # List all .egp files for the user to pick from
    Write-Host "Here are the .egp files in the directory:"
    for ($i=0; $i -lt $egpFiles.Count; $i++) {
        Write-Host ("{0}: {1}" -f $i, $egpFiles[$i].Name)
    }

    # Ask the user to enter the index of the .egp file they want to unzip
    $fileIndex = Read-Host -Prompt 'Enter the index of the .egp file you want to unzip'

    # Define the source file path
    $src = Join-Path -Path $dir -ChildPath $egpFiles[$fileIndex].Name

    # Define the destination directory
    $dest = Join-Path -Path $dir -ChildPath "unpacked"

    # Check if the destination directory exists, if not, create it
    if (!(Test-Path -Path $dest)) {
        New-Item -ItemType directory -Path $dest
    }

    # Unzip the selected .egp file to the destination directory
    Expand-Archive -Path $src -DestinationPath $dest
} else {
    Write-Host "No .egp files found in the directory."
}
