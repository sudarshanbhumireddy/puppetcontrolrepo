#!/bin/bash

# Define the standard path for the YAML file
FILE_PATH="/etc/puppetlabs/code/environments/production/data/common.yaml"

if [[ ! -f "$FILE_PATH" ]]; then
  echo "Error: File $FILE_PATH not found."
  exit 1
fi

# Loop through the key-value pairs
while [[ "$#" -gt 0 ]]; do
  KEY="$1"
  VALUE="$2"
  shift 2 # Move to the next key-value pair

  # Update the key-value in the YAML file
  sed -i "s|^\($KEY:\s*\).*|\1\"$VALUE\"|" "$FILE_PATH"
  echo "Updated $KEY to $VALUE in $FILE_PATH"
done
