#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="/path/to/source_folder"
DEST_DIR="/path/to/json_and_CSV"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Check if the source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Source directory does not exist: $SOURCE_DIR"
  exit 1
fi

# Move CSV and JSON files from the source directory to the destination directory
# Find .csv and .json files and move them
for file in "$SOURCE_DIR"/*.{csv,json}; do
  # Check if there are files that match the pattern
  if [[ -e "$file" ]]; then
    mv "$file" "$DEST_DIR"
    echo "Moved: $(basename "$file")"
  fi
done

echo "All .csv and .json files have been moved to $DEST_DIR."
