#!/bin/bash

# Define the standard path for the YAML file
FILE_PATH="/etc/puppetlabs/code/environments/production/data/common.yaml"

echo "Checking if file exists: $FILE_PATH"

if [[ ! -f "$FILE_PATH" ]]; then
  echo "Error: File $FILE_PATH not found."
  exit 1
fi

echo "File found. Proceeding with updates..."

# Loop through the key-value pairs
while [[ "$#" -gt 0 ]]; do
  KEY="$1"
  VALUE="$2"
  shift 2 # Move to the next key-value pair

  echo "Updating: $KEY to $VALUE"

  # Use sed to update the key-value in the YAML file
  sed -i "s|^\($KEY:\s*\).*|\1\"$VALUE\"|" "$FILE_PATH"

  if [[ $? -ne 0 ]]; then
    echo "Error updating $KEY in $FILE_PATH"
    exit 2
  fi
done

echo "All updates completed successfully!"
