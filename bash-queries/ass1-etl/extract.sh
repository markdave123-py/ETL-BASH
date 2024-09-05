#!/bin/bash

CSV_URL="https://github.com/Idowuilekura/cde_linux_git_assignment-/raw/main/sample.csv"


# Define directories and file names
RAW_DIR="./raw"          # Directory to save the downloaded CSV
RAW_FILE="$RAW_DIR/sample.csv"  # Path for the downloaded file

# Function to check if the last command executed successfully
function check_success {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Step 1: Create the raw directory if it does not exist
echo "Step 1: Creating the raw directory..."
mkdir -p $RAW_DIR  # -p ensures that no error is raised if the directory already exists
check_success "Failed to create raw directory."
echo "Directory $RAW_DIR is ready."

# Step 2: Download the CSV file from the provided URL
echo "Step 2: Downloading the CSV file from the URL..."
curl -L -o $RAW_FILE $CSV_URL  # -L follows redirects, and -o specifies the output file
check_success "Failed to download the CSV file from $CSV_URL."
echo "CSV file successfully downloaded and saved to $RAW_FILE."

# Step 3: Verify that the file has been saved correctly
echo "Step 3: Verifying that the CSV file was saved..."
if [ -f "$RAW_FILE" ]; then  # Check if the file exists
    echo "File $RAW_FILE has been successfully saved in the raw directory."
else
    echo "Error: The file was not saved correctly."
    exit 1
fi

echo "Extract process completed successfully."
