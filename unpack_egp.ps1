# Define the directory as the current execution directory
$dir = Get-Location

# Define the file extension
$fileExtension = ".egp"

# Get all archives files in the directory
$files = Get-ChildItem -Path $dir -Filter *$fileExtension

# Check if there are any files with the defined extension in the directory
if ($files) {
    # List all files for the user to pick from
    Write-Host "Here are the $fileExtension files in the directory:"
    for ($i=0; $i -lt $files.Count; $i++) {
        Write-Host ("{0}: {1}" -f $i, $files[$i].Name)
    }

    # Ask the user to enter the index of the file they want to unzip
    $fileIndex = Read-Host -Prompt "Enter the index of the $fileExtension file you want to unzip"

    # Define the source file path
    $src = Join-Path -Path $dir -ChildPath $files[$fileIndex].Name

    # Define the destination directory
    $dest = Join-Path -Path $dir -ChildPath "unpacked"

    # Check if the destination directory exists, if not, create it
    if (!(Test-Path -Path $dest)) {
        New-Item -ItemType directory -Path $dest
    }

    # Unzip the selected file to the destination directory
    Expand-Archive -Path $src -DestinationPath $dest
} else {
    Write-Host "No $fileExtension files found in the directory."
}
