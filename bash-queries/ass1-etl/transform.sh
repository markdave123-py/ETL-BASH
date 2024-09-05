#!/bin/bash

# Define the input file and output directory
input_file="./raw/sample.csv"
output_dir="Transformed"
output_file="$output_dir/2023_year_finance.csv"

# Create the Transformed directory if it doesn't exist
mkdir -p "$output_dir"

# Use awk to transform the CSV
awk -F, 'NR==1 {
    for (i=1; i<=NF; i++) {
        if ($i == "Variable_code") $i = "variable_code"
    }
}
{
    print $1 "," $9 "," $5 "," $6
}' "$input_file" > "$output_file"

# Check if the file was created and provide confirmation
if [ -f "$output_file" ]; then
    echo "File successfully created and loaded into $output_dir"
else
    echo "There was an error creating the file"
fi
