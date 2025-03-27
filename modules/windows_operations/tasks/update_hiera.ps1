param (
    [string]$key,
    [string]$value
)

# Define Hiera config file path
$hieraFile = "C:\ProgramData\PuppetLabs\code\environments\production\data\common.yaml"

# Check if the Hiera file exists
if (!(Test-Path $hieraFile)) {
    Write-Error "Hiera configuration file not found: $hieraFile"
    exit 1
}

# Read existing Hiera YAML file
$yamlContent = Get-Content -Raw -Path $hieraFile | ConvertFrom-Yaml

# Update the key-value pair
$yamlContent.apache.$key = $value

# Save updated YAML back to file
$yamlContent | ConvertTo-Yaml | Set-Content -Path $hieraFile

Write-Host "Updated key '$key' with value '$value' in Hiera"
