# Copy files into a staging dir 
Copy-Item -Path "package_manifest/*" -Destination "./builds/staging"
Copy-Item -Path "unpacking_scripts/*.ps1" -Destination "./builds/staging"

# Navigate to your project directory
cd "builds/staging"

# Create a .zip file from your project directory
Compress-Archive -Path "*" -DestinationPath "../pack/UnpackEGP_0.1.zip"

cd "../pack"

# Rename the .zip file to .vsix
Rename-Item -Path "UnpackEGP_0.1.zip" -NewName "UnpackEGP_0.1.vsix"

cd "../staging"

# Clean up the temporary directory
Remove-Item -Recurse -Force "*"

cd "../.."