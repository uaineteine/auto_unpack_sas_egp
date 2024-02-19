$directory = ".\processed" # Replace with your directory path
$prompt = "Please port this SAS process into a python script, using pyspark and pandas `n"
$outputFile = ".\processed\prompt_for_bing.txt" # Replace with your desired output file path

# Write the prompt to the output file
$prompt | Out-File -FilePath $outputFile

Get-ChildItem -Path $directory -Filter *.sas | ForEach-Object {
    $filepath = $_.FullName
    "Filepath: $filepath" | Out-File -FilePath $outputFile -Append
    "Contents:" | Out-File -FilePath $outputFile -Append
    Get-Content -Path $filepath | Out-File -FilePath $outputFile -Append
    "`n" | Out-File -FilePath $outputFile -Append
}
