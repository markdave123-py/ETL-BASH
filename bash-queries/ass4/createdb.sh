#!/bin/bash

# Database credentials
DB_HOST="${DB_HOST}"
DB_PORT="${DB_PORT}"
DB_NAME="${DB_NAME}"
DB_USER="${DB_USER}"
DB_PASS="${DB_PASS}"

# Directory containing CSV files
CSV_DIR="/Users/mac/Downloads/wetransfer_parch_posey_data"

# Ensure .pgpass file exists with correct permissions
PGPASS_FILE="$HOME/.pgpass"
echo "$DB_HOST:$DB_PORT:$DB_NAME:$DB_USER:$DB_PASS" > "$PGPASS_FILE"
chmod 600 "$PGPASS_FILE"

# Path to psql command
PSQL_CMD="psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME"

# Create the database if it does not exist
createdb -h $DB_HOST -p $DB_PORT -U $DB_USER $DB_NAME || true

# Function to infer and create table
create_table_from_csv() {
  local csv_file="$1"
  local table_name=$(basename "$csv_file" .csv)

  # Read the header of the CSV file
  local header=$(head -n 1 "$csv_file")

  # Generate SQL for creating table
  local sql="CREATE TABLE IF NOT EXISTS $table_name ("
  local i=1
  for column in $(echo "$header" | tr ',' ' '); do
    if [ $i -ne 1 ]; then
      sql+=", "
    fi
    sql+="$column TEXT"
    i=$((i + 1))
  done
  sql+=");"

  # Execute the SQL to create the table
  echo "$sql" | $PSQL_CMD

  # Load CSV file into the table
  echo "Loading $csv_file into $table_name"
  $PSQL_CMD -c "\copy $table_name FROM '$csv_file' CSV HEADER;"
}

# Iterate over CSV files and create tables
for csv_file in "$CSV_DIR"/*.csv; do
  create_table_from_csv "$csv_file"
done

echo "Data load complete. Now you can run the SQL queries."
