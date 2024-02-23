# Get the EGP file path from the arguments
$egpFilePath = $args[0]

# Extract the parent directory
$parentDirectory = Split-Path $egpFilePath -Parent

# Change the current directory to the parent directory
Set-Location -Path $parentDirectory

# Execute the scripts
& ".\unpack_egp.ps1"
& ".\extract_task_ids.ps1"
& ".\sort_code_tasks.ps1"

# Pause on exit
pause
