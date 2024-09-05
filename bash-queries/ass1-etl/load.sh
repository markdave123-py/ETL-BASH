#!/bin/baash

export TRANSFORMED_DIR="Transformed"
export GOLD_DIR="Gold"
export TRANSFORMED_FILE="$TRANSFORMED_DIR/2023_year_finance.csv"

mkdir -p "$GOLD_DIR"

# Step 3: Load - Move the transformed file to the Gold directory
echo "Loading data into the Gold directory..."
mv "$TRANSFORMED_FILE" "$GOLD_DIR/"

# Check if the file was loaded
if [ -f "$GOLD_DIR/$(basename $TRANSFORMED_FILE)" ]; then
    echo "File has been successfully moved to the $GOLD_DIR directory."
else
    echo "Failed to move the file to the Gold directory."
    exit 1
fi